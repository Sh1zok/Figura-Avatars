squapi = require("scripts.libraries.SquAPI") -- Подключение SquAPI
squapi.smoothHead:new({models.model.root.Body, models.model.root.Body.Neck, models.model.root.Body.Neck.Head}, {0, 0.375, 0.375}, nil, 1, false) -- Гладкий поворот головы
squapi.eye:new(models.model.root.Body.Neck.Head.Face.Irises.LeftIris, 0.125, 0.25, 0.25, 0.25) -- Настройка левого глаза
squapi.eye:new(models.model.root.Body.Neck.Head.Face.Irises.RightIris, 0.25, 0.125, 0.25, 0.25) -- Настройка правого глаза
squapi.randimation:new(animations.model.randBlink, 60, true) -- Настройка анимации моргания



-- Настройка анимаций
animations.model.crouching:setPriority(1)
animations.model.spearR:setPriority(2)
animations.model.spearL:setPriority(2)
animations.model.bowR:setPriority(2)
animations.model.bowL:setPriority(2)
animations.model.crossR:setPriority(2)
animations.model.crossL:setPriority(2)
animations.model.mineR:setPriority(2)
animations.model.mineL:setPriority(2)
animations.model.randBlink:setPriority(3)
animations.model.spyglassR:setPriority(4)
animations.model.spyglassL:setPriority(4)
animations.model.gliding:setPriority(5)
animations.model.actionHighFiveCheck:setPriority(4)
animations.model.pnpWhileGrabbed:setPriority(99):setBlendTime(5, 10)
animations.model.pnpWhileGrabbing:setPriority(98):setBlendTime(7.5)



require("scripts.libraries.SAM")
stopingAnimsList = {
    ["walking"] = {
        animations.model.walking,
        animations.model.walkingback,
        animations.model.swimming,
        animations.model.waterup
    },
    ["sprinting"] = {
        animations.model.sprinting,
        animations.model.falling,
        animations.model.sleeping,
        animations.model.gliding,
        animations.model.elytra
    },
    ["crouching"] = {
        animations.model.crouching,
        animations.model.crouchwalk,
        animations.model.crouchwalkback,
        animations.model.sitting
    },
    ["arms"] = {
        animations.model.attackR,
        animations.model.attackL,
        animations.model.spearL,
        animations.model.spearR,
        animations.model.crossL,
        animations.model.crossR,
        animations.model.bowL,
        animations.model.bowR,
        animations.model.spyglassR,
        animations.model.spyglassL,
        animations.model.mineR,
        animations.model.mineL
    },
    ["flying"] = {
        animations.model.flying,
        animations.model.flywalk,
        animations.model.flywalkback,
        animations.model.flyup,
        animations.model.flydown
    }
}
actionsList = {
    {"Приветствие", animations.model.actionWave, 3, {"arms"}},
    {"Указать на место", animations.model.actionPointUp, 3, {"arms"}},
    {"Хлопки", animations.model.actionClaps, 3, {"sprinting", "arms", "flying"}},
    {"Интерес", animations.model.actionInterested, 3, {"arms", "sprinting"}},
    {"Руки за спиной", animations.model.actionHandsBehindBack, 3, {"arms", "sprinting"}},
    {"Задумался", animations.model.actionThinking, 3, {"arms", "sprinting"}},
    {"Безумие", animations.model.actionCrazy, 0, {}},
    {"Грусть", animations.model.actionSaddy, 0, {}},
    {'Танец "Удар казачка"', animations.model.actionKazotskyKick, 3, {"crouching", "sprinting", "flying"}},
    {"Отдыхает", animations.model.actionResting, 3, {"sprinting", "crouching", "arms", "flying"}},
    {"Снять шляпу", animations.model.actionTakeOffHat, 0, {}},
    {"Дымовая шашка", animations.model.actionSmokeBomb, 0, {}},
    {"Пятюня", animations.model.actionHighFive, 3, {"sprinting", "crouching", "arms", "flying"}}
}
actionButtonCommonColor = "§3"
actionButtonDescription = "Список действий:\n"
blendActionAnimations(7.5)



require("scripts.libraries.SOM")
outfitsList = {
    {"Классический", "textures.Outfits.classic", "textures.Icons.classicOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Зимний", "textures.Outfits.winter", "textures.Icons.winterOutfitIcon", 1, 1, "textures.Misc.hatDefault"},
    {"Оффициальный белый", "textures.Outfits.officialWhite", "textures.Icons.officialWhiteOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Оффициальный чёрный", "textures.Outfits.officialBlack", "textures.Icons.officialBlackOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Садовый", "textures.Outfits.gardenGreen", "textures.Icons.gardenGreenOutfitIcon", 0, 1, "textures.Misc.hatGardenGreen"},
    {"Мафия", "textures.Outfits.mafia", "textures.Icons.mafiaOutfitIcon", 0.5, 0, "textures.Misc.hatMafia"},
    {"Джокер", "textures.Outfits.joker", "textures.Icons.jokerOutfitIcon", 0, 1, "textures.Misc.hatDefault"}
}
outfitModelParts = {
    models.model.root.Body.Body,
    models.model.root.Body.Jacket,
    models.model.root.Body.Neck.Neck,
    models.model.root.Body.Neck.Head.Head,
    models.model.root.Body.Neck.Head.Hairs,
    models.model.root.Body.Neck.Head.Hat,
    models.model.root.Body.Neck.Head.Face.FaceMask,
    models.model.root.Body.Neck.Head.Face.Brows,
    models.model.root.Body.Neck.Head.Face.Eyelids,
    models.model.root.Body.Neck.Head.Face.Irises,
    models.model.root.Body.LeftArm,
    models.model.root.Body.RightArm,
    models.model.root.Body.Elytra,
    models.model.root.LeftLeg,
    models.model.root.RightLeg
}
hatModelPart = models.model.root.Body.Neck.Head.Hat
headSecondLayerModelPart = models.model.root.Body.Neck.Head.Hairs
outfitButtonCommonColor = "§3"
outfitButtonDescription = "Список нарядов:\n"



--[[
    Специальные действия, переменные
]]--
local highFiveCheck = false
local smokeBombPosition = {0, 0, 0}
local smokeAmount = 1200
local clapSoundCooldown = 7


--[[
    Специальные действия
]]--
function events.render()
    if activeAction[1] == "Указать на место" then
        models.model.root.Body.LeftArm:setRot((vanilla_model.HEAD:getOriginRot() + 180) % 360 - 1800)
        models.model.root.Body.LeftArm:setRot(models.model.root.Body.LeftArm:getRot().x, -1 * models.model.root.Body.LeftArm:getRot().y, models.model.root.Body.LeftArm:getRot().z)
    else
        models.model.root.Body.LeftArm:setRot(0, 0, 0)
    end
end

function events.tick(delta)
    if activeAction[1] == "Пятюня" then
        local hand_pos = models.model.root.Body.RightArm.RABottom.RightItemPivot:partToWorldMatrix():apply()
        for _, player in pairs(world:getPlayers()) do
            local pos = player:getPos(delta) + vec(0, player:getEyeHeight(delta), 0)
            local dist = (hand_pos - pos):length()
            pos = pos + player:getLookDir(delta)*dist
            if player:isSwingingArm() and (hand_pos - pos):length() <= 0.3 and not animations.model.actionHighFiveCheck:isPlaying() then
                highFiveCheck = true
            end
        end
        if highFiveCheck then
            animations.model.actionHighFiveCheck:play()
            sounds:playSound("block.froglight.step", player:getPos(), 15, 1, false)

            highFiveCheck = false
        end
    end

    if activeAction[1] == "Дымовая шашка" and smokeAmount > 0 then
        if animations.model.actionSmokeBomb:isPlaying() then
            smokeBombPosition = player:getPos()
        else
            smokeAmount = smokeAmount - 1

            sounds:playSound("entity.squid.squirt", smokeBombPosition, smokeAmount / 5000, math.abs(-1 - (1200 - smokeAmount) / 2000), false)

            if client:getFPS() > 030 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 040 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 050 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 060 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 070 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 080 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 090 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
            if client:getFPS() > 100 then particles:newParticle("minecraft:campfire_signal_smoke", math.random(smokeBombPosition[1] - 7.5, smokeBombPosition[1] + 7.5), smokeBombPosition[2], math.random(smokeBombPosition[3] - 7.5, smokeBombPosition[3] + 7.5), math.random(-75, 75) / 1000, math.random(75, 150) / 1000, math.random(-75, 75) / 1000):setScale(10):setColor(128, 128, 128, 1) end
        end
    else
        if activeAction[1] == "Дымовая шашка" then
            activeAction = {"Нет", nil, 0, true}
            smokeAmount = 1200
        end
    end

    if activeAction[1] == "Хлопки" then
        if clapSoundCooldown <= 0 then
            sounds:playSound("block.froglight.step", player:getPos(), 15, 2, false)
            clapSoundCooldown = 7
        else
            clapSoundCooldown = clapSoundCooldown - 1
        end
    end
end

--[[
    Горячие клавиши
]]--
if host:isHost() then
    keybinds:newKeybind("Предыдущий наряд", "key.keyboard.up"):onPress(function ()
        outfitButtonSelect(1)
        outfits:title(updateOutfitButtonTitle())
        outfits:setTexture(updateOutfitButtonTexture())
    end)
    keybinds:newKeybind("Следующий наряд", "key.keyboard.down"):onPress(function ()
        outfitButtonSelect(-1)
        outfits:title(updateOutfitButtonTitle())
        outfits:setTexture(updateOutfitButtonTexture())
    end)
    keybinds:newKeybind("Остановить действие", "key.keyboard.keypad.0"):onPress(function ()
        pings.stopAction()
    end)
    keybinds:newKeybind(actionsList[1][1], "key.keyboard.keypad.1"):onPress(function ()
        pings.playAction(1)
    end)
    keybinds:newKeybind(actionsList[2][1], "key.keyboard.keypad.2"):onPress(function ()
        pings.playAction(2)
    end)
    keybinds:newKeybind(actionsList[3][1], "key.keyboard.keypad.3"):onPress(function ()
        pings.playAction(3)
    end)
    keybinds:newKeybind(actionsList[4][1], "key.keyboard.keypad.4"):onPress(function ()
        pings.playAction(4)
    end)
    keybinds:newKeybind(actionsList[5][1], "key.keyboard.keypad.5"):onPress(function ()
        pings.playAction(5)
    end)
    keybinds:newKeybind(actionsList[6][1], "key.keyboard.keypad.6"):onPress(function ()
        pings.playAction(6)
    end)
    keybinds:newKeybind(actionsList[7][1], "key.keyboard.keypad.7"):onPress(function ()
        pings.playAction(7)
    end)
    keybinds:newKeybind(actionsList[8][1], "key.keyboard.keypad.8"):onPress(function ()
        pings.playAction(8)
    end)
    keybinds:newKeybind(actionsList[9][1], "key.keyboard.keypad.9"):onPress(function ()
        pings.playAction(9)
    end)
end