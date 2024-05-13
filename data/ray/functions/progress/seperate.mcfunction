# TODO: 수를 정수부분과 소수부분으로 나누는 과정에서 나누기를 사용하는데, 마인크래프트의 나누기 연산은 반올림이 아닌 버림을 해버리므로, 음의 좌표에서 ray의 계산 조정이 필요.

$scoreboard players operation @s rt_result_$(result)_integer = @s $(input)
$scoreboard players operation @s rt_result_$(result)_integer /= 10000 const
$scoreboard players operation @s rt_result_$(result)_decimal = @s $(input)
$scoreboard players operation @s rt_result_$(result)_decimal %= 10000 const

$execute store result entity @s data.result.$(result)_integer int 1 run scoreboard players get @s rt_result_$(result)_integer
$execute store result entity @s data.result.$(result)_decimal int 1 run scoreboard players get @s rt_result_$(result)_decimal

$execute if score @s $(input) matches ..-1 run function ray:progress/seperate_adjust {result:"$(result)", input:"$(input)"}