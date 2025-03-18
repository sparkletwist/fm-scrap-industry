require("prototypes.recipe-final-fixes")

if mods["Rocs-Rusting-Iron"] then
  if data.raw.item["iron-scrap-rusty"] then
    data.raw.item["iron-scrap-rusty"].pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty-2.png", scale = 0.5, mipmap_count = 4},
    }
  end
end
