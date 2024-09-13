-- Define the function to check for ores
function checkForOre()
    local success, data = turtle.inspect()
    if success and (data.name == "minecraft:coal_ore" or data.name == "minecraft:iron_ore" or data.name == "minecraft:gold_ore" or data.name == "minecraft:diamond_ore" or data.name == "minecraft:redstone_ore" or data.name == "minecraft:lapis_ore" or data.name == "minecraft:emerald_ore" or data.name == "minecraft:amethyst_cluster" or data.name == "projectarchitect2:copper_ore" or data.name == "projectarchitect2:tin_ore" or data.name == "projectarchitect2:silver_ore" or data.name == "projectarchitect2:lead_ore" or data.name == "projectarchitect2:nickel_ore" or data.name == "projectarchitect2:uranium_ore" or data.name == "projectarchitect2:platinum_ore" or data.name == "minecraft:deepslate_coal_ore" or data.name == "minecraft:deepslate_iron_ore" or data.name == "minecraft:deepslate_gold_ore" or data.name == "minecraft:deepslate_diamond_ore" or data.name == "minecraft:deepslate_redstone_ore" or data.name == "minecraft:deepslate_lapis_ore" or data.name == "minecraft:deepslate_emerald_ore") then
        return data.name
    end
    return nil
end

-- Define the function to mine a vein of ore
function mineVein(oreType)
    local count = 0
    while checkForOre() == oreType do
        turtle.dig()
        turtle.forward()
        count = count + 1
    end
    for i = 1, count do
        turtle.back()
    end
    return count
end

-- Define the function to refuel the turtle
function refuelTurtle()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 100 then
        turtle.select(2)
        while turtle.refuel(1) do
        end
        turtle.select(1)
    end
end

-- Define the function to deposit the mined ores
function depositOres()
    turtle.select(1)
    while not turtle.full() do
        turtle.drop()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.select(1)
    while not turtle.empty() do
        turtle.dropUp()
    end
    turtle.turnLeft()
    turtle.back()
    turtle.turnRight()
end

-- Define the main program loop
while true do
    local oreFound = checkForOre()
    if oreFound then
        local oreCount = mineVein(oreFound)
        if oreCount > 0 then
            depositOres()
        end
    end
    refuelTurtle()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
end