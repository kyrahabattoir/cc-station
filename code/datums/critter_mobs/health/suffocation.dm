// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/healthHolder/suffocation
	name = "suffocation"
	associated_damage_type = "oxy"
	var/losebreath = 0

	var/volume = BREATH_VOLUME

	// Indicate safe range regardless of what the critter is breathing.
	var/oxygen_min = 17
	var/oxygen_max = -1
	var/co2_min = 0
	var/co2_max = 9
	var/toxins_min = 0
	var/toxins_max = 0.4
	var/sa_para_min = 1
	var/sa_sleep_min = 5

	var/o2_damage = 0
	var/co2_damage = 0
	var/toxin_damage = 0
	var/heat_tolerance = 339.15
	count_in_total = 1
	maximum_value = 0
	value = 0
	minimum_value = -200
	depletion_threshold = -200

	var/prime_breathing = "o"

	proc/lose_breath(var/amt)
		losebreath = max(0, losebreath + amt)

	proc/gain_breath(var/amt)
		lose_breath(-amt)

	on_life()
		var/atom/loc = holder.loc
		var/datum/gas_mixture/environment = loc.return_air()
		var/datum/gas_mixture/breath = null
		if (istype(loc, /turf))
			breath = loc.remove_air(environment.total_moles() * BREATH_PERCENTAGE)
		if (holder.does_it_metabolize())
			if (holder.reagents.has_reagent("lexorin"))
				gain_breath(2)
				return
		if (istype(loc, /obj/))
			var/obj/location_as_object = loc
			location_as_object.handle_internal_lifeform(src, breath ? 0 : volume)
		var/breathing = 0
		var/breath_pressure = (breath.total_moles() * R_IDEAL_GAS_EQUATION * breath.temperature) / volume
		if (breath && breath.total_moles() > 0)
			var/o2_pp = (breath.oxygen / breath.total_moles()) * breath_pressure
			var/toxins_pp = (breath.toxins / breath.total_moles()) * breath_pressure
			var/co2_pp = (breath.carbon_dioxide / breath.total_moles()) * breath_pressure
			if (((oxygen_min > 0 && oxygen_min <= o2_pp) || oxygen_min <= 0) && ((oxygen_max > 0 && oxygen_max >= o2_pp) || oxygen_max <= 0))
				if (prime_breathing == "o")
					breathing = 1
					var/ratio = round(oxygen_min / (o2_pp + 0.1))
					var/usage = breath.oxygen*ratio/6
					breath.oxygen -= usage
					breath.carbon_dioxide += usage
				o2_damage = 0
			else
				TakeDamage(3 + o2_damage)
				o2_damage++
				if (prob(20))
					spawn(0) holder.emote("cough")

			if (((co2_min > 0 && co2_min <= co2_pp) || co2_min <= 0) && ((co2_max > 0 && co2_max >= co2_pp) || co2_max <= 0))
				if (prime_breathing == "c")
					breathing = 1
					var/ratio = round(co2_min / (co2_pp + 0.1))
					var/usage = breath.carbon_dioxide * ratio / 6
					breath.oxygen += usage
					breath.carbon_dioxide -= usage
				co2_damage = 0
			else
				TakeDamage(3 + co2_damage)
				co2_damage++
				if (prob(20))
					spawn(0) holder.emote("cough")

			if (((toxins_min > 0 && toxins_min <= toxins_pp) || toxins_min <= 0) && ((toxins_max > 0 && toxins_max >= toxins_pp) || toxins_max <= 0))
				if (prime_breathing == "t")
					breathing = 1
					var/ratio = round(toxins_min / (toxins_pp + 0.1))
					var/usage = breath.toxins * ratio / 6
					breath.toxins -= usage
					// well it has to make some SOMETHING.
					breath.carbon_dioxide += usage
				toxin_damage = 0
			else
				if (toxins_max > 0 && toxins_pp > toxins_max)
					holder.take_toxin_damage(toxins_pp / toxins_max)
				else
					TakeDamage(3 + toxin_damage)

			if (breath.trace_gases && breath.trace_gases.len)	// If there's some other shit in the air lets deal with it here.
				for (var/datum/gas/sleeping_agent/SA in breath.trace_gases)
					var/SA_pp = (SA.moles/breath.total_moles())*breath_pressure
					if (SA_pp > sa_para_min) // Enough to make us paralysed for a bit
						holder.paralysis = max(holder.paralysis, 3) // 3 gives them one second to wake up and run away a bit!
						if (SA_pp > sa_sleep_min) // Enough to make us sleep as well
							holder.sleeping = max(holder.sleeping, 2)
					else if (SA_pp > 0.01)	// There is sleeping gas in their lungs, but only a little, so give them a bit of a warning
						if (prob(20))
							spawn(0) holder.emote(pick("giggle", "laugh"))
				for (var/datum/gas/rad_particles/RV in breath.trace_gases)
					holder.irradiate(RV.moles/10,1)

			if (breath.temperature > heat_tolerance && !holder.is_heat_resistant())
				if (prob(20))
					boutput(holder, "<span style=\"color:red\">You feel a searing heat in the air!</span>")
				holder.TakeDamage("chest", 0, min((breath.temperature - heat_tolerance) / 3, 10) + 6)
				// this part is shit and probably should be purged, but generalizing hud might be unwanted
				var/mob/living/critter/C = holder
				if (istype(C))
					C.hud.set_breathing_fire(1)
				if (prob(4))
					boutput(holder, "<span style=\"color:red\">Your lungs hurt like hell! This can't be good!</span>")
			else
				var/mob/living/critter/C = holder
				if (istype(C))
					C.hud.set_breathing_fire(0)

		if (!breathing)
			TakeDamage(8)
			// this part is shit and probably should be purged, but generalizing hud might be unwanted
			var/mob/living/critter/C = holder
			if (istype(C))
				C.hud.set_suffocating(1)
			lose_breath(1)
		else
			gain_breath(1)
			if (!losebreath)
				var/mob/living/critter/C = holder
				if (istype(C))
					C.hud.set_suffocating(0)
		if (losebreath && prob(75))
			spawn(0) holder.emote("gasp")

		if (breath)
			loc.assume_air(breath)

	prevents_speech()
		return losebreath