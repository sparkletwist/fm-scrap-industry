-- overrides the data in prototypes.compat.base
ScrapIndustry.products["sand"] = {priority=0}
ScrapIndustry.items["stone"] = {scrap="sand", scale=0.01, failrate=0.03}
ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=0.02, failrate=0.02}
ScrapIndustry.items["concrete"] = {scrap="sand", scale=0.04, failrate=0.01}
ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=0.08}
ScrapIndustry.items["glass"] = {scrap="sand", scale=0.02, failrate=0.04}
ScrapIndustry.items["landfill"] = {scrap="sand", scale=0.2, failrate=0.01}
ScrapIndustry.recipes["sand"] = {ignore=true}
ScrapIndustry.recipes["glass"] = {self_scrap=true}

ScrapIndustry.items["motor"] = {scrap="iron-scrap", scale=0.04, failrate=0.02}
ScrapIndustry.items["engine-unit"] = {scrap="steel-scrap", scale=0.08, failrate=0.01}
ScrapIndustry.items["electric-motor"] = {scrap="circuit-scrap", scale=0.04, failrate=0.02}
ScrapIndustry.items["electric-engine-unit"] = {scrap="circuit-scrap", scale=0.08, failrate=0.01}
