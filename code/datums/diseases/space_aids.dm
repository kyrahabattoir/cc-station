// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/ailment/disease/space_aids
	name = "Space AIDS"
	max_stages = 3
	spread = "Non-Contagious"
	cure = "Incurable"
	associated_reagent = "HIV"
	affected_species = list("Human")


/datum/ailment/disease/space_aids/stage_act(var/mob/living/affected_mob,var/datum/ailment_data/D)
	if (..())
		return
	switch(D.stage)
		if(1)
			if(prob(5)) affected_mob.emote(pick("cough", "sneeze"))
			if (prob(8))
				var/procmessage = pick("You feel utterly horrible.","You feel deathly ill.","You feel like your body is shutting down...")
				boutput(affected_mob, "<span style=\"color:red\">[procmessage]</span>")
		if(2)
			if(prob(10))
				for(var/datum/ailment/A in affected_mob.ailments)
					affected_mob.take_toxin_damage(1)
				affected_mob.updatehealth()
			if(prob(8))
				affected_mob.emote("sneeze")
			if (prob(8))
				var/procmessage = pick("You feel like you're dying...","Your innards ache horribly.")
				boutput(affected_mob, "<span style=\"color:red\">[procmessage]</span>")
		if(3)
			if(prob(10))
				for(var/datum/ailment/A in affected_mob.ailments)
					affected_mob.take_toxin_damage(1)
				affected_mob.updatehealth()
			if(prob(5))
				affected_mob.emote(pick("cough", "sneeze"))
			if (prob(8))
				var/procmessage = pick("It feels like you could drop dead any second...","Pain and nausea wrack your entire body.")
				boutput(affected_mob, "<span style=\"color:red\">[procmessage]</span>")
			if(prob(5))
				for(var/datum/ailment/disease/V in disease_controls.standard_diseases)
					if (prob(10))
						affected_mob.contract_disease(V.type,null,null,1)
		else
			return