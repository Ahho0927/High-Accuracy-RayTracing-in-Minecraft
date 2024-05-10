summon minecraft:marker ^ ^ ^.1 {Tags: ["rt", "rt_tracer", "init"]}
execute as @e[tag=rt_tracer, tag=init] at @s run function ray:summon/setup

tag @s remove init
kill @s