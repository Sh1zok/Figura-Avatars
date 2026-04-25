if not host:isHost() then return end

-- Создание страниц колеса действий
mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage) -- Задание активной страницы

outfits = mainPage:newAction()  -- При прокручивании переключает наряды
    :setTitle(updateOutfitButtonTitle())
    :setTexture(updateOutfitButtonTexture()) -- Начальная текстура кнопки
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onScroll(function(dir)
        outfitButtonSelect(dir)
        outfits:title(updateOutfitButtonTitle())
        outfits:setTexture(updateOutfitButtonTexture())
    end)
actions = mainPage:newAction()
    :title(updateActionButtonTitle())
    :item("minecraft:light")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        actionButtonPlay()
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onRightClick(function()
        actionButtonStop()
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onScroll(function(dir)
        actionButtonSelect(dir)
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
