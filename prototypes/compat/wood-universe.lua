if mods["wood-industry"] then
  ScrapIndustry.products["woodchips"] = {priority=0.2}
  ScrapIndustry.items["wood"] = {scrap="woodchips", scale=ScrapIndustry.COMMON, failrate=0.02}
  ScrapIndustry.items["lumber"] = {scrap="woodchips", scale=ScrapIndustry.PRODUCT, failrate=0.01}
  ScrapIndustry.items["wood-transport-belt"] = {scrap="woodchips", scale=ScrapIndustry.COMMON, failrate=0.02}
  ScrapIndustry.items["wood-underground-belt"] = {scrap="woodchips", scale=ScrapIndustry.UNCOMMON, failrate=0.01}
  ScrapIndustry.items["wood-splitter"] = {scrap="woodchips", scale=ScrapIndustry.UNCOMMON, failrate=0.01}
  ScrapIndustry.items["small-electric-pole"] = {scrap="woodchips", scale=ScrapIndustry.CHEAP, failrate=0.01}
end

if mods["crushing-industry"] then
  ScrapIndustry.items["glass"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
  ScrapIndustry.items["stone"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
  ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
  ScrapIndustry.items["concrete"] = {scrap="sand", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
  ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=4*ScrapIndustry.CHEAP}
  ScrapIndustry.items["landfill"] = {scrap="sand", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
end

ScrapIndustry.recipes["woodchips"] = {ignore=true}

ScrapIndustry.categories["kiln-smelting"] = {ignore=true}
ScrapIndustry.categories["organic-or-kiln-smelting"] = {ignore=true}

ScrapIndustry.recipes["sulfuric-bacteria-pruning"] = {ignore=true}
ScrapIndustry.recipes["sulfuric-bacteria-melting"] = {ignore=true}
