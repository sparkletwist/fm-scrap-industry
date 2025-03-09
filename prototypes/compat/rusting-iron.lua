local ftech = require("__fdsl__.lib.technology")

if mods["Rocs-Rusting-Iron"] and settings.startup["scrap-industry-rust"].value then
  ScrapIndustry.items["rocs-rusting-iron-iron-plate-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=ScrapIndustry.FLAVOR, failrate=0.02, recycle=2}
  ScrapIndustry.items["rocs-rusting-iron-iron-gear-wheel-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=ScrapIndustry.FLAVOR, failrate=0.04}
  ScrapIndustry.items["rocs-rusting-iron-iron-stick-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=ScrapIndustry.FLAVOR, failrate=0.04}
  ScrapIndustry.items["rocs-rusting-iron-engine-unit-rusty"] = {scrap={"rocs-rusting-iron-iron-scrap-rusty", "steel-scrap"}, scale=2*ScrapIndustry.FLAVOR, failrate=0.08}
  ScrapIndustry.items["rocs-rusting-iron-motor-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=2*ScrapIndustry.FLAVOR, failrate=0.08}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-scrap-chemical-derusting"] = {failrate=0.01}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-plate-chemical-derusting"] = {failrate=0.01}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-gear-wheel-chemical-derusting"] = {failrate=0.01}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-stick-chemical-derusting"] = {failrate=0.01}
  ScrapIndustry.recipes["rocs-rusting-iron-engine-unit-chemical-derusting"] = {failrate=0.01}
  ScrapIndustry.recipes["rocs-rusting-iron-motor-chemical-derusting"] = {failrate=0.01}

  data.raw.item["iron-scrap"].spoil_ticks = 0.5 * minute * settings.startup["rocs-rusting-iron-time-minutes"].value
  data.raw.item["iron-scrap"].spoil_result = "rocs-rusting-iron-iron-scrap-rusty"
  
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-scrap-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-plate-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-gear-wheel-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-stick-chemical-derusting")
  if mods["aai-industry"] then
    ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-motor-chemical-derusting")
  else
    ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-engine-unit-chemical-derusting")
  end
end
