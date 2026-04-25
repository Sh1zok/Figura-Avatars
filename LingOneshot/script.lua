vanilla_model.ALL:setVisible(false)

local page = action_wheel:newPage()
action_wheel:setPage(page)

nameplate.ALL:setText("LingFromOneshot\n§7[${name} §f${badges}§7]")

function pings.hideHit1()
    models.pancake.World.pancakes.hit1:setVisible(false)

    if player:isLoaded() then
        sounds:playSound("entity.generic.eat", player:getPos())
    end
end
function pings.hideHit2()
    models.pancake.World.pancakes.hit2:setVisible(false)

    if player:isLoaded() then
        sounds:playSound("entity.generic.eat", player:getPos())
    end
end
function pings.hideHit3()
    models.pancake.World.pancakes.hit3:setVisible(false)

    if player:isLoaded() then
        sounds:playSound("entity.generic.eat", player:getPos())
    end
end
function pings.hideHit4()
    models.pancake.World.pancakes.hit4:setVisible(false)

    if player:isLoaded() then
        sounds:playSound("entity.generic.eat", player:getPos())
    end
end
function pings.hidePlate()
    models.pancake.World.plate:setVisible(false)

    if player:isLoaded() then
        if math.random(1, 2) == 1 then
            sounds:playSound("assets.plate_breaks1", player:getPos())
        else
            sounds:playSound("assets.plate_breaks2", player:getPos())
        end
    end
end

function pings.summonPancakes(pos)
    models.pancake.World:setPos(pos * 16)

    models.pancake.World.pancakes.hit1:setVisible(true)
    models.pancake.World.pancakes.hit2:setVisible(true)
    models.pancake.World.pancakes.hit3:setVisible(true)
    models.pancake.World.pancakes.hit4:setVisible(true)
    models.pancake.World.plate:setVisible(true)

    local stopWork = false
    local hits = 0
    local hit1released = false
    local hit2released = false
    local hit3released = false
    local hit4released = false

    function events.tick(delta, context) -- 123yeah_boi321 - Author of that code. Dude, you cool!
        if stopWork == false then
            if not player:isLoaded() then return end
            local cakePos = models.pancake.World:partToWorldMatrix():apply()
            for _, player in pairs(world:getPlayers()) do
                local pos = player:getPos(delta) + vec(0, player:getEyeHeight(delta), 0)
                local dist = (cakePos - pos):length()
                pos = pos + player:getLookDir(delta)*dist
                if player:isSwingingArm() and (cakePos - pos):length() <= 0.55 then
                    hits = hits + 1
                end
            end
        end

        if (hits > 0) and (not hit1released) then
            pings.hideHit1()
            hit1released = true
        end
        if (hits > 6) and (not hit2released) then
            pings.hideHit2()
            hit2released = true
        end
        if (hits > 12) and (not hit3released) then
            pings.hideHit3()
            hit3released = true
        end
        if (hits > 18) and (not hit4released) then
            pings.hideHit4()
            hit4released = true
        end
        if (hits > 24) and (not stopWork) then
            pings.hidePlate()
            stopWork = true
        end
    end
end

summonPancakes = page:newAction()
    :title("Summon some pancakes")
    :item("minecraft:pumpkin_pie")
    :onLeftClick(function ()
        pings.summonPancakes(player:getPos())
    end)
