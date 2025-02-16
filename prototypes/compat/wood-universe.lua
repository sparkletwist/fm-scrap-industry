if mods["wood-industry"] then
  ScrapIndustry.products["woodchips"] = {priority=0}
  ScrapIndustry.items["wood"] = {scrap="woodchips", scale=0.02, failrate=0.02}
  ScrapIndustry.items["lumber"] = {scrap="woodchips", scale=0.04, failrate=0.01}
end

ScrapIndustry.recipes["woodchips"] = {ignore=true}

ScrapIndustry.categories["kiln-smelting"] = {ignore=true}
ScrapIndustry.categories["organic-or-kiln-smelting"] = {ignore=true}

ScrapIndustry.recipes["sulfuric-bacteria-pruning"] = {ignore=true}
ScrapIndustry.recipes["sulfuric-bacteria-melting"] = {ignore=true}
