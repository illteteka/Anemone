polygon = require "engine.polygon"
input = require "engine.input"
lume = require "engine.lume"
ctrl = require "engine.ctrl"
window = require "engine.window"
dev = require "engine.dev"
ui = require "engine.ui"
instances = require "instances"
editor = require "engine.editor"
keyboard = require "engine.keyboard"
require "engine.utils"

lg = love.graphics
lk = love.keyboard
font_size = 14

LEVEL_TEST_1 = 0
LEVEL_TEST_2 = 1
LEVEL_EDITOR = 2

LEVEL_SWITCH = LEVEL_TEST_1

function love.load()

	GAME_NAME = "Anemone"
	math.randomseed(os.time())

	polygon.init()
	dev.init()
	ctrl.init()
	
	-- Init window
	window.init()
	love.window.setTitle("anemone v2")

	ui.init()

	-- Load shaders
	shader_mask = lg.newShader("shaders/mask.frag")
	
	-- Loading models
	font = love.graphics.newFont("font.ttf", font_size)
	love.graphics.setFont(font)
	
	test_level = polygon.new("soda/test-level.soda")
	
	ent_player = polygon.new("soda/one.soda")

	-- Load levels
	level_test_one = require "levels.test_one"
	level_test_two = require "levels.test_two"

	if LEVEL_SWITCH == LEVEL_EDITOR then
		editor.init()
	else -- Load regular levels

		instances.load() -- Needs to happen before loading a level

		if LEVEL_SWITCH == LEVEL_TEST_1 then
			level_test_one.init()
		elseif LEVEL_SWITCH == LEVEL_TEST_2 then
			level_test_two.init()
		end

	end
	
	polygon.rebuildCache()

end

function love.update(dt)

	dt = dev.updateDebugMenu(dt)

	-- update keys
	input.update(dt)
	ctrl.update(dt)
	ui.update(dt)
	keyboard.update(dt)
	
	window.updateFullscreen()

	if sleep == 0 then
		if not game_paused then

			updateGame(dt)
		
		end
	else
		sleep = math.max(sleep - 60 * dt, 0)
	end

end

function updateGame(dt)

	if LEVEL_SWITCH == LEVEL_TEST_1 then
		level_test_one.update(dt)
	elseif LEVEL_SWITCH == LEVEL_TEST_2 then
		level_test_two.update(dt)
	elseif LEVEL_SWITCH == LEVEL_EDITOR then
		editor.update(dt)
	end

end

function drawGame()

	if LEVEL_SWITCH == LEVEL_TEST_1 then
		level_test_one.draw()
	elseif LEVEL_SWITCH == LEVEL_TEST_2 then
		level_test_two.draw()
	elseif LEVEL_SWITCH == LEVEL_EDITOR then
		editor.draw()
	end

end

function love.draw()

	window.draw()

	if LEVEL_SWITCH == LEVEL_EDITOR then
		editor.drawUI()
	end

	ui.draw()

	-- Always run this last
	dev.drawDebugMenu()

end

function love.resize(w, h)
	window.resize(w, h)
end

function love.focus(f)
	if f == false then
		game_paused = true
	end
end

function love.wheelmoved(x, y)
	mouse.wheel = y
end

function love.quit()
	polygon.clearCache()
end