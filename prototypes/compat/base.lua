ScrapIndustry.products["iron-scrap"] = {priority=1}
ScrapIndustry.products["copper-scrap"] = {priority=1}
ScrapIndustry.products["steel-scrap"] = {priority=2}
ScrapIndustry.categories["smelting"] = {ignore=true}
ScrapIndustry.items["iron-plate"] = {scrap="iron-scrap", scale=0.02, failrate=0.01}
ScrapIndustry.items["iron-gear-wheel"] = {scrap="iron-scrap", scale=0.02, failrate=0.02}
ScrapIndustry.items["iron-stick"] = {scrap="iron-scrap", scale=0.01, failrate=0.02}
ScrapIndustry.items["copper-plate"] = {scrap="copper-scrap", scale=0.02, failrate=0.01}
ScrapIndustry.items["copper-cable"] = {scrap="copper-scrap", scale=0.01, failrate=0.02}
ScrapIndustry.items["steel-plate"] = {scrap="steel-scrap", scale=0.04, failrate=0.03}
ScrapIndustry.items["pipe"] = {scrap="iron-scrap", scale=0.02, failrate=0.01}
ScrapIndustry.recipes["iron-gear-wheel"] = {ignore=true}
ScrapIndustry.recipes["iron-stick"] = {ignore=true}
ScrapIndustry.recipes["copper-cable"] = {ignore=true}

ScrapIndustry.products["stone"] = {priority=0}
ScrapIndustry.items["stone"] = {scrap="stone", scale=0.01, failrate=0.03}
ScrapIndustry.items["stone-brick"] = {scrap="stone", scale=0.01, failrate=0.02}
ScrapIndustry.items["concrete"] = {scrap="stone", scale=0.02, failrate=0.01}
ScrapIndustry.items["refined-concrete"] = {scrap="stone", scale=0.04}
ScrapIndustry.items["landfill"] = {scrap="stone", scale=0.1, failrate=0.01}
ScrapIndustry.recipes["hazard-concrete"] = {ignore=true}
ScrapIndustry.recipes["refined-hazard-concrete"] = {ignore=true}

ScrapIndustry.products["uranium-scrap"] = {priority=5}
ScrapIndustry.items["uranium-238"] = {scrap="uranium-ore", scale=0.02, failrate=0.02}
ScrapIndustry.items["uranium-235"] = {scrap="uranium-ore", scale=0.03, failrate=0.01}
ScrapIndustry.recipes["kovarex-enrichment-process"] = {no_fail=true}
ScrapIndustry.recipes["electronic-circuit"] = {self_scrap=true}
ScrapIndustry.recipes["advanced-circuit"] = {self_scrap=true}
ScrapIndustry.recipes["processing-unit"] = {self_scrap=true}

ScrapIndustry.products["circuit-scrap"] = {priority=4}
ScrapIndustry.items["electronic-circuit"] = {scrap="circuit-scrap", scale=0.01, failrate=0.03}
ScrapIndustry.items["advanced-circuit"] = {scrap="circuit-scrap", scale=0.02, failrate=0.02}
ScrapIndustry.items["processing-unit"] = {scrap="circuit-scrap", scale=0.04, failrate=0.01}

ScrapIndustry.items["speed-module"] = {scrap="circuit-scrap", scale=0.03, failrate=-0.01}
ScrapIndustry.items["efficiency-module"] = {scrap="circuit-scrap", scale=0.03, failrate=-0.01}
ScrapIndustry.items["productivity-module"] = {scrap="circuit-scrap", scale=0.03, failrate=-0.01}
ScrapIndustry.items["speed-module-2"] = {scrap="circuit-scrap", scale=0.06, failrate=-0.02}
ScrapIndustry.items["efficiency-module-2"] = {scrap="circuit-scrap", scale=0.06, failrate=-0.02}
ScrapIndustry.items["productivity-module-2"] = {scrap="circuit-scrap", scale=0.06, failrate=-0.02}
ScrapIndustry.items["speed-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.03}
ScrapIndustry.items["efficiency-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.03}
ScrapIndustry.items["productivity-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.03}

ScrapIndustry.recipes["automation-science-pack"] = {ignore=true}
ScrapIndustry.recipes["logistic-science-pack"] = {ignore=true}
ScrapIndustry.recipes["chemical-science-pack"] = {ignore=true}
ScrapIndustry.recipes["military-science-pack"] = {ignore=true}
ScrapIndustry.recipes["production-science-pack"] = {ignore=true}
ScrapIndustry.recipes["utility-science-pack"] = {ignore=true}
ScrapIndustry.recipes["space-science-pack"] = {ignore=true}
