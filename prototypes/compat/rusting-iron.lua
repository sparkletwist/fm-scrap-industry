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

  RustingIron.rusting_items["iron-scrap"] = {
    rust_timescale = RustingIron.RUSTING_FAST,
    derust_timescale = RustingIron.DERUST_EASY,
    derust_amount = 2,
    icon_root = "__scrap-industry__/graphics/icons/iron-scrap",
  }
end
