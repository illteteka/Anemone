local keyboard = {}
keyboard.box = {}
keyboard.active_box = 0
keyboard.last = ""
keyboard.str = ""
keyboard.cursor = 0
keyboard.cursor_timer = 0
keyboard.cursor_flip = true
keyboard.cursor_end = 0
keyboard.selection = false

--[[
	keyboard.newBox - make a new textbox
	x - x position of the textbox
	y - y position of the textbox
	w - width of the textbox
	h - height of the textbox
	max - int max number of characters, 0 is infinite
	style - a string to refer to the style of textbox
		ex: default - rainbow border textbox
			password - same as default but hides input characters
	hidden_text - string, grey text caption for textbox
	next - int, pass id of next textbox to jump to when hitting tab
		use 0 for no textbox
	text - string, default text in textbox

	returns id of the new textbox (int)
]]
function keyboard.newBox(x, y, w, h, max, style, hidden_text, next, text)

	local tbl = {}
	tbl.text = text or ""
	tbl.style = style or "default"
	tbl.x = x
	tbl.y = y
	tbl.w = w
	tbl.h = h
	tbl.max = max or 0
	tbl.hidden_text = hidden_text or ""
	tbl.next = next or ""
	tbl.visible = true

	table.insert(keyboard.box, tbl)
	return #keyboard.box

end

function keyboard.isActive(id)
	return keyboard.active_box == id
end

function keyboard.setActive(id)
	keyboard.active_box = id
end

function keyboard.clear()
	keyboard.box = {}
	keyboard.box.active = ""
	keyboard.last = ""
	keyboard.str = ""
	keyboard.cursor = 0
	keyboard.cursor_timer = 0
	keyboard.cursor_flip = true
	keyboard.cursor_end = 0
	keyboard.selection = false
end

function keyboard.draw()

	local gc = 0.5
	local grey = {gc, gc, gc, 1}

	local i = 1
	while i <= #keyboard.box do

		local this_box = keyboard.box[i]
		local x = this_box.x
		local y = this_box.y
		local w = this_box.w
		local h = this_box.h
		local hidden_text = this_box.hidden_text
		local text = this_box.text
		local style = this_box.style
		local visible = this_box.visible
		local is_active = keyboard.isActive(i)

		if visible then

			-- Draw outline of textbox

			local active_color = c_white
			if is_active then
				-- TODO
				-- active_color = rainbow
			end
			lg.setColor(active_color)
			lg.rectangle("fill",x, y, w, h)
			lg.setColor(c_black)
			lg.rectangle("fill",x + 1, y + 1, w - 2, h - 2)

			-- is the style of the tb "password"?

			if (style == "password") then

				local hide = "";
				local j = 0
				while j < text:len() do
					hide = hide .. "•"
					j = j + 1
				end

				text = hide

			end

			-- end password style

			if not is_active then

				if hidden_text ~= "" and text == "" then
					lg.setColor(grey)
					lg.print(hidden_text, x + 5, y + 2)
				else
					lg.setColor(c_white)
					lg.print(text, x + 5, y + 2)
				end

			else

				local left = text
				local middle = ""
				local end_str = ""

				if keyboard.selection and keyboard.cursor_end ~= keyboard.cursor then

					local first = math.min(keyboard.cursor, keyboard.cursor_end)
					local last = keyboard.cursor

					if (first == keyboard.cursor) then
						last = keyboard.cursor_end
					end

					-- TODO fix
					--left = text.slice(0,first)
					--middle = text.slice(first,last)
					--end_str = text.slice(last,text.length)

					lg.setColor(c_white)
					lg.print(left, x + 5, y + 2)

					--[[
					if (middle !== "")
					{
						gfx.setColor("lightblue");
						gfx.rectangle(x + 6 + gfx.getTextWidth(left), y + 3, gfx.getTextWidth(middle), 21)
						gfx.setColor("black");
						gfx.print(middle, x + 5 + gfx.getTextWidth(left), y + 4 + fontSize);
						gfx.setColor("white");
						gfx.print(end, x + 5 + gfx.getTextWidth(left) + gfx.getTextWidth(middle), y + 4 + fontSize);
					}
					]]

				end

			end

			-- Draw cursor at the end of the textbox
			--[[
			if (keyboard.isActive(id) && keyboard.cursorFlip)
			{
				let left = text.slice(0,keyboard.cursor);
				gfx.setColor("white");
				let ox = x + gfx.getTextWidth(left);
				let oy = y + 3
				gfx.rectangle(ox + 6, oy, 2, 21)
			}
			]]

		end

		i = i + 1
	end

end

function keyboard.update(dt)

end

function keyboard.typeKey(x)

end

return keyboard