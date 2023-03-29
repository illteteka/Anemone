local test_one = {}

function test_one.level()
	window.color = {1,0,0,1}
	obj_guy.new(83, 99)
	obj_guy.new(369, 93)
	obj_guy.new(95, 219)
	obj_guy.new(105, 243)
	obj_guy.new(114, 257)
	obj_guy.new(121, 265)
	obj_guy.new(133, 279)
	obj_guy.new(155, 292)
	obj_guy.new(174, 307)
	obj_guy.new(191, 310)
	obj_guy.new(200, 312)
	obj_guy.new(211, 316)
	obj_guy.new(230, 316)
	obj_guy.new(251, 313)
	obj_guy.new(272, 308)
	obj_guy.new(289, 301)
	obj_guy.new(302, 294)
	obj_guy.new(314, 287)
	obj_guy.new(326, 273)
	obj_guy.new(335, 257)
	obj_guy.new(346, 239)
	obj_guy.new(352, 227)
	obj_guy.new(357, 215)
	obj_guy.new(362, 204)
	obj_guy.new(362, 204)
	obj_blueguy.new(223, 171)
end

function test_one.init()
	LEVEL_SWITCH = LEVEL_TEST_1
	instances.clear()
	test_one.level()

	keyboard.clear()
	
	test_kb = keyboard.newBox(100, 100, 20 * font_size, font_size + 5, 32, "default")
	pw = keyboard.newBox(100, 122, 20 * font_size, font_size + 5, 32, "password", "Password:", 0, "apple123")
	test_kb2 = keyboard.newBox(100, 144, 20 * font_size, font_size + 5, 32, "default", "", 0, "this is a testbox")
end

function test_one.update(dt)

	if f1_key == _PRESS then
		level_test_two.init()
	end

end

function test_one.draw()
	
	polygon.draw(test_level)
	
	obj_guy.draw()
	obj_blueguy.draw()

	keyboard.draw()

end

return test_one