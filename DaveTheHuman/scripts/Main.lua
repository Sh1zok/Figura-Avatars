-- Определение момента пока рук
if host:isHost() then
    function events.render()
        renderer:setRenderLeftArm(player:getHeldItem(not player:isLeftHanded()).id == "minecraft:air")
        renderer:setRenderRightArm(player:getHeldItem(player:isLeftHanded()).id == "minecraft:air")
    end
end



--[[
    Высота камеры
]]--
renderer:setEyeOffset(0, 0.25, 0)
if host:isHost() then
    local cameraOffsetY = 0.25
    function events.render()
        if player:isLoaded() then
            cameraOffsetY = models.model.root.Body.Neck.Head.Face.Irises:partToWorldMatrix():apply().y - models.model.normalViewpoint:partToWorldMatrix():apply().y + 0.25 
            if player:getPose() == "CROUCHING" then cameraOffsetY = cameraOffsetY + 0.25 end
            if player:getPose() == "SWIMMING" then cameraOffsetY = cameraOffsetY - 0.5 end
        end

        renderer:offsetCameraPivot(0, cameraOffsetY, 0)
    end
end



--[[
    Кастомная именная табличка
]]--
nameplate.Entity:setPos(0, 0.25, 0) -- Высота панели никнейма
nameplate.Entity:setOutline(true) -- Обводка никнейма
nameplate.Entity:setOutlineColor(0, 0.75, 0.75) -- Цвет обводки
nameplate.Entity:setBackgroundColor(0, 0, 0, 0) -- Фон никнейма

function pings.setNameplate(value)
    nameplate.ALL:setText(
        toJson({
            text = value .. "Sh1zok",
            ["hoverEvent"] = {
                ["action"] = "show_text",
                ["contents"] = {
                    {text = "Oh! Looks like"}, {text = " §lSh1zok", color = "#00FFFF"}, {text = " is here!\n"},
                    {text = "§b§lPronouns: §f§lHe / §l§mtler§f§lHim\n"},
                    {text = "\n"},
                    {text = "§dAnother internet schiz.\nGoofing on the internet with\nno idea what I'm doing.\n"},
                    {text = "\n"},
                    {text = "§lDiscord:§f ", color = "#5662F6"}, {text = "@sh1zok_was_here\n"},
                    {text = "§lGit", color = "#F0F6FC"}, {text = "§lHub: ", color = "#394963"}, {text = "Sh1zok"}
                },
            },
        })
    )
end

if host:isHost() then
    local oldHostState = ""

    function events.tick()
        hostState = ":info: "

        if host:isChatOpen() then hostState = hostState .. ":typing: " end
        if not client:isWindowFocused() then hostState = hostState .. ":zzz: " end
        if host:isContainerOpen() then hostState = hostState .. ":open_folder_paper: " end
        if isMicWorking then hostState = hostState .. ":speak: " end

        if hostState ~= oldHostState then
            pings.setNameplate(hostState)
            oldHostState = hostState
        end
    end
end

function events.render()
    local hostPos = player:getPos()
    local viewerPos = client:getViewer():getPos()
    local distance = math.sqrt((hostPos - viewerPos).x ^ 2 + (hostPos - viewerPos).y ^ 2 + (hostPos - viewerPos).z ^ 2)

    local nameplateScale = 1 - distance / 5
    if nameplateScale < 0 then nameplateScale = 0 end

    nameplate.Entity:setScale(nameplateScale)
end



--[[
    Остальное
]]--
-- Убираем ванильную модель
vanilla_model.PLAYER:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

-- Скорости анимаций
function events.render()
    local speedXZ = math.sqrt(player:getVelocity().x ^ 2 + player:getVelocity().z ^ 2) * 4.63266 -- Скорость игрока в координатах X и Z
    local speedY = math.abs(player:getVelocity().y) -- Скорость игрока по координате Y
    local sprintingSpeed = speedXZ * 2.75 -- Скорость анимации бега

    -- Поправка скорости для бега в припрыжку
    if (host:isHost() == true) and (speedY > 0) then sprintingSpeed = sprintingSpeed * speedY * 1.8
    elseif (host:isHost() == false) and (speedY > 0.01) then sprintingSpeed = sprintingSpeed * speedY * 3.1 end

    -- Выставление скорстей анимаций
    animations.model.walking:setSpeed(speedXZ * 4.13)
    animations.model.walkingback:setSpeed(speedXZ * 4.13)
    animations.model.sprinting:setSpeed(sprintingSpeed)
    animations.model.crouchwalk:setSpeed(speedXZ * 5)
    animations.model.crouchwalkback:setSpeed(speedXZ * 5)
    animations.model.crawling:setSpeed(speedXZ * 5.5)
    animations.model.falling:setSpeed(speedY / -3.92)
end
