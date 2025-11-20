local ftech = require("__fdsl__.lib.technology")

if mods["aai-industry"] then
	ftech.add_unlock("burner-mechanics", "motor-from-scrap")
	ftech.add_unlock("electricity", "electric-motor-from-scrap")
end
