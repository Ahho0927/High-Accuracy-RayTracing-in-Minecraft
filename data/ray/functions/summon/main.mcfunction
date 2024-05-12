execute anchored eyes run summon minecraft:marker ^ ^ ^1 {Tags: ["rt", "rt_direction", "init"]}

execute store result score @s rt_rotation run data get entity @s Rotation[1] 1000
execute anchored eyes positioned ^ ^ ^ summon minecraft:marker run function ray:summon/calc
execute unless score @s rt_rotation matches -45000..45000 anchored eyes positioned ^ ^ ^ run scoreboard players set @e[tag=rt_main, tag=init, limit=1, sort=nearest] rt_progress_direction 1