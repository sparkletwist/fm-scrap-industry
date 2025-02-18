local frep = require("__fdsl__.lib.recipe")

if data.raw.item["solder"] then
  frep.modify_ingredient("electronic-circuit-from-scrap", "circuit-scrap", {amount=3})
  frep.modify_ingredient("electronic-circuit-from-scrap", "copper-cable", {amount=5})
  frep.scale_result("electronic-circuit-from-scrap", "electronic-circuit", {amount=2})
  frep.add_ingredient("electronic-circuit-from-scrap", {type="item", name="solder", amount=1})
  frep.add_ingredient("advanced-circuit-from-scrap", {type="item", name="solder", amount=1})
end
