local frep = require("__fdsl__.lib.recipe")

if data.raw.item["solder"] then
  frep.add_ingredient("electronic-circuit-from-scrap", {type="item", name="solder", amount=1})
  frep.add_ingredient("advanced-circuit-from-scrap", {type="item", name="solder", amount=1})
end
