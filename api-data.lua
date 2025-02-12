ScrapIndustry = {
  items = {
    ["iron-plate"] = {scrap="iron-scrap", scale=0.02, failrate=0.01},
    ["iron-gear-wheel"] = {scrap="iron-scrap", scale=0.02, failrate=0.02},
    ["iron-stick"] = {scrap="iron-scrap", scale=0.01, failrate=0.02},
    ["copper-plate"] = {scrap="copper-scrap", scale=0.02, failrate=0.01},
    ["copper-cable"] = {scrap="copper-scrap", scale=0.01, failrate=0.02},
    ["steel-plate"] = {scrap="steel-scrap", scale=0.04, failrate=0.03},
    ["electronic-circuit"] = {scrap="circuit-scrap", scale=0.01, failrate=0.03},
    ["advanced-circuit"] = {scrap="circuit-scrap", scale=0.02, failrate=0.02},
    ["processing-unit"] = {scrap="circuit-scrap", scale=0.04, failrate=0.01},
    ["speed-module"] = {scrap="circuit-scrap", scale=0.03, failrate=0.01},
    ["efficiency-module"] = {scrap="circuit-scrap", scale=0.03, failrate=0.01},
    ["productivity-module"] = {scrap="circuit-scrap", scale=0.03, failrate=0.01},
    ["speed-module-2"] = {scrap="circuit-scrap", scale=0.06},
    ["efficiency-module-2"] = {scrap="circuit-scrap", scale=0.06},
    ["productivity-module-2"] = {scrap="circuit-scrap", scale=0.06},
    ["speed-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.01},
    ["efficiency-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.01},
    ["productivity-module-3"] = {scrap="circuit-scrap", scale=0.12, failrate=-0.01},
  },
  recipes = {
    ["iron-gear-wheel"] = {ignore=true},
    ["iron-stick"] = {ignore=true},
    ["copper-cable"] = {ignore=true},
    -- ["steel-plate"] = {ignore=true},
    
    ["electronic-circuit"] = {self_scrap=true},
    ["advanced-circuit"] = {self_scrap=true},
    ["processing-unit"] = {self_scrap=true},
    
    ["automation-science-pack"] = {ignore=true},
    ["sulfuric-acid"] = {ignore=true},
  },
  categories = {
    ["smelting"] = {ignore=true}
  }
}
