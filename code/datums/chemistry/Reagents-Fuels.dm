// SPDX-License-Identifier: CC-BY-NC-SA-3.0

datum/reagent/combustible/fuel // COGWERKS CHEM REVISION PROJECT. treat like acetylene or similar basic hydrocarbons for other reactions
	name = "welding fuel"
	id = "fuel"
	description = "A highly flammable blend of basic hydrocarbons, mostly Acetylene. Useful for both welding and organic chemistry, and can be fortified into a heavier oil."
	reagent_state = REAGENT_LIQUID
	volatility = 1
	fluid_r = 0
	fluid_g = 0
	fluid_b = 0
	transparency = 230

	var/max_radius = 7
	var/min_radius = 0
	var/volume_radius_modifier = -0.15
	var/volume_radius_multiplier = 0.09
	var/explosion_threshold = 100
	var/min_explosion_radius = 0
	var/max_explosion_radius = 4
	var/volume_explosion_radius_multiplier = 0.005
	var/volume_explosion_radius_modifier = 0
	var/combustion_temp = T0C + 200

datum/reagent/combustible/fuel/reaction_temperature(exposed_temperature, exposed_volume)
	if(exposed_temperature > combustion_temp)
		if(volume < 1)
			if (holder)
				holder.del_reagent(id)
			return
		var/turf = get_turf(holder.my_atom)
		var/radius = min(max(min_radius, volume * volume_radius_multiplier + volume_radius_modifier), max_radius)
		fireflash_sm(turf, radius, 2200 + radius * 250, radius * 50)
		if(holder && volume >= explosion_threshold)
			if(holder.my_atom)
				holder.my_atom.visible_message("<span style=\"color:red\"><b>[holder.my_atom] explodes!</b></span>")
				// Added log entries (Convair880).
				message_admins("Fuel tank explosion ([holder.my_atom], reagent type: [id]) at [log_loc(holder.my_atom)]. Last touched by: [holder.my_atom.fingerprintslast ? "[holder.my_atom.fingerprintslast]" : "*null*"].")
				logTheThing("bombing", holder.my_atom.fingerprintslast, null, "Fuel tank explosion ([holder.my_atom], reagent type: [id]) at [log_loc(holder.my_atom)]. Last touched by: [holder.my_atom.fingerprintslast ? "[holder.my_atom.fingerprintslast]" : "*null*"].")
			var/boomrange = min(max(min_explosion_radius, round(volume * volume_explosion_radius_multiplier + volume_explosion_radius_modifier)), max_explosion_radius)
			explosion(holder.my_atom, turf, -1,-1,boomrange,1)
		if (holder)
			holder.del_reagent(id)
	return

datum/reagent/combustible/fuel/reaction_obj(var/obj/O, var/volume)
	src = null
	return

datum/reagent/combustible/fuel/reaction_turf(var/turf/T, var/volume)
	src = null
	if(!T.reagents)
		T.create_reagents(50)
	T.reagents.add_reagent("fuel", volume, null)
	return

datum/reagent/combustible/fuel/reaction_mob(var/mob/M, var/method=REAC_TOUCH, var/volume)
	src = null
	if(method != REAC_TOUCH)
		return
	var/mob/living/L = M
	if(istype(L) && L.burning)
		L.update_burning(30)
	return

datum/reagent/combustible/fuel/on_mob_life(var/mob/M)
	var/mob/living/L = M
	if(istype(L) && L.burning)
		L.update_burning(2)
	..(M)
	return

datum/reagent/combustible/fuel/on_plant_life(var/obj/machinery/plantpot/P)
	P.HYPdamageplant("poison", 1)
	return


datum/reagent/combustible/fuel/epichlorohydrin
	name = "epichlorohydrin"
	id = "epichlorohydrin"
	description = "A highly reactive, flammable, mildly toxic compound."
	reagent_state = REAGENT_LIQUID
	fluid_r = 220
	fluid_g = 220
	fluid_b = 255
	transparency = 128
	max_radius = 4
	min_radius = 0
	combustion_temp = T0C + 385
	volume_radius_multiplier = 0.05
	explosion_threshold = 1000
	volume_explosion_radius_modifier = -4.5
