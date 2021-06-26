local test_two = {}

function test_two.level()
	window.color = {1,0,0,1}
	obj_guy.new(0, 0)
	obj_guy.new(48, 48)
end

function test_two.init()
	LEVEL_SWITCH = LEVEL_TEST_2
	instances.clear()
	test_two.level()
end

function test_two.update(dt)

	if r_key == _PRESS then
		level_test_one.init()
	end

end

function test_two.draw()
	
	polygon.draw(test_level)
	
	obj_guy.draw()
	
end

return test_two