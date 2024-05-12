tag @s add rt
tag @s add rt_main
tag @s add init

execute store result score @s rt_original_x run data get entity @s Pos[0] 10000
execute store result score @s rt_original_y run data get entity @s Pos[1] 10000
execute store result score @s rt_original_z run data get entity @s Pos[2] 10000

execute store result score @s rt_delta_x positioned ^ ^ ^1 run data get entity @e[tag=rt_direction, limit=1, sort=nearest] Pos[0] 10000
execute store result score @s rt_delta_y positioned ^ ^ ^1 run data get entity @e[tag=rt_direction, limit=1, sort=nearest] Pos[1] 10000
execute store result score @s rt_delta_z positioned ^ ^ ^1 run data get entity @e[tag=rt_direction, limit=1, sort=nearest] Pos[2] 10000
scoreboard players operation @s rt_delta_x -= @s rt_original_x
scoreboard players operation @s rt_delta_y -= @s rt_original_y
scoreboard players operation @s rt_delta_z -= @s rt_original_z
execute positioned ^ ^ ^1 run kill @e[tag=rt_direction, limit=1, sort=nearest]

scoreboard players operation @s rt_abs_x = @s rt_delta_x
scoreboard players operation @s rt_abs_y = @s rt_delta_y
scoreboard players operation @s rt_abs_z = @s rt_delta_z
scoreboard players operation @s[scores={rt_abs_x=..-1}] rt_abs_x *= -1 const
scoreboard players operation @s[scores={rt_abs_y=..-1}] rt_abs_y *= -1 const
scoreboard players operation @s[scores={rt_abs_z=..-1}] rt_abs_z *= -1 const

scoreboard players set @s rt_progress_direction 0
execute if score @s rt_abs_x < @s rt_abs_z run scoreboard players set @s rt_progress_direction 2