$scoreboard players add @s rt_result_$(result)_integer 1
$execute if score @s rt_result_$(result)_integer matches 0 run data modify entity @s data.result.x_integer set value "-0"
$scoreboard players operation @s rt_result_$(result)_decimal *= -1 const
$scoreboard players add @s rt_result_$(result)_decimal 10000