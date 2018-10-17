// SPDX-License-Identifier: CC-BY-NC-SA-3.0

//Contains disease reagents.
datum/reagent/disease
	name = "disease reagent"
	id = "ohfuck!"
	description = "if you're seeing this ingame something has fucked up!"
	reagent_state = REAGENT_LIQUID
	var/disease = null
	var/minimum_to_infect = 4.5

/* this wont work properly and has been driving me fucking insane so disabling it for now
datum/reagent/disease/reaction_mob(var/mob/M, var/method=REAC_TOUCH, var/volume)
	src = null
	if(!M)
		M = holder.my_atom
	var/mob/living/L = M
	if (method == READ_INGEST || prob(25))
		L.contract_disease(disease, null, null, 1) // path, name, strain, bypass resist
*/


datum/reagent/disease/on_mob_life(var/mob/M)
	..(M)
	if(!M)
		M = holder.my_atom
	if (!istype(M,/mob/living/) || !ispath(disease))
		return
	if (src.volume < minimum_to_infect)
		return
	var/mob/living/L = M
	L.contract_disease(disease, null, null, 1)
	return


datum/reagent/disease/rainbow_fluid // Clowning Around
	name = "rainbow fluid"
	id = "rainbow fluid"
	description = "It is every colour of the rainbow."
	fluid_r = 255
	fluid_g = 255
	fluid_b = 255
	transparency = 0
	disease = /datum/ailment/disease/clowning_around


datum/reagent/disease/vampire_serum
	name = "vampire serum"
	id = "vampire_serum"
	description = "A sinister blood-like fluid. It smells evil, somehow."
	fluid_r = 150
	fluid_g = 0
	fluid_b = 0
	transparency = 255
	disease = /datum/ailment/disease/vampiritis


datum/reagent/disease/painbow_fluid // CLUWNE VIRUS
	name = "painbow fluid"
	id = "painbow fluid"
	description = "It is every colour of the pain spectrum. It even hurts to look at it."
	fluid_r = 255
	fluid_g = 255
	fluid_b = 255
	transparency = 0
	disease = /datum/ailment/disease/cluwneing_around


datum/reagent/disease/lycanthropy //Please never give this an actual recipe .I
	name = "werewolf serum"
	id = "werewolf_serum"
	description = "A mutagenic substance associated with a mythical beast."
	minimum_to_infect = 0
	fluid_r = 173
	fluid_g = 65
	fluid_b = 133
	transparency = 0
	disease = /datum/ailment/disease/lycanthropy


datum/reagent/disease/mucus // Cold
	name = "mucus"
	id = "mucus"
	description = "The stuff that comes from your throat."
	minimum_to_infect = 0
	fluid_r = 245
	fluid_g = 255
	fluid_b = 245
	transparency = 235
	disease = /datum/ailment/disease/cold


datum/reagent/disease/stringy_gibbis // Fake GBS
	name = "stringy gibbis"
	id = "stringy gibbis"
	description = "Liquid gibbis that is very stringy."
	fluid_r = 255
	fluid_g = 0
	fluid_b = 0
	transparency = 60
	disease = /datum/ailment/disease/fake_gbs


datum/reagent/disease/green_mucus // Flu
	name = "green Mucus"
	id = "green mucus"
	description = "Mucus. Thats green."
	minimum_to_infect = 0
	fluid_r = 215
	fluid_g = 255
	fluid_b = 215
	transparency = 235
	disease = /datum/ailment/disease/flu


datum/reagent/disease/gibbis // GBS
	name = "gibbis"
	id = "gibbis"
	description = "Liquid gibbis."
	minimum_to_infect = 2.5
	fluid_r = 255
	fluid_g = 0
	fluid_b = 0
	transparency = 150
	disease = /datum/ailment/disease/gbs


datum/reagent/disease/banana_peel // Jungle Fever
	name = "banana peel"
	id = "banana peel"
	description = "Banana peel crushed up to a liquid."
	fluid_r = 255
	fluid_g = 255
	fluid_b = 0
	transparency = 150
	disease = /datum/ailment/disease/jungle_fever


datum/reagent/disease/liquid_plasma // Plasmatoid
	name = "liquid plasma"
	id = "liquid plasma"
	description = "Liquid plasma."
	fluid_r = 200
	fluid_g = 0
	fluid_b = 200
	transparency = 80
	disease = /datum/ailment/disease/plasmatoid
	//on_mob_life(var/mob/M)


datum/reagent/disease/nanites // Robot Transformation
	name = "nanomachines"
	id = "nanites"
	description = "Microscopic construction robots."
	minimum_to_infect = 1.5
	fluid_r = 101
	fluid_g = 101
	fluid_b = 101
	transparency = 110
	disease = /datum/ailment/disease/robotic_transformation
	//on_mob_life(var/mob/M)


datum/reagent/disease/liquid_spacetime // Teleportitis
	name = "liquid spacetime"
	id = "liquid spacetime"
	description = "A drop of liquid spacetime."
	fluid_r = 0
	fluid_g = 0
	fluid_b = 0
	transparency = 60
	disease = /datum/ailment/disease/teleportitis


datum/reagent/disease/pubbie_tears // Berserker
	name = "pubbie tears"
	id = "pubbie tears"
	description = "The most bitter of all liquids."
	fluid_r = 0
	fluid_g = 0
	fluid_b = 255
	transparency = 30
	disease = /datum/ailment/disease/berserker


datum/reagent/disease/salts1 //cogwerks drugs
	name = "jagged crystals"
	id = "salts1"
	description = "Rapid chemical decomposition has warped these crystals into twisted spikes."
	reagent_state = REAGENT_SOLID
	minimum_to_infect = 0
	fluid_r = 250
	fluid_g = 0
	fluid_b = 0
	transparency = 30
	disease = /datum/ailment/disease/berserker


datum/reagent/disease/salmonella // Food Poisoning
	name = "salmonella bacteria"
	id = "salmonella"
	description = "A nasty bacteria found in spoiled food."
	minimum_to_infect = 0
	fluid_r = 30
	fluid_g = 70
	fluid_b = 0
	transparency = 255
	disease = /datum/ailment/disease/food_poisoning


datum/reagent/disease/ecoli // Food Poisoning 2
	name = "e.coli bacteria"
	id = "e.coli"
	description = "A nasty bacteria found in contaminated food and biological waste products."
	minimum_to_infect = 0
	fluid_r = 30
	fluid_g = 70
	fluid_b = 0
	transparency = 255
	disease = /datum/ailment/disease/food_poisoning


datum/reagent/disease/MRSA // for infected wounds
	name = "MRSA"
	id = "MRSA"
	description = "A virulent bacteria that often strikes dirty hospitals."
	fluid_r = 30
	fluid_g = 70
	fluid_b = 0
	transparency = 255
	disease = /datum/ailment/disease/infection


datum/reagent/disease/necrovirus // Necrotic Degeneration
	name = "necrovirus"
	id = "necrovirus"
	description = "An extremely dangerous virus."
	fluid_r = 200
	fluid_g = 220
	fluid_b = 200
	transparency = 170
	disease = /datum/ailment/disease/necrotic_degeneration


datum/reagent/disease/viral_curative // Panacaea
	name = "viral curative"
	id = "viral curative"
	description = "A virus that feeds on other virii and bacteria."
	minimum_to_infect = 0
	fluid_r = 255
	fluid_g = 255
	fluid_b = 255
	transparency = 10
	disease = /datum/ailment/disease/panacaea

datum/reagent/disease/rotting // Tissue Necrosis
	name = "rotting"
	id = "rotting"
	description = "A virus that causes tissue to rot."
	fluid_r = 192
	fluid_g = 0
	fluid_b = 0
	transparency = 10
	penetrates_skin = 1
	disease = /datum/ailment/disease/tissue_necrosis


datum/reagent/disease/HIV // Space AIDS
	name = "HIV"
	id = "HIV"
	description = "Human Immunodeficiency Virus. Extremely deadly."
	fluid_r = 255
	fluid_g = 40
	fluid_b = 40
	transparency = 50
	disease = /datum/ailment/disease/space_aids


datum/reagent/disease/loose_screws // Space Madness
	name = "loose screws"
	id = "loose screws"
	description = "Liquefied screws that were screwy."
	fluid_r = 70
	fluid_g = 70
	fluid_b = 70
	transparency = 70
	disease = /datum/ailment/disease/space_madness


datum/reagent/disease/grave_dust // Vampire Plague
	name = "grave dust"
	id = "grave dust"
	description = "Moldy old dust taken from a grave site."
	fluid_r = 70
	fluid_g = 80
	fluid_b = 70
	transparency = 255
	disease = /datum/ailment/disease/vamplague


datum/reagent/disease/prions // Kuru.
	name = "prions"
	id = "prions"
	description = "A disease-causing agent that is neither bacterial nor fungal nor viral and contains no genetic material."
	fluid_r = 255
	fluid_g = 255
	fluid_b = 255
	transparency = 0
	disease = /datum/ailment/disease/kuru


datum/reagent/disease/spidereggs // oh god
	name = "spider eggs"
	id = "spidereggs"
	description = "A fine dust containing ice spider eggs. Oh god."
	reagent_state = REAGENT_SOLID
	minimum_to_infect = 2.5
	fluid_r = 255
	fluid_g = 255
	fluid_b = 255
	transparency = 0
	disease = /datum/ailment/parasite/spidereggs


datum/reagent/disease/bee
	name = "bee"
	id = "bee"
	description = "The yolk from a space bee egg."
	fluid_r = 255
	fluid_g = 255
	fluid_b = 100
	transparency = 0
	minimum_to_infect = 0.4
	disease = /datum/ailment/parasite/bee_larva


datum/reagent/disease/concentrated_initro // please do not give a recipe, just a thing for testing heart-related things atm
	name = "concentrated initropidril"
	id = "concentrated_initro"
	description = "A guaranteed heart-stopper!"
	fluid_r = 192
	fluid_g = 32
	fluid_b = 232
	transparency = 0
	disease = /datum/ailment/disease/flatline


datum/reagent/disease/bacon_grease // please do not give a recipe, just a thing for testing heart-related things atm
	name = "pure bacon grease"
	id = "bacon_grease"
	description = "Hook me up to an IV of that sweet, sweet stuff!"
	fluid_r = 247
	fluid_g = 230
	fluid_b = 177
	transparency = 0
	disease = /datum/ailment/disease/heartfailure


datum/reagent/disease/heartworms // please do not give a recipe, just a thing for testing heart-related things atm
	name = "space heartworms"
	id = "heartworms"
	description = "Aww, gross! These things can't be good for your heart. They're gunna eat it!"
	reagent_state = REAGENT_SOLID
	fluid_r = 146
	fluid_g = 93
	fluid_b = 108
	transparency = 0
	disease = /datum/ailment/disease/noheart

datum/reagent/disease/heartworms/on_mob_life(var/mob/M)
	if (!M)
		M = holder.my_atom
	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		if (H.organHolder && H.organHolder.heart)
			qdel(H.organHolder.heart)
	..(M)
	return


// Marquesas' one stop pathology shop
datum/reagent/blood/pathogen
	name = "pathogen"
	id = "pathogen"
	description = "A liquid sample of one (or multiple) pathogens."
	fluid_r = 200
	fluid_b = 0
	fluid_g = 0
	transparency = 255

datum/reagent/blood/pathogen/reaction_turf(var/turf/T, var/volume)
	return

datum/reagent/blood/pathogen/reaction_mob(var/mob/M, var/method=REAC_TOUCH, var/volume_passed)
	return // for now

datum/reagent/blood/pathogen/on_plant_life(var/obj/machinery/plantpot/P)
	return


datum/reagent/antiviral
	name = "Viral Serum"
	id = "antiviral"
	description = "An agent which can be used to create a specialized cure for a viral pathogen."
	reagent_state = 2


// To make matters easier, fungi and parasites are both cured by the same biocides
datum/reagent/biocide
	name = "Biocide"
	id = "biocide"
	description = "An agent which can be used to create a specialized cure for a fungal or parasitic pathogen."
	reagent_state = 2


// A mutation inhibitor that should destroy great mutatis cells.
// A derivative of mutadone.
datum/reagent/inhibitor
	name = "Mutation Inhibitor"
	id = "inhibitor"
	description = "An agent which can be used to create a specialized cure for a cellular mutative pathogen"
	reagent_state = 2


datum/reagent/bacterialmedium
	name = "Bacterial Medium"
	id = "bacterialmedium"
	description = "A solution useful for the cultivation of bacteria."
	reagent_state = 2
	pathogen_nutrition = list("water", "sugar", "sodium", "iron", "nitrogen")


datum/reagent/parasiticmedium
	name = "Parasitic Medium"
	id = "parasiticmedium"
	description = "A solution useful for the cultivation of parasites."
	reagent_state = 2
	pathogen_nutrition = list("water", "sugar", "sodium", "iron", "nitrogen")


datum/reagent/fungalmedium
	name = "Fungal Medium"
	id = "fungalmedium"
	description = "A solution encouraging the growth of fungi."
	reagent_state = 2
	pathogen_nutrition = list("water", "sugar", "sodium", "iron", "nitrogen")
