--[LitMeta]
  --[[lit-meta
    name = "SovietKitsune/discordia-types"
    version = "0.0.1"
    dependencies = {}
    description = "EmmyLua types file for discordia."
    tags = { "discordia", "types" }
    license = "MIT"
    author = { name = "Soviet Kitsune", email = "sovietKitsune@soviet.solutions" }
    homepage = "https://github.com/SovietKitsune/discordia-types"
  ]]
--[LitMetaEnd]
--[ClientEvents]
---@field <name> fun(self: Client, name: string, fn: async fun()): function
---@field <name> fun(self: Client, name: '"ready"', fn: async fun()): function
---@field <name> fun(self: Client, name: '"shardReady"', fn: async fun(shardId: number)): function
---@field <name> fun(self: Client, name: '"shardResumed"', fn: async fun(shardId: number)): function
---@field <name> fun(self: Client, name: '"channelCreate"', fn: async fun(channel: Channel)): function
---@field <name> fun(self: Client, name: '"channelUpdate"', fn: async fun(channel: Channel)): function
---@field <name> fun(self: Client, name: '"channelDelete"', fn: async fun(channel: Channel)): function
---@field <name> fun(self: Client, name: '"recipientAdd"', fn: async fun(channel: Channel, user: User)): function
---@field <name> fun(self: Client, name: '"recipientRemove"', fn: async fun(channel: Channel, user: User)): function
---@field <name> fun(self: Client, name: '"guildAvailable"', fn: async fun(guild: Guild)): function
---@field <name> fun(self: Client, name: '"guildCreate"', fn: async fun(guild: Guild)): function
---@field <name> fun(self: Client, name: '"guildUnavailable"', fn: async fun(guild: Guild)): function
---@field <name> fun(self: Client, name: '"guildDelete"', fn: async fun(guild: Guild)): function
---@field <name> fun(self: Client, name: '"userBan"', fn: async fun(user: User, guild: Guild)): function
---@field <name> fun(self: Client, name: '"userUnban"', fn: async fun(user: User, guild: Guild)): function
---@field <name> fun(self: Client, name: '"emojisUpdate"', fn: async fun(guild: Guild)): function
---@field <name> fun(self: Client, name: '"memberJoin"', fn: async fun(member: Member, guild: Guild)): function
---@field <name> fun(self: Client, name: '"memberLeave"', fn: async fun(member: Member, guild: Guild)): function
---@field <name> fun(self: Client, name: '"memberUpdate"', fn: async fun(member: Member, guild: Guild)): function
---@field <name> fun(self: Client, name: '"roleCreate"', fn: async fun(role: Role)): function
---@field <name> fun(self: Client, name: '"roleUpdate"', fn: async fun(role: Role)): function
---@field <name> fun(self: Client, name: '"roleDelete"', fn: async fun(role: Role)): function
---@field <name> fun(self: Client, name: '"messageCreate"', fn: async fun(message: Message)): function Emitted when a text channel message is created.
---@field <name> fun(self: Client, name: '"messageUpdate"', fn: async fun(message: Message)): function
---@field <name> fun(self: Client, name: '"messageUpdateUncached"', fn: async fun(channel: TextChannel, messageId: string)): function
---@field <name> fun(self: Client, name: '"reactionAdd"', fn: async fun(reaction: Reaction, userId: string)): function
---@field <name> fun(self: Client, name: '"reactionAddUncached"', fn: async fun(channel: TextChannel, messageId: string, hash: string, userId: string)): function
---@field <name> fun(self: Client, name: '"reactionRemove"', fn: async fun(reaction: Reaction, userId: string)): function
---@field <name> fun(self: Client, name: '"reactionRemoveUncached"', fn: async fun(channel: TextChannel, messageId: string, hash: string, userId: string)): function
---@field <name> fun(self: Client, name: '"pinsUpdate"', fn: async fun(channel: TextChannel)): function
---@field <name> fun(self: Client, name: '"presenceUpdate"', fn: async fun(member: Member)): function
---@field <name> fun(self: Client, name: '"relationshipUpdate"', fn: async fun(relationship: Relationship)): function
---@field <name> fun(self: Client, name: '"relationshipAdd"', fn: async fun(relationship: Relationship)): function
---@field <name> fun(self: Client, name: '"relationshipRemove"', fn: async fun(relationship: Relationship)): function
---@field <name> fun(self: Client, name: '"typingStart"', fn: async fun(userId: string, channelId: string, timestamp: string)): function
---@field <name> fun(self: Client, name: '"userUpdate"', fn: async fun(user: User)): function
---@field <name> fun(self: Client, name: '"voiceConnect"', fn: async fun(member: Member)): function
---@field <name> fun(self: Client, name: '"voiceUpdate"', fn: async fun(member: Member)): function
---@field <name> fun(self: Client, name: '"voiceChannelJoin"', fn: async fun(member: Member, channel: GuildVoiceChannel)): function
---@field <name> fun(self: Client, name: '"voiceChannelLeave"', fn: async fun(member: Member, channel: GuildVoiceChannel)): function
---@field <name> fun(self: Client, name: '"webhooksUpdate"', fn: async fun(channel: TextChannel)): function
---@field <name> fun(self: Client, name: '"debug"', fn: async fun(message: string)): function
---@field <name> fun(self: Client, name: '"info"', fn: async fun(message: string)): function
---@field <name> fun(self: Client, name: '"warning"', fn: async fun(message: string)): function
---@field <name> fun(self: Client, name: '"error"', fn: async fun(message: string)): function
---@field <name> fun(self: Client, name: '"heartbeat"', fn: async fun(shardId: number, latency: number)): function
---@field <name> fun(self: Client, name: '"raw"', fn: async fun(json: string)): function
--[ClientEventsEnd]

---@alias clientEvents string
---| "'ready'"                  # Emitted after all shards and guilds are fully loaded.
---| "'shardReady'"             # Emitted after a shard successfully connects to a Discord gateway and loads all corresponding guilds.
---| "'shardResume'"            # Emitted after the client successfully resumes a severed gateway connection.
---| "'channelCreate'"          # Emitted when a guild channel is created, when a private channel is opened, or when a group channel is joined.
---| "'channelUpdate'"          # Emitted when a channel property is updated, such as its name, topic, bitrate, etc.
---| "'channelDelete'"          # Emitted when a guild channel is deleted, when a private channel is closed, or when a group channel is left.
---| "'recipientAdd'"           # Emitted when a new recipient is added to a group channel. User-accounts only.
---| "'recipientRemove'"        # Emitted when a new recipient is removed from a group channel. User-accounts only.
---| "'guildAvailable'"         # Emitted when a guild becomes available. This can occur after a server outage or as guild data is streamed in after login.
---| "'guildCreate'"            # Emitted when a guild is created from the perspective of the current user, usually after the client user joins a new one.
---| "'guildUpdate'"            # Emitted when a guild property is updated such as its name, region, icon, etc.
---| "'guildUnavailable'"       # Emitted when a guild becomes unavailable, potentially due to a server outage. Unavailable guilds may lack significant data.
---| "'guildDelete'"            # Emitted when a guild is deleted from the perspective of the current user, usually after the client leaves one.
---| "'userBan'"                # Emitted when a user is banned from a guild.
---| "'userUnban'"              # Emitted when a user is unbanned from a guild.
---| "'emojisUpdate'"           # Emitted when a guild's custom emoji is updated.
---| "'memberJoin'"             # Emitted when a new user joins a guild.
---| "'memberLeave'"            # Emitted when a user leaves a guild.
---| "'memberUpdate'"           # Emitted when a guild member property is updated, such as its roles or nickname. See presenceUpdate for status changes.
---| "'roleCreate'"             # Emitted when a guild role is created.
---| "'roleUpdate'"             # Emitted when a guild role property is updated, such as its name, color, permissions, etc.
---| "'roleDelete'"             # Emitted when a guild role is deleted.
---| "'messageCreate'"          # Emitted when a text channel message is created.
---| "'messageUpdate'"          # Emitted when the content of a text channel message is edited.
---| "'messageUpdateUncached'"  # Emitted when the content of a text channel message is edited, but the message is not cached by the client.
---| "'messageDelete'"          # Emitted when a text channel message is deleted. Bulk deletions will fire this for every message that is deleted.
---| "'messageDeleteUncached'"  # Emitted when a text channel message is deleted, but the message is not cached by the client. Bulk deletions will fire this for every message that is deleted, but not cached.
---| "'reactionAdd'"            # Emitted when an emoji reaction is added to message.
---| "'reactionAddUncached'"    # Emitted when an emoji reaction is added to message, but the message is not cached by the client.
---| "'reactionRemove'"         # Emitted when an emoji reaction is removed from a message.
---| "'reactionRemoveUncached'" # Emitted when an emoji reaction is removed from a message, but the message is not cached by the client.
---| "'pinsUpdate'"             # Emitted when a message is pinned or unpinned in a channel.
---| "'presenceUpdate'"         # Emitted when a guild member's status or user properties change. See memberUpdate for role and nickname changes.
---| "'relationshipUpdate'"     # Emitted when a relationship's (friend, blocked user) status or user properties change. User-accounts only.
---| "'relationshipAdd'"        # Emitted when a relationship (friend, blocked user) is added. User-accounts only.
---| "'relationshipRemove'"     # Emitted when a relationship (friend, blocked user) is removed. User-accounts only.
---| "'typingStart'"            # Emitted when a user starts typing in a text channel.
---| "'userUpdate'"             # Emitted when the client user updates itself.
---| "'voiceConnect'"           # Emitted when a guild member connects to voice chat.
---| "'voiceDisconnect'"        # Emitted when a guild member disconnects from voice chat.
---| "'voiceUpdate'"            # Emitted when a guild member's mute/deaf status changes.
---| "'voiceChannelJoin'"       # Emitted when a guild member joins a voice channel.
---| "'voiceChannelLeave'"      # Emitted when a guild member leaves a voice channel.
---| "'webhooksUpdate'"         # Emitted when a guild's text channel's webhooks have updated.
---| "'heartbeat'"              # Emitted when Discord responds with a heartbeat acknowledgement.
---| "'raw'"                    # Emitted for every Discord gateway event.
---| "'debug'"                  # Emitted to provide detailed information regarding specific library behavior.
---| "'info'"                   # Emitted to provide helpful information regarding general library behavior.
---| "'warning'"                # Emitted when something went wrong, but your code will probably continue operating normally.
---| "'error'"                  # Emitted when something went wrong and your code may not continue operating normally.

--- Send a debug level(4) message
---
--- Used for all HTTP requests, all gateway events, gateway debugging information
---@param msg string
---@vararg any
function Client:debug(msg, ...) end

--- Send an info level(3) message
---
--- Used for messages about connecting to the gateway, launching shards, receiving select gateway events
---@param msg string
---@vararg any
function Client:info(msg, ...) end

--- Send a warning level(2) message
---
--- Used for uncached objects and unhandled gateway events, unacknowledged heartbeats, gateway reconnections
---@param msg string
---@vararg any
function Client:warning(msg, ...) end

--- Send an error level(1) message
---
--- Used for API request failures (HTTP 4xx/5xx), sharding issues, authentication issues
---@param msg string
---@vararg any
function Client:error(msg, ...) end

--- The Lua language does not have classes, but it does have all of the tools needed to write them.
--- Discordia uses a custom class system that was written explicitly to encapsulate data provided by Discord in intuitive, efficient structures.
---
--- The `class` module used by Discordia is available to users in the main Discordia module.
--- The class module is both the module table and a callable class constructor.
---
--- ```lua
--- local discordia = require('discordia')
--- local class = discordia.class
--- ```
---
--- ## Constructing Classes and Objects
---
--- All Discordia classes must be uniquely named and must have an `__init` method.
--- `UpperCamelCase` is used for class names while `lowerCamelCase` is used for public instances, properties, and methods.
---
--- ```lua
--- local Apple = class('Apple') -- construct a new class
---
--- function Apple:__init(color) -- define the initializer
---   ...
--- end
---
--- local apple = Apple('red') -- call the class table to instantiate a new object
--- ```
---
--- ## Properties
---
--- Discordia enforces a "protected" property policy.
--- All new properties written directly to class objects must be prefixed with an underscore.
--- Directly accessing underscored properties outside of the class definitions is not recommended.
--- Additionally, to avoid potential compatibility issues, **writing custom properties to pre-defined Discordia classes is not recommended**.
---
--- ```lua
--- local Apple = class('Apple')
---
--- function Apple:__init(color)
---	self._color = color -- define a "protected" property
--- end
--- ```
---
--- Because of this underscore policy, Discordia classes also have **getters** and **setters** that can be used to define public properties.
--- These are empty tables and should be populated by functions where getters return a value and setters modify a property.
--- Note that an explicit `self` must be passed for these functions.
---
--- ```lua
--- local Apple, get, set = class('Apple') -- multiple return values
---
--- function Apple:__init(color)
---	self._color = color
--- end
---
--- function get.color(self) -- define a getter
---	return self._color
--- end
---
--- function set.color(self, color) -- define a setter
---   self._color = color
--- end
--- ```
---
--- With getters and setters, you can indirectly get/access and set/mutate protected (underscored) properties without having to use a method.
--- More importantly, if a setter is not defined for a specific property, Discordia will prevent users from overwriting that property.
--- Note Discordia itself never uses setters, but the option is available for people who want to make their own classes.
---
--- ```lua
--- local apple = Apple('red')
--- print(apple.color) -- 'red'
---
--- apple.color = 'green'
--- print(apple.color) -- 'green'
--- ```
---
--- ### Member Methods
---
--- Member methods are defined and called using Lua's colon notation so that an implicit `self` is passed to the function.
---
--- ```lua
--- local Apple = class('Apple')
---
--- function Apple:__init(color)
---	self._color = color
--- end
---
--- function Apple:getColor() -- define a member method
---   return self._color
--- end
---
--- local user = Apple('red')
--- print(user:getColor()) -- 'red'
--- ```
---
--- ### Static Methods
---
--- Static methods are defined and called using Lua's dot notation.
--- No implicit (or explicit) self is required for static methods.
---
--- ```lua
--- local colors = {'red', 'yellow', 'green'}
---
--- function Apple.random() -- returns a random apple object
---	return Apple(colors[math.random(#colors)])
--- end
--- ```
---
--- ## Inheritance
---
--- Discordia classes support single and multiple inheritance.
--- Base or super classes are passed to the class constructor.
---
--- ```lua
--- local Fruit = class('Fruit') -- Fruit is a base class
---
--- function Fruit:__init(color)
---	self._color = color
--- end
---
--- function Fruit:getColor()
---	return self._color
--- end
---
--- local Apple = class('Apple', Fruit) -- Apple inherits from Fruit
---
--- function Apple:__init(color)
--- 	Fruit.__init(self, color) -- base constructor must be explicitly called
--- end
---
--- local apple = Apple('red')
---
--- print(apple:getColor()) -- 'red'; method inherited from Fruit
--- ```
---
--- ## Utilities
---
--- The class module contains a variety of tables and functions that may be useful to regular users.
---
--- #### classes
---
--- Table of all defined classes, indexed by name.
---
---@class class
---@field public classes table<string, any>
local class = {}

---@type class | fun(name: string, ...): any, table, table
class = class

--- Function that returns true only if the provided argument is a Discordia class module.
---
--- ```lua
--- print(class.isClass(Color)) -- true
--- print(class.isClass(1337)) -- false
--- ```
---@param obj any
---@return boolean
function class.isClass(obj) end

--- Function that returns true only if the provided argument is an instance of a Discordia class.
---
--- ```lua
--- local color = Color(...)
--- print(class.isObject(color)) -- true
--- print(class.isObject(1337)) -- false
--- ```
---@param obj any
---@return boolean
function class.isObject(obj) end

--- Function that returns true if the first argument is a subclass of the second argument.
--- Note that classes are considered to be subclasses of themselves.
---
--- ```lua
--- print(class.isSubclass(TextChannel, Channel)) -- true
--- print(class.isSubclass(Color, Channel)) -- false
--- print(class.isSubclass(Channel, Channel)) -- true
--- ```
---@param obj any
---@param obj2 any
---@return boolean
function class.isSubclass(obj, obj2) end

--- Function that returns the type of the provided argument.
--- If the argument is a Discordia object, then this will return the name of its class; otherwise, it will return the result of calling Lua's global `type` function.
---
--- ```lua
--- print(class.type(color)) -- 'Color'
--- print(class.type(1337)) -- 'number'
--- ```
--- @param obj any
--- @return string
function class.type(obj) end

--- Function that returns the number of each class instance currently alive (ie, not garbage collected) in table form.
---
--- ```lua
--- local data = class.profile()
--- for name, count in pairs(data) do
---	print(name, count)
--- end
--- ```
---@return table<string, number>
function class.profile() end

-- @enums
--- The Discord API uses numbers to represent certain data types.
--- For convenience, these are enumerated in Discord as special read-only tables, found in the main Discordia module.
--- All available enumerations are listed at the end of this page.
---
--- ```lua
--- local discordia = require('discordia')
--- local enums = discordia.enums
--- ```
---
--- Enumerations (enums) can be accessed like a regular Lua table, but they cannot be modified.
--- This is completely optional, but it is generally easier to use and read enumerations than it is to use and read plain numbers.
--- For example, given a text channel object, the following are logically equivalent:
---
--- ```lua
--- if channel.type == 0 then
---   print('This is a text channel!')
--- end
---
--- if channel.type == enums.channelType.text then
---   print('This is a text channel!')
--- end
---
--- print(enums.verificationLevel.low) -- 1
--- ```
---
--- Additionally, enumerations work in reverse.
--- If you have the number, but you want to recall the human-readable version, simply call the enum;
--- it will return a string if the enumeration is valid.
---
--- ```lua
--- print(enums.channelType(channel.type)) -- 'text'
--- print(enums.verificationLevel(1)) -- 'low'
--- ```
---
--- If necessary, custom enumerations can be written using the enum constructor:
---
--- ```lua
--- local fruit = enums.enum {
---	apple =  0,
---	orange = 1,
---	banana = 2,
---	cherry = 3,
--- }
--- ```
---
--- ## Discord Enumerations
---
--- The enumerations are designed to be compatible with the Discord API. They are not necessarily unique to Discordia.
local enums = {}

--- Create a new enum
---@generic T
---@param data T
---@return T enum The newly constructed enum
function enums.enum(data) end

--- Extensions related to tables
---@class ext_table
---@overload fun()
local tableExt = {}

--- Returns the total number of elements in a table. This uses the global `pairs` function and respects any `__pairs` metamethods.
---@param tbl table
---@return number
function tableExt.count(tbl) end

--- Returns the total number of elements in a table, recursively.
--- If a table is encountered, it is recursively counted instead of being directly added to the total count.
--- This uses the global `pairs` function and respects any `__pairs` metamethods.
---@param tbl table
---@return number
function tableExt.deepcount(tbl) end

--- Returns a copy of the original table, recursively.
--- If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---@param tbl table
---@return table
function tableExt.copy(tbl) end

--- Returns a copy of the original table, recursively.
--- If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---@param tbl table
---@return table
function tableExt.deepcopy(tbl) end

--- Reverses the elements of an array-like table in place.
---@param tbl any[]
function tableExt.reverse(tbl) end

--- Returns a copy of an array-like table with its elements in reverse order.
--- The original table remains unchanged.
---@param tbl any[]
---@return any[]
function tableExt.reversed(tbl) end

--- Returns a new array-like table where all of its values are the keys of the original table.
---@param tbl table
---@return any[]
function tableExt.keys(tbl) end

--- Returns a new array-like table where all of its values are the values of the original table.
---@param tbl table
---@return any[]
function tableExt.values(tbl) end

--- Returns a random (index, value) pair from an array-like table.
---@param tbl any[]
---@return number, any
function tableExt.randomipair(tbl) end

--- Returns a random (key, value) pair from a dictionary-like table.
---@param tbl table
---@return any, any
function tableExt.randompair(tbl) end

--- Returns a copy of an array-like table sorted using Lua's `table.sort`.
---@param tbl any[]
---@param fn function
---@return any[]
function tableExt.sorted(tbl, fn) end

--- Iterates through a table until it finds a value that is equal to `value` according to the `==` operator.
--- The key is returned if a match is found.
---@param tbl table
---@param value any
---@return any
function tableExt.search(tbl, value) end

--- Returns a new table that is a slice of the original, defined by the start and stop bounds and the step size.
--- Default start, stop, and step values are 1, #tbl, and 1, respectively.
---@param tbl table
---@param start number
---@param stop number
---@param step number
---@return table
---@overload fun(tbl: table):table
---@overload fun(tbl: table, start: number):table
---@overload fun(tbl: table, start: number, stop: number):table
---@overload fun(tbl: table, start: number, stop: number, step: number):table
function tableExt.slice(tbl, start, stop, step) end

--- Utilities related to strings
---@class ext_string
---@overload fun()
local stringExt = {}

--- Splits a string into a table of specifically delimited sub-strings.
--- If the delimiter is omitted or empty, the string is split into a table of characters.
---@param str string
---@param delim string
---@return table
---@overload fun(str: string):table
function stringExt.split(str, delim) end

--- Returns a new string with all whitespace removed from the left and right sides of the original string.
---@param str string
---@return string
function stringExt.trim(str) end

---@alias alignment string | "'left'" | "'right'" | "'center'"

--- Returns a new string that is padded up to the desired length.
--- The alignment, either `left`, `right`, or `center` with left being the default, defines the placement of the original string.
--- The default pattern is a single space.
---@param str string
---@param len number
---@param align alignment
---@param pattern string
---@return string
---@overload fun(str: string, len: number):string
---@overload fun(str: string, len: number, align: alignment):string
function stringExt.pad(str, len, align, pattern) end

--- Returns whether a string starts with a specified sub-string or pattern.
--- The plain parameter is the same as that used in Lua's `string.find`.
---@param str string
---@param pattern string
---@param plain boolean
---@return boolean
---@overload fun(str: string, pattern: string):boolean
function stringExt.startswith(str, pattern, plain) end

--- Returns whether a string ends with a specified sub-string or pattern.
--- The plain parameter is the same as that used in Lua's `string.find`.
---@param str string
---@param pattern string
---@param plain boolean
---@return boolean
---@overload fun(str: string, pattern: string):boolean
function stringExt.endswith(str, pattern, plain) end

--- Returns the Levenshtein distance between two strings.
--- A higher number indicates a greater distance.
---@param str1 string
---@param str2 string
---@return number
function stringExt.levenshtein(str1, str2) end

--- Returns a string of random characters with the specified length.
--- If provided, the min and max bounds cannot be outside 0 to 255.
--- Use 32 to 126 for printable ASCII characters.
---@param len number
---@param min number
---@param max number
---@return string
---@overload fun(len: number):string
---@overload fun(len: number, min: number):string
function stringExt.random(len, min, max) end

--- Utilities related to math
---@class ext_math
---@overload fun()
local mathExt = {}

--- Returns a number that is at least as small as the minimum value and at most as large as the maximum value, inclusively.
--- If the original number is already with the bounds, the same number is returned.
---@param n number
---@param min number
---@param max number
---@return number
function mathExt.min(n, min, max) end

--- Returns a number that is rounded to the nearest defined digit.
--- The nearest integer is returned if the digit is omitted.
--- Negative values can be used for higher order places.
---@param n number
---@param digits number
---@return number
---@overload fun(n: number):number
function mathExt.round(n, digits) end

--- **Discordia** has some built-in Lua standard library extensions.
--- These provide complementary or supplementary, commonly used functions that the Lua standard library does not provide.
---
--- Extensions can be used directly...
---
--- ```lua
--- local str = "  abc  "
--- print(discordia.extensions.string.trim(str)) -- "abc"
--- ```
---
--- ... or they can be loaded into the global tables:
---
--- ```lua
--- local str = "  abc  "
--- discordia.extensions.string()
--- print(string.trim(str)) -- "abc"
--- ```
---
--- Note that calling the whole extensions module will load all sub-modules:
---
--- ```lua
--- discordia.extensions()
--- ```
---@class extensions
---@field public string ext_string
---@field public table ext_table
---@field public math ext_math

--@package

--- To write a Discordia application, the library's main module must be required. If it's in a deps or libs folder, simply require it by name.
--- If you've manually installed the library elsewhere, then you will need to provide a relative or full path to the Discordia directory.
---
--- ```lua
--- local discordia = require('discordia')
--- ```
---
--- ## Classes
---
--- Discordia has many custom classes. Some of them are instantiated only by the library and not by users.
--- The classes that may be safely instantiated by users are included in the Discordia module:
---
--- * Client
--- * Clock
--- * Color
--- * Date
--- * Deque
--- * Emitter
--- * Logger
--- * Mutex
--- * Permissions
--- * Stopwatch
--- * Time
---
--- ## Sub-Modules
---
--- In addition to classes, the Discordia module has some generic modules that may be helpful in writing your applications.
---
--- ### class
---
--- Used to create custom classes and provides tools for inspecting classes and class instances.
---
--- ### enums
---
--- Used to create custom enumerations or access a variety of pre-defined enumerations.
---
--- ### extensions
---
--- Extensions to the Lua standard library. Functions can be used directly or can be loaded into the Lua global tables.
---
--- ### package
---
--- Not to be confused with the global Lua module, this Discordia's literal package metadata, used to define the module when it is uploaded to lit, the Luvit Invention Toolkit.
---
--- ### storage
---
--- An empty table that can be used to store user data.
--- This may be used an alternative to storing values on class instances or in global variables, both of which are not recommended.
---
---@class discordia
---@field public Client Client
---@field public Clock Clock
---@field public Color Color
---@field public Date Date
---@field public Deque Deque
---@field public Emitter Emitter
---@field public Logger Logger
---@field public Mutex Mutex
---@field public Permissions Permissions
---@field public Stopwatch Stopwatch
---@field public Time Time
---@field public class class
---@field public enums enums
---@field public extensions extensions | function
---@field public package package
---@field public storage table<any, any>
local discordia = {}
