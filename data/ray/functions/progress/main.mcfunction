tellraw @a {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}
execute as @e[tag=rt_main, scores={rt_progress_direction=0}] at @s run function ray:progress/start {direction:"x", another:"y", the_other:"z"}
execute as @e[tag=rt_main, scores={rt_progress_direction=1}] at @s run function ray:progress/start {direction:"y", another:"x", the_other:"z"}
execute as @e[tag=rt_main, scores={rt_progress_direction=2}] at @s run function ray:progress/start {direction:"z", another:"x", the_other:"y"}