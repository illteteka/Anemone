local blueguy = {}

function blueguy.init()
	blueguy.data = {}
	blueguy.name = "blueguy"
	editor.importObject("MEN", blueguy.name, "obj_blueguy.new")
end

function blueguy.new(x, y)
	local tbl = {}
	tbl.x = x
	tbl.y = y
	table.insert(blueguy.data, tbl)
end

function blueguy.draw()
	local i = 1
	while i <= #blueguy.data do

		local this_ent = blueguy.data[i]

		lg.push()
		lg.translate(this_ent.x, this_ent.y)
		setMask(0, 0, 1)
		lg.setShader(shader_mask)
		polygon.draw(ent_player)
		lg.setShader()
		lg.pop()

		i = i + 1
	end
end

return blueguy