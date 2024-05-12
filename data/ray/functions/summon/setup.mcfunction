execute store result score @s rt_original_x run data get entity @s Pos[0] 10000
execute store result score @s rt_original_y run data get entity @s Pos[1] 10000
execute store result score @s rt_original_z run data get entity @s Pos[2] 10000

execute store result score @s rt_delta_x positioned ^ ^ ^.1 run data get entity @e[tag=rt_tracer, limit=1, sort=nearest] Pos[0] 10000
execute store result score @s rt_delta_y positioned ^ ^ ^.1 run data get entity @e[tag=rt_tracer, limit=1, sort=nearest] Pos[1] 10000
execute store result score @s rt_delta_z positioned ^ ^ ^.1 run data get entity @e[tag=rt_tracer, limit=1, sort=nearest] Pos[2] 10000

scoreboard players operation @s rt_delta_x -= @s rt_original_x
scoreboard players operation @s rt_delta_y -= @s rt_original_y
scoreboard players operation @s rt_delta_z -= @s rt_original_z

scoreboard players operation @s rt_abs_x = @s rt_delta_x
scoreboard players operation @s rt_abs_y = @s rt_delta_y
scoreboard players operation @s rt_abs_z = @s rt_delta_z
execute if score @s rt_abs_x matches ..-1 run scoreboard players operation @s rt_abs_x *= -1 const
execute if score @s rt_abs_y matches ..-1 run scoreboard players operation @s rt_abs_y *= -1 const
execute if score @s rt_abs_z matches ..-1 run scoreboard players operation @s rt_abs_z *= -1 const
# 0:x, 1:z, 2:y
execute if score @s rt_abs_x >= @s rt_abs_z run scoreboard players set @s rt_progress_direction 0
execute if score @s rt_abs_z > @s rt_abs_x run scoreboard players set @s rt_progress_direction 1
execute unless entity @s[x_rotation=-45..45] run scoreboard players set @s rt_progress_direction 2

execute if score @s rt_progress_direction matches 0 run scoreboard players operation @s rt_progress_sign = @s rt_delta_x
execute if score @s rt_progress_direction matches 2 run scoreboard players operation @s rt_progress_sign = @s rt_delta_y
execute if score @s rt_progress_direction matches 1 run scoreboard players operation @s rt_progress_sign = @s rt_delta_z
execute if score @s rt_progress_direction matches 0 run scoreboard players operation @s rt_progress_sign /= @s rt_abs_x
execute if score @s rt_progress_direction matches 2 run scoreboard players operation @s rt_progress_sign /= @s rt_abs_y
execute if score @s rt_progress_direction matches 1 run scoreboard players operation @s rt_progress_sign /= @s rt_abs_z
scoreboard players operation @s rt_progress_sign *= 10000 const

kill @e[tag=rt_tracer]