/obj/effect/spawner/away/lootdrop
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	var/lootcount = 1		//how many items will be spawned
	var/lootdoubles = 0		//if the same item can be spawned twice
	var/loot = ""			//a list of possible items to spawn- a string of paths

/obj/effect/spawner/away/lootdrop/Initialize(mapload)
	..()
	var/list/things = params2list(loot)

	if(things && length(things))
		for(var/i = lootcount, i > 0, i--)
			if(!length(things))
				return

			var/loot_spawn = pick(things)
			var/loot_path = text2path(loot_spawn)

			if(!loot_path || !lootdoubles)
				things.Remove(loot_spawn)
				continue

			new loot_path(get_turf(src))

	return INITIALIZE_HINT_QDEL
