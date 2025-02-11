local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

frep.add_ingredient("engine-unit", {type="item", name="iron-scrap", amount=1, probability=0.04})
frep.add_ingredient("engine-unit", {type="item", name="iron-scrap", amount=1, probability=0.01})
frep.add_ingredient("electronic-circuit", {type="item", name="circuit-scrap", amount=1, probability=0.01})
frep.add_ingredient("electric-engine-unit", {type="item", name="circuit-scrap", amount=1, probability=0.05})
