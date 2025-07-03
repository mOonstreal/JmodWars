hook.Add("JMod_PostLuaConfigLoad", "AddCustomRecipes", function(config)
    -- Добавляем новые рецепты в раздел Craftables
    config.Craftables = config.Craftables or {}
    
    -- Пример простого рецепта
   config.Craftables["Basic details x50"] = {
    results = {"ent_jack_gmod_ezbasicparts", 1, 50}, -- Сущность, количество, количество ресурса
    craftingReqs = {
        [JMod.EZ_RESOURCE_TYPES.STEEL] = 25,
        [JMod.EZ_RESOURCE_TYPES.PLASTIC] = 15
    },
    category = "TestRes",
    craftingType = "workbench",
    description = "Basic details"
}
end)