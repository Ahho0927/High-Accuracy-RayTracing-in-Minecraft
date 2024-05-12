scoreboard players operation @s rt_progress_sign = @s rt_delta_x
scoreboard players operation @s rt_progress_sign /= @s rt_abs_x

scoreboard players operation @s rt_start = @s rt_original_x
execute if score @s rt_progress_sign matches ..-1 run scoreboard players add @s rt_start 10000
scoreboard players operation @s rt_start /= 10000 const
scoreboard players operation @s rt_start *= 10000 const

scoreboard players operation @s rt_difference = @s rt_progress_sign
scoreboard players operation @s rt_difference *= 10000 const
scoreboard players operation @s rt_parameter = @s rt_start

# repeat
scoreboard players set @s rt_for_index 0
function ray:progress/for

kill @s