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
scoreboard players operation @s rt_parameter += @s rt_difference

scoreboard players operation @s rt_result_y = @s rt_parameter
scoreboard players operation @s rt_result_y -= @s rt_original_x
scoreboard players operation @s rt_result_y *= @s rt_delta_y
scoreboard players operation @s rt_result_y /= @s rt_delta_x
scoreboard players operation @s rt_result_y += @s rt_original_y

scoreboard players operation @s rt_result_z = @s rt_parameter
scoreboard players operation @s rt_result_z -= @s rt_original_x
scoreboard players operation @s rt_result_z *= @s rt_delta_z
scoreboard players operation @s rt_result_z /= @s rt_delta_x
scoreboard players operation @s rt_result_z += @s rt_original_z

# TODO 수를 정수부분과 소수부분으로 나누는 과정에서 나누기를 사용하는데, 마인크래프트의 나누기 연산은 반올림이 아닌 버림을 해버리므로, 이를 보와하기 위한 별도의 알고리즘이 필요하다. 아래는 그 시도의 흔적이다. 
scoreboard players operation @s rt_parameter_integer = @s rt_parameter
scoreboard players operation @s rt_parameter_integer /= 10000 const
execute if score @s rt_parameter matches ..-1 run scoreboard players add @s rt_parameter_integer 1
scoreboard players operation @s rt_parameter_decimal = @s rt_parameter
scoreboard players operation @s rt_parameter_decimal %= 10000 const
scoreboard players operation @s rt_result_y_integer = @s rt_result_y
scoreboard players operation @s rt_result_y_integer /= 10000 const
execute if score @s rt_result_y matches ..-1 run scoreboard players add @s rt_result_y_integer 1
scoreboard players operation @s rt_result_y_decimal = @s rt_result_y
scoreboard players operation @s rt_result_y_decimal %= 10000 const
scoreboard players operation @s rt_result_z_integer = @s rt_result_z
scoreboard players operation @s rt_result_z_integer /= 10000 const
execute if score @s rt_result_z_integer matches ..-1 run scoreboard players add @s rt_result_z_integer 1
scoreboard players operation @s rt_result_z_decimal = @s rt_result_z
scoreboard players operation @s rt_result_z_decimal %= 10000 const
execute if score @s rt_result_z_integer matches ..-1 run scoreboard players remove @s rt_result_z_decimal 10000
execute if score @s rt_result_z_decimal matches ..-1 run scoreboard players operation @s rt_result_z_decimal *= -1 const
tellraw @a ["", {"score": {"name":"@s", "objective":"rt_original_x"}}, {"text": " "}, {"score": {"name":"@s", "objective":"rt_original_y"}}, {"text": " "}, {"score": {"name":"@s", "objective":"rt_original_z"}}]
# tellraw @a ["", {"score": {"name": "@s", "objective": "rt_result_y_integer"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_y_decimal"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_z_integer"}}, {"text": " "}, {"score": {"name": "@s", "objective": "rt_result_z_decimal"}}]

data merge entity @s {data: {result: {x_integer:0, x_decimal:0, y_integer:0, y_decimal:0, z_integer:0, z_decimal:0}}}
execute store result entity @s data.result.x_integer int 1 run scoreboard players get @s rt_parameter_integer
execute store result entity @s data.result.x_decimal int 1 run scoreboard players get @s rt_parameter_decimal
execute store result entity @s data.result.y_integer int 1 run scoreboard players get @s rt_result_y_integer
execute store result entity @s data.result.y_decimal int 1 run scoreboard players get @s rt_result_y_decimal
execute store result entity @s data.result.z_integer int 1 run scoreboard players get @s rt_result_z_integer
execute store result entity @s data.result.z_decimal int 1 run scoreboard players get @s rt_result_z_decimal
function ray:progress/detect_block with entity @s data.result