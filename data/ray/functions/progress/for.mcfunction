scoreboard players add @s rt_for_index 1

# TODO: Ray 궤적 튐 개선 필요

scoreboard players operation @s rt_parameter += @s rt_difference

$scoreboard players operation @s rt_result_$(result_1) -= @s rt_original_$(direction)
$scoreboard players operation @s rt_result_$(result_1) = @s rt_parameter
$scoreboard players operation @s rt_result_$(result_1) *= @s rt_delta_$(result_1)
$scoreboard players operation @s rt_result_$(result_1) /= @s rt_delta_$(direction)
$scoreboard players operation @s rt_result_$(result_1) += @s rt_original_$(result_1)

$scoreboard players operation @s rt_result_$(result_2) = @s rt_parameter
$scoreboard players operation @s rt_result_$(result_2) -= @s rt_original_$(direction)
$scoreboard players operation @s rt_result_$(result_2) *= @s rt_delta_$(result_2)
$scoreboard players operation @s rt_result_$(result_2) /= @s rt_delta_$(direction)
$scoreboard players operation @s rt_result_$(result_2) += @s rt_original_$(result_2)


data merge entity @s {data: {result: {x_integer:0, x_decimal:0, y_integer:0, y_decimal:0, z_integer:0, z_decimal:0}}}
$function ray:progress/seperate {result:"$(direction)", input:"rt_parameter"}
$function ray:progress/seperate {result:"$(result_1)", input:"rt_result_$(result_1)"}
$function ray:progress/seperate {result:"$(result_2)", input:"rt_result_$(result_2)"}
tellraw @a ["", {"score": {"name": "@s", "objective": "rt_parameter_integer"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_parameter_decimal"}}, {"score": {"name": "@s", "objective": "rt_result_y_integer"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_y_decimal"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_z_integer"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_z_decimal"}}]

function ray:progress/detect_block with entity @s data.result

execute if score @s rt_for_index matches ..20 run function ray:progress/for