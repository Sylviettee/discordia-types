--[[
The MIT License (MIT)

Copyright (c) 2016-2022 SinisterRectus
Copyright (c) 2021-2022 Soviet Kitsune (modified to output types)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

-- Converts Discordia doc comments into EmmyLua doc comments for types
-- Uses code from Discordia doc generator
-- Fun time --

local fs = require('fs')
local pathjoin = require('pathjoin')

local insert, concat = table.insert, table.concat
local f = string.format
local pathJoin = pathjoin.pathJoin

local function scan(dir)
   for fileName, fileType in fs.scandirSync(dir) do
      local path = pathJoin(dir, fileName)
      if fileType == 'file' then
         coroutine.yield(path)
      else
         scan(path)
      end
   end
end

local function match(s, pattern) -- only useful for one capture
   return assert(s:match(pattern), s)
end

local function gmatch(s, pattern, hash) -- only useful for one capture
   local tbl = {}
   if hash then
      for k in s:gmatch(pattern) do
         tbl[k] = true
      end
   else
      for v in s:gmatch(pattern) do
         insert(tbl, v)
      end
   end
   return tbl
end

local function matchType(s)
   return s:match('^@(%S+)')
end

local function matchComments(s)
   return s:gmatch('--%[=%[%s*(.-)%s*%]=%]')
end

local function matchClassName(s)
   return match(s, '@c (%S+)')
end

local function matchMethodName(s)
   return match(s, '@m (%S+)')
end

local function matchDescription(s)
   return match(s, '@d (.+)'):gsub('%s+', ' ')
end

local function matchParents(s)
   return gmatch(s, 'x (%S+)')
end

local function matchReturns(s)
   return gmatch(s, '@r (%S+)')
end

local function matchTags(s)
   return gmatch(s, '@t (%S+)', true)
end

local function matchMethodTags(s)
   return gmatch(s, '@mt (%S+)', true)
end

local function matchProperty(s)
   local a, b, c = s:match('@p (%S+) (%S+) (.+)')
   return {name = assert(a, s), type = assert(b, s), desc = assert(c, s):gsub('%s+', ' ')}
end

local function matchParameters(s)
   local ret = {}
   for optional, paramName, paramType in s:gmatch('@(o?)p (%S+) (%S+)') do
      insert(ret, {paramName, paramType, optional == 'o'})
   end
   return ret
end

local function matchMethod(s)
   return {
      name = matchMethodName(s),
      desc = matchDescription(s),
      parameters = matchParameters(s),
      returns = matchReturns(s),
      tags = matchTags(s)
   }
end

----

local docs = {}

local function newClass()
   local class = {
      methods = {},
      statics = {},
      properties = {}
   }

   local function init(s)
      class.name = matchClassName(s)
      class.parents = matchParents(s)
      class.desc = matchDescription(s)
      class.parameters = matchParameters(s)
      class.tags = matchTags(s)
      class.methodTags = matchMethodTags(s)

      assert(not docs[class.name], 'duplicate class: ' .. class.name)

      docs[class.name] = class
   end

   return class, init
end

for file in coroutine.wrap(scan), './deps/discordia/libs' do
   local d = assert(fs.readFileSync(file))

   local class, initClass = newClass()
   for s in matchComments(d) do
      local t = matchType(s)
      if t == 'c' then
         initClass(s)
      elseif t == 'm' then
         local method = matchMethod(s)
         for k, v in pairs(class.methodTags) do
            method.tags[k] = v
         end
         method.class = class
         insert(method.tags.static and class.statics or class.methods, method)
      elseif t == 'p' then
         insert(class.properties, matchProperty(s))
      end
   end
end

---
local base = fs.readFileSync('./base.lua')
local init, clientEvents, template = base:match(
   '%-%-%[Init%]\n' ..
   '(.-)%-%-%[InitEnd%]\n' ..
   '%-%-%[ClientEvents%]\n' ..
   '(.-)%-%-%[ClientEventsEnd%]\n' ..
   '(.*)'
)
local ext = fs.readFileSync('./ext.lua')

local warning = f('\n-- Do not touch, automatically generated!\n-- Generated on %s\n\n', os.date())
local writing = init .. warning

local function convert(tp)
   if tp == 'uv_timer' then
      return 'userdata'
   elseif not tp:match('%-') then
      return tp:gsub('/', ' | '):gsub('*', 'any'):gsub('function', 'async fun()')
   elseif tp:lower():match('id') then
      local resolving, id = tp:match('(%w+)%-.-%-(%w*)')

      local multi = false

      if id:sub(#id, #id) == 's' then
         resolving = resolving .. '[]'
         multi = true
      end

      return resolving .. ' | string' .. (multi and '[]' or '')
   else
      if tp == 'Base64-Resolveable' or tp == 'Base64-Resolvable' then
         return 'string'
      elseif tp == 'Permission-Resolvables' or tp == 'Permissions-Resolvables' then
         return 'Permissions[] | number[] | permissionStrings[]'
      elseif tp == 'Color-Resolvable' then
         return 'number | Color'
      elseif tp == 'Emoji-Resolvable' then
         return 'Emoji | Reaction | string'
      elseif tp == 'Permissions-Resolvable' then
         return 'Permissions | number | permissionStrings'
      elseif tp == 'Message-Flag-Resolvable' then
         return 'number'
      end
   end
end

local function descFunc(method)
   local func = '---' .. method.desc .. '\n'
   local inParen = ''

   for i, param in pairs(method.parameters) do
      if param[1] ~= '...' then
         func = func .. f('---@param %s%s %s\n', param[1], param[3] and '?' or '', convert(param[2]))
      else
         func = func .. f('---@vararg %s%s\n', convert(param[2]):gsub('%[%]', ''), param[3] and '?' or '')
      end

      inParen = inParen .. f('%s%s', param[1], i == #method.parameters and '' or ', ')
   end

   local new = {}

   for i, v in pairs(method.returns) do
      new[i] = convert(v)
   end

   func = func .. f('---@return %s\n', concat(new, ' '))

   local tags = method.tags

   if tags.http or tags['http?'] then
      func = func .. '---@async\n'
   end

   return func, inParen
end

local function descInlineFunc(method)
   local func = 'fun('

   for i, param in pairs(method.parameters) do
      if param[1] ~= '...' then
         func = func .. f('%s%s: %s%s', param[1], param[3] and '?' or '', convert(param[2]), i ~= #method.parameters and ', ' or '')
      else
         func = func .. f('...%s: %s', param[3] and '?' or '', convert(param[2]))
      end
   end

   local new = {}

   for i, v in pairs(method.returns) do
      new[i] = convert(v)
   end

   return func .. '):' .. concat(new, ', ')
end

for _, class in pairs(docs) do
   writing = writing .. f('---%s\n---@class %s', class.desc, class.name)

   -- Handle parents

   for i, parent in pairs(class.parents) do
      if i == 1 then
         writing = writing .. ': ' .. parent
      else
         writing = writing .. ', ' .. parent
      end
   end

   writing = writing .. '\n'

   -- Fields

   for _, fields in pairs(class.properties) do
      writing = writing .. f('---@field public %s %s %s\n', fields.name, convert(fields.type), fields.desc)
   end

   if class.name == 'Client' then
      writing = writing .. clientEvents:gsub('<name>', 'on')
      writing = writing .. clientEvents
         :gsub('<name>', 'onSync')
         :gsub(' async', '')
      writing = writing .. clientEvents:gsub('<name>', 'once')
      writing = writing .. clientEvents
         :gsub('<name>', 'onceSync')
         :gsub(' async', '')
   end

   -- Init overload

   local initParams = class.name == 'Client' and { {'options', 'ClientOptions', true } } or class.parameters

   writing = writing .. f('---@overload %s\n', descInlineFunc({
      parameters = initParams,
      returns = {class.name},
   }))

   -- Create table

   writing = writing .. f('local %s = {}\n', class.name)

   -- Methods

   for _, method in pairs(class.methods) do
      local func, inParen = descFunc(method)

      writing = writing .. f('%sfunction %s:%s(%s) end\n', func, class.name, method.name, inParen)
   end

   for _, method in pairs(class.statics) do
      local func, inParen = descFunc(method)

      writing = writing .. f('%sfunction %s.%s(%s) end\n', func, class.name, method.name, inParen)
   end

   -- Init method
   local func, inParen = descFunc({
      desc = f('Create a new %s', class.name),
      parameters = initParams,
      returns = {class.name},
      tags = class.methodTags
   })

   writing = writing .. f('%sfunction %s:%s(%s) end\n', func, class.name, '__init', inParen) .. '\n'
end

local function isArray(tbl)
   if type(tbl) ~= 'table' then return false end

   for i in pairs(tbl) do
      if type(i) ~= 'number' then
         return false
      end
   end

   return true
end

local function whatIs(this)
   if type(this) == 'table' and (this.__name or this.__type) then
      local given = this.__name or this.__type
      if given == 'Array' then
         return whatIs(this._data)
      else
         return given
      end
   else
      if type(this) == 'table' then
         if isArray(this) then
            if #this > 0 then
               local currentType = whatIs(this[1])

               for _, v in pairs(this) do
                  if whatIs(v) ~= currentType and currentType ~= 'any' then
                     currentType = 'any'
                  end
               end

               return currentType .. '[]'
            else
               return 'unknown[]'
            end
         else
            local keyType
            local valueType

            for i, v in pairs(this) do
               if not keyType then
                  keyType = whatIs(i)
                  valueType = whatIs(v)
               end

               if whatIs(i) ~= keyType and keyType ~= 'any' then
                  keyType = 'any'
               end

               if whatIs(v) ~= valueType and valueType ~= 'any' then
                  valueType = 'any'
               end
            end

            return 'table<' .. keyType .. ', ' .. valueType .. '>'
         end
      else
         return type(this)
      end
   end
end

---

-- Fill out mixin
local enums = require('deps.discordia.libs.enums')

local enumDescs = {}
local fields = {}

for i, v in pairs(enums) do
   if i ~= 'enum' then
      table.insert(fields, '---@field public ' .. i .. ' enums_' .. i)
      local desc = '--- ' .. i .. ' enum'

      desc = desc .. '\n---@class enums_' .. i

      for name, val in pairs(v) do
         desc = desc ..
                    f('\n---@field public %s %s | "%s"', name, type(val),
                      type(val) == 'string' and f('\'%s\'', val) or val)
      end

       desc = desc .. '\n\n'

      table.insert(enumDescs, desc)
   end
end

-- Fill out package
local package = require('deps.discordia.package')
local desc = '---@class package\n'

for i, v in pairs(package) do
   local val = (type(v) == 'table' and '') or (' | "' .. ((type(v) == 'string' and f('\'%s\'', v)) or tostring(v)) .. '"')
   desc = desc .. f('---@field public %s %s%s\n', i, whatIs(v), val)
end

-- Overloads

template = template
   :gsub('%-%-%s?@enums', table.concat(enumDescs, '\n') .. '---@class enums\n' .. table.concat(fields, '\n'))
   :gsub('%-%-%s?@package', desc)
   :gsub('%-%-%s?@ext', ext)

writing = writing .. '\n\n' .. template

fs.writeFileSync(
   ---@diagnostic disable-next-line: undefined-global
   process.argv[2],
   writing
)

---@diagnostic disable-next-line: undefined-global
local extFile = process.argv[3]

if extFile then
   ext = ext
      :gsub('%-%-%[extStart%](.-)%-%-%[extEnd%]', '')
      :gsub('Ext%.', '.')

   fs.writeFileSync(
      extFile,
      warning .. ext
   )
end
