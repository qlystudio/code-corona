display.setStatusBar(display.HiddenStatusBar)
io.output():setvbuf('no')

require "sqlite3"
ui = require("ui")
require "functions"
director = require("director")
mainGroup = display.newGroup()
mainGroup:insert(director.directorView)
tm = require("transitionManager")
tm = tm.new()
require 'Json'
--slider = require("slider")
crypto = require("crypto")
settings = require 'settings'
settings:init()
require "sprite"
require "graphics"
--widget = require "widget"
--local scrollView = require("scrollview")
require "const"

-- 2do - remove
require "main_menu"
require "play"

director:changeScene("main_menu")
