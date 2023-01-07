local myfont = draw.CreateFont( "Verdana", 16, 800 )

callbacks.Register( "Draw", function ()
    draw.Color(255, 255, 255, 255)
    draw.SetFont( myfont )

    local player = entities.GetLocalPlayer()
    local wpn = player:GetPropEntity("m_hActiveWeapon")

    if wpn ~= nil then
        local critChance = wpn:GetCritChance()
        local dmgStats = wpn:GetWeaponDamageStats()
        local totalDmg = dmgStats["total"]
        local criticalDmg = dmgStats["critical"]

        -- (the + 0.1 is always added to the comparsion)
        local cmpCritChance = critChance + 0.1

        -- If we are allowed to crit
        if wpn:GetCritTokenBucket() > 10 then
            draw.Text( 500, 510, "We can crit just fine!")
        else --Figure out how much damage we need

            draw.Text( 500, 510, "Crit Banned")
        end
    end
end )