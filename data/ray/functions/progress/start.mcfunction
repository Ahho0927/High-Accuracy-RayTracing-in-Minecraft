$scoreboard players operation @s rt_progress_sign = @s rt_delta_$(direction)
$scoreboard players operation @s rt_progress_sign /= @s rt_abs_$(direction)

$scoreboard players operation @s rt_parameter = @s rt_original_$(direction)
execute if score @s rt_progress_sign matches ..-1 run scoreboard players add @s rt_parameter 10000
scoreboard players operation @s rt_parameter /= 10000 const
scoreboard players operation @s rt_parameter *= 10000 const

scoreboard players operation @s rt_difference = @s rt_progress_sign
scoreboard players operation @s rt_difference *= 10000 const

# repeat 20 times
scoreboard players set @s rt_for_index 0
$function ray:progress/for {direction:"$(direction)", result_1:"$(another)", result_2:"$(the_other)"}

kill @s