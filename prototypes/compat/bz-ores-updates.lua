local ftech = require("__fdsl__.lib.technology")

if mods["bzlead"] then
  ftech.add_unlock("kiln-smelting", "lead-plate-from-scrap")
  if mods["space-age"] and settings.startup["scrap-industry-metallurgy"].value then
    ftech.add_unlock("foundry", "molten-lead-from-scrap")
  end
end

if mods["bztitanium"] then
  ftech.add_unlock("titanium-processing", "titanium-plate-from-scrap")
end
