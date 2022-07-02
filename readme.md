# Discordia-Types

discordia-types provides a type file for [Discordia](https://github.com/SinisterRectus/discordia) 2.x.

## Installation

1. Install an editor extension that supports EmmyLua.
   * [Sumneko's Lua (preferred)](https://github.com/sumneko/lua-language-server)
   * [Luanalysis (IntelliJ only)](https://github.com/Benjamin-Dobell/IntelliJ-Luanalysis)
   * [EmmyLua](https://github.com/EmmyLua/EmmyLua-LanguageServer)
2. Copy the `discordia.lua` file to your project directory.
3. If you're using Sumneko's Lua, make sure `Lua.workspace.preloadFileSize` in your `settings.json` is `5000` or above.
4. When requiring discordia, give it a type annotation.
   ```lua
   ---@type discordia
   local discordia = require('discordia')
   ```
5. Optional: If you're using `discordia.extensions`, copy `discordia-ext.lua` as well.

## Building

1. Install discordia via Lit (`lit install SinisterRectus/discordia`).
2. Run `main.lua` with Luvit (`luvit main.lua <output> [ext]`)

## Bugs

Report any bugs to the issue tracker. Fixes relating to Sumneko's Lua are prioritized.
