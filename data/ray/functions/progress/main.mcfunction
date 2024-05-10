execute as @e[tag=rt_tracer, scores={rt_progress_direction=0}] at @s run function ray:progress/x
execute as @e[tag=rt_tracer, scores={rt_progress_direction=2}] at @s run function ray:progress/y
execute as @e[tag=rt_tracer, scores={rt_progress_direction=1}] at @s run function ray:progress/z
# formula: 
# if x is progress direction,
# y = (Δy / Δx)(x - rt_shooter_x) + rt_shooter_y
# z = (Δz / Δx)(x - rt_shooter_x) + rt_shooter_z