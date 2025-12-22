if mods["crushing-industry"] then
	ScrapIndustry.products["sand"] = {priority=0.5}
	ScrapIndustry.items["glass"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
	ScrapIndustry.items["concrete"] = {scrap="sand", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=4*ScrapIndustry.CHEAP}
	ScrapIndustry.items["landfill"] = {scrap="sand", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.recipes["sand"] = {ignore=true}

	local mercy_mode = not settings.startup["scrap-industry-no-mercy"].value
	if mercy_mode then
		ScrapIndustry.recipes["optical-fiber"] = {ignore=true}
	end
	ScrapIndustry.items["optical-fiber"] = {scrap={"copper-scrap"}, scale=ScrapIndustry.CHEAP, failrate=0.01}
	if settings.startup["scrap-industry-plastic"].value then
		table.insert(ScrapIndustry.items["optical-fiber"].scrap, "plastic-bits")
	end
end
