execute anchored eyes run summon minecraft:marker ^ ^ ^ {Tags: ["rt", "rt_shooter", "init"]}
execute anchored eyes positioned ^ ^ ^ store result entity @e[tag=rt_shooter, tag=init, limit=1, sort=nearest, distance=...01] Rotation[0] float .001 run data get entity @s Rotation[0] 1000
execute anchored eyes positioned ^ ^ ^ store result entity @e[tag=rt_shooter, tag=init, limit=1, sort=nearest, distance=...01] Rotation[1] float .001 run data get entity @s Rotation[1] 1000
execute as @e[tag=rt_shooter, tag=init] at @s run function ray:summon/start