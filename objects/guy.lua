local guy = {}

function guy.init()
	guy.data = {}
	guy.name = "guy"
	editor.importObject("MEN", guy.name, "obj_guy.new", ent_player)
end

function guy.new(x, y)
	local tbl = {}
	tbl.x = x
	tbl.y = y
	table.insert(guy.data, tbl)
end

function guy.draw()
	local i = 1
	while i <= #guy.data do

		local this_ent = guy.data[i]

		lg.push()
		lg.translate(this_ent.x, this_ent.y)
		polygon.draw(ent_player)
		lg.pop()

		i = i + 1
	end
end

return guy