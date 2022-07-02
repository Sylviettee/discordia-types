
-- Do not touch, automatically generated!
-- Generated on Sat Jul  2 13:55:42 2022



--- Returns the total number of elements in a table. This uses the global `pairs` function and respects any `__pairs` metamethods.
---@param tbl table
---@return number
function table.count(tbl) end

--- Returns the total number of elements in a table, recursively.
--- If a table is encountered, it is recursively counted instead of being directly added to the total count.
--- This uses the global `pairs` function and respects any `__pairs` metamethods.
---@param tbl table
---@return number
function table.deepcount(tbl) end

--- Returns a copy of the original table, recursively.
--- If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---@param tbl table
---@return table
function table.copy(tbl) end

--- Returns a copy of the original table, recursively.
--- If a table is encountered, it is recursively deep-copied. Metatables are not copied.
---@param tbl table
---@return table
function table.deepcopy(tbl) end

--- Reverses the elements of an array-like table in place.
---@param tbl any[]
function table.reverse(tbl) end

--- Returns a copy of an array-like table with its elements in reverse order.
--- The original table remains unchanged.
---@param tbl any[]
---@return any[]
function table.reversed(tbl) end

--- Returns a new array-like table where all of its values are the keys of the original table.
---@param tbl table
---@return any[]
function table.keys(tbl) end

--- Returns a new array-like table where all of its values are the values of the original table.
---@param tbl table
---@return any[]
function table.values(tbl) end

--- Returns a random (index, value) pair from an array-like table.
---@param tbl any[]
---@return number, any
function table.randomipair(tbl) end

--- Returns a random (key, value) pair from a dictionary-like table.
---@param tbl table
---@return any, any
function table.randompair(tbl) end

--- Returns a copy of an array-like table sorted using Lua's `table.sort`.
---@param tbl any[]
---@param fn function
---@return any[]
function table.sorted(tbl, fn) end

--- Iterates through a table until it finds a value that is equal to `value` according to the `==` operator.
--- The key is returned if a match is found.
---@param tbl table
---@param value any
---@return any
function table.search(tbl, value) end

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
function table.slice(tbl, start, stop, step) end



--- Splits a string into a table of specifically delimited sub-strings.
--- If the delimiter is omitted or empty, the string is split into a table of characters.
---@param str string
---@param delim string
---@return table
---@overload fun(str: string):table
function string.split(str, delim) end

--- Returns a new string with all whitespace removed from the left and right sides of the original string.
---@param str string
---@return string
function string.trim(str) end

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
function string.pad(str, len, align, pattern) end

--- Returns whether a string starts with a specified sub-string or pattern.
--- The plain parameter is the same as that used in Lua's `string.find`.
---@param str string
---@param pattern string
---@param plain boolean
---@return boolean
---@overload fun(str: string, pattern: string):boolean
function string.startswith(str, pattern, plain) end

--- Returns whether a string ends with a specified sub-string or pattern.
--- The plain parameter is the same as that used in Lua's `string.find`.
---@param str string
---@param pattern string
---@param plain boolean
---@return boolean
---@overload fun(str: string, pattern: string):boolean
function string.endswith(str, pattern, plain) end

--- Returns the Levenshtein distance between two strings.
--- A higher number indicates a greater distance.
---@param str1 string
---@param str2 string
---@return number
function string.levenshtein(str1, str2) end

--- Returns a string of random characters with the specified length.
--- If provided, the min and max bounds cannot be outside 0 to 255.
--- Use 32 to 126 for printable ASCII characters.
---@param len number
---@param min number
---@param max number
---@return string
---@overload fun(len: number):string
---@overload fun(len: number, min: number):string
function string.random(len, min, max) end



--- Returns a number that is at least as small as the minimum value and at most as large as the maximum value, inclusively.
--- If the original number is already with the bounds, the same number is returned.
---@param n number
---@param min number
---@param max number
---@return number
function math.clamp(n, min, max) end

--- Returns a number that is rounded to the nearest defined digit.
--- The nearest integer is returned if the digit is omitted.
--- Negative values can be used for higher order places.
---@param n number
---@param digits number
---@return number
---@overload fun(n: number):number
function math.round(n, digits) end
