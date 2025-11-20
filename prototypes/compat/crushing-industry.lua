if mods["crushing-industry"] then
	ScrapIndustry.products["sand"] = {priority=0.5}
	ScrapIndustry.items["glass"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
	ScrapIndustry.items["concrete"] = {scrap="sand", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=4*ScrapIndustry.CHEAP}
	ScrapIndustry.items["landfill"] = {scrap="sand", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.recipes["sand"] = {ignore=true}
end
