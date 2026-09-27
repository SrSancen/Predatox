--[[
 #######################################################################################################################
#	░█████╗░░██╗░░░░░░░██╗███████╗░██████╗░█████╗░███╗░░░███╗███████╗  ░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░	#
#	██╔══██╗░██║░░██╗░░██║██╔════╝██╔════╝██╔══██╗████╗░████║██╔════╝  ██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░	#
#	███████║░╚██╗████╗██╔╝█████╗░░╚█████╗░██║░░██║██╔████╔██║█████╗░░  ██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░	#
#	██╔══██║░░████╔═████║░██╔══╝░░░╚═══██╗██║░░██║██║╚██╔╝██║██╔══╝░░  ██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗	#
#	██║░░██║░░╚██╔╝░╚██╔╝░███████╗██████╔╝╚█████╔╝██║░╚═╝░██║███████╗  ╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝	#
#	╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░  YS#
 #######################################################################################################################
--]]

pcall(require, "luarocks.loader")

-- 📚 Library
local gfs = require("gears.filesystem")
local awful = require("awful")
local beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi

-- 🎨 Themes
themes = {
      "day",      -- [1] 🌕 Beautiful Light Colorscheme
      "night",    -- [2] 🌑 Aesthetic Dark Colorscheme
}

theme = themes[2]
beautiful.init(gfs.get_configuration_dir() .. "theme/" .. theme .."/theme.lua")

-- 🌊 Default Applications
terminal = "kitty"
editor = terminal .. " -e " .. os.getenv("EDITOR")
vscode = "code"
browser = "firefox"
launcher = "rofi -show drun -theme " .. gfs.get_configuration_dir() .. "theme/rofi.rasi"
file_manager = "nautilus"
music_client = terminal .. " --class music -e ncmpcpp"

-- 🌏 Weather API
openweathermap_key = "" -- API Key
openweathermap_city_id = "" -- City ID
weather_units = "metric" -- Unit

-- 🖥 Screen
if awful.screen.focused() then
    screen_width = awful.screen.focused().geometry.width
    screen_height = awful.screen.focused().geometry.height
else
    screen_width = 1920  -- valores por defecto
    screen_height = 1080 -- valores por defecto
end

-- 🚀 Launch Autostart
awful.spawn.with_shell(gfs.get_configuration_dir() .. "configuration/autostart")

-- 🤖 Import Configuration & module
require("configuration")
require("module")

-- ✨ Import Daemons, UI & Widgets
require("signal")
require("ui")

-- 🗑 Garbage Collector Settings
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

-- Wallpaper
local mywallpaper = "feh --bg-fill ~/.config/awesome/theme/assets/bg.png"
os.execute(mywallpaper)