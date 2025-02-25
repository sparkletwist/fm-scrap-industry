ScrapIndustry.products["tungsten-scrap"] = {priority=3}
ScrapIndustry.items["tungsten-carbide"] = {scrap="tungsten-scrap", scale=0.24, failrate=0.03, recycle=1.5}
ScrapIndustry.items["tungsten-plate"] = {scrap="tungsten-scrap", scale=0.36, failrate=0.01, recycle=4}
ScrapIndustry.recipes["tungsten-carbide"] = {self_scrap=true}
ScrapIndustry.recipes["casting-low-density-structure"] = {ignore=true}

ScrapIndustry.products["holmium-scrap"] = {priority=3}
ScrapIndustry.items["holmium-plate"] = {scrap="holmium-scrap", scale=0.12, failrate=0.02, recycle=1}
ScrapIndustry.items["superconductor"] = {scrap={"holmium-scrap", "copper-scrap"}, scale=0.12, failrate=0.02}
ScrapIndustry.items["supercapacitor"] = {scrap={"holmium-scrap", "circuit-scrap"}, scale=0.24, failrate=0.01}

if settings.startup["scrap-industry-plastic"].value then
  table.insert(ScrapIndustry.items["superconductor"].scrap, "plastic-bits")
end

ScrapIndustry.products["spoilage"] = {priority=0.1}
ScrapIndustry.items["nutrients"] = {scrap="spoilage", scale=0.04, failrate=0.04}
ScrapIndustry.items["yumako-mash"] = {scrap="spoilage", scale=0.12, failrate=0.03}
ScrapIndustry.items["jelly"] = {scrap="spoilage", scale=0.18, failrate=0.02}
ScrapIndustry.items["bioflux"] = {scrap="spoilage", scale=0.36, failrate=0.01}
ScrapIndustry.items["biter-egg"] = {scrap="spoilage", scale=0.48, failrate=0.01}
ScrapIndustry.items["pentapod-egg"] = {scrap="spoilage", scale=0.48, failrate=0.01}
ScrapIndustry.products["iron-bacteria"] = {ignore=true}
ScrapIndustry.products["copper-bacteria"] = {ignore=true}

if settings.startup["scrap-industry-lithium"].value then
  ScrapIndustry.products["lithium-dust"] = {priority=10}
  ScrapIndustry.items["lithium"] = {scrap="lithium-dust", scale=0.08, failrate=0.02, recycle=1}
  ScrapIndustry.items["lithium-plate"] = {scrap="lithium-dust", scale=0.12, failrate=0.01, recycle=1}
  ScrapIndustry.recipes["lithium-plate"] = {self_scrap=true}
  ScrapIndustry.recipes["lithium"] = {self_scrap=true}
else
  ScrapIndustry.recipes["lithium"] = {ignore=true}
end

ScrapIndustry.items["quantum-processor"] = {scrap="circuit-scrap", scale=0.72, failrate=-0.01}
ScrapIndustry.recipes["quantum-processor"] = {failrate=0.01}

ScrapIndustry.recipes["speed-module-3"] = {failrate=0.01}
ScrapIndustry.recipes["productivity-module-3"] = {failrate=0.01}
ScrapIndustry.recipes["efficiency-module-3"] = {failrate=0.01}
ScrapIndustry.recipes["quality-module-3"] = {failrate=0.01}

ScrapIndustry.products["metallurgic-science-pack"] = {ignore=true}
ScrapIndustry.products["agricultural-science-pack"] = {ignore=true}
ScrapIndustry.products["electromagnetic-science-pack"] = {ignore=true}
ScrapIndustry.products["cryogenic-science-pack"] = {ignore=true}
ScrapIndustry.products["promethium-science-pack"] = {ignore=true}
