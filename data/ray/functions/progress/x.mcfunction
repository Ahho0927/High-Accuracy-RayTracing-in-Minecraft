scoreboard players operation @s rt_parameter += @s rt_progress_sign

tellraw @a {"score":{"name":"@s","objective":"rt_parameter"}}
# y = (Δy / Δx)(x - rt_shooter_x) + rt_shooter_y
scoreboard players operation @s rt_calc = @s rt_parameter
scoreboard players operation @s rt_calc *= @s rt_delta_y
scoreboard players operation @s rt_calc /= @s rt_delta_x
scoreboard players operation @s rt_calc += @s rt_shooter_y
scoreboard players operation @s rt_calc_result_y = @s rt_calc

# z = (Δz / Δx)(x - rt_shooter_x) + rt_shooter_z
scoreboard players operation @s rt_calc = @s rt_parameter
scoreboard players operation @s rt_calc *= @s rt_delta_z
scoreboard players operation @s rt_calc /= @s rt_delta_x
scoreboard players operation @s rt_calc += @s rt_shooter_z
scoreboard players operation @s rt_calc_result_z = @s rt_calc

scoreboard players operation @s rt_calc_result_x = @s rt_parameter
scoreboard players operation @s rt_calc_result_x += @s rt_shooter_x

data merge entity @s {data: {calc_result: {x:0, y:0, z:0}}}
execute store result entity @s data.calc_result.x float .0001 run scoreboard players get @s rt_calc_result_x
execute store result entity @s data.calc_result.y float .0001 run scoreboard players get @s rt_calc_result_y
execute store result entity @s data.calc_result.z float .0001 run scoreboard players get @s rt_calc_result_z
tellraw @a {"entity":"@s", "nbt":"data.calc_result"}

function ray:progress/detect_block with entity @s data.calc_result
execute if score @s rt_detected matches 1 run kill @s

# tellraw @a ["", {"text": "x: "}, {"score": {"name": "@s", "objective": "rt_calc_result_x"}}, {"text": ", y: "}, {"score": {"name": "@s", "objective": "rt_calc_result_y"}}, {"text": ", z: "}, {"score": {"name": "@s", "objective": "rt_calc_result_z"}}]

execute if score @s rt_parameter matches 200000.. run kill @s