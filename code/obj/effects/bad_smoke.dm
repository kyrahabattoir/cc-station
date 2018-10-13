// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/////////////////////////////////////////////
// Bad smoke
/////////////////////////////////////////////

/obj/effects/bad_smoke
	name = "smoke"
	icon_state = "smoke"
	opacity = 1
	anchored = 0.0
	mouse_opacity = 0
	var/amount = 6.0
	//Remove this bit to use the old smoke
	icon = 'icons/effects/96x96.dmi'
	pixel_x = -32
	pixel_y = -32

/obj/effects/bad_smoke/Move()
	..()
	for(var/mob/living/carbon/M in get_turf(src))
		if (M.internal != null && M.wear_mask && (M.wear_mask.c_flags & MASKINTERNALS))
		else
			M.drop_item()
			if (prob(25))
				M.stunned += 1
			M.take_oxygen_deprivation(1)
			M.emote("cough")
	return

/obj/effects/bad_smoke/HasEntered(mob/living/carbon/M as mob )
	..()
	if(iscarbon(M))
		if (M.internal != null && M.wear_mask && (M.wear_mask.c_flags & MASKINTERNALS))
			return
		else
			M.drop_item()
			if (prob(25))
				M.stunned += 1
			M.take_oxygen_deprivation(1)
			M.emote("cough")
	return