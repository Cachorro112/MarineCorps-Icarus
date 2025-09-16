/datum/job/logistics/cargo
	title = JOB_CARGO_TECH
	total_positions = 2
	spawn_positions = 2
	allow_additional = 1
	scaled = 1
	supervisors = "the requisitions officer"
	selection_class = "job_ct"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/cargo
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job</a> is to dispense supplies to the marines, including weapon attachments. Stay in your department when possible to ensure the marines have full access to the supplies they may require. Listen to the radio in case someone requests a supply drop via the overwatch system."

/datum/job/logistics/cargo/set_spawn_positions(count)
	spawn_positions = ct_slot_formula(count)

/datum/job/logistics/cargo/get_total_positions(latejoin = 0)
	var/positions = spawn_positions
	if(latejoin)
		positions = ct_slot_formula(get_total_marines())
		if(positions <= total_positions_so_far)
			positions = total_positions_so_far
		else
			total_positions_so_far = positions
	else
		total_positions_so_far = positions
	return positions

/datum/job/logistics/cargo/pmc
	title = JOB_PMCPLAT_CREW
	total_positions = 10
	spawn_positions = 2
	allow_additional = 0
	scaled = 0
	supervisors = "weyland-yutani and the overwatch"
	selection_class = "job_ct"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/pmc/crew
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job</a> is to work on the ship and support the Marines, whether as a doctor, engineer, or logistics officer. You answer primarily to Weyland-Yutani and the Ship Captain, but you are usually required to follow orders from the PMC Officers."

/obj/effect/landmark/start/cargo
	name = JOB_CARGO_TECH
	icon_state = "ct_spawn"
	job = /datum/job/logistics/cargo

/datum/job/logistics/chief
	title = JOB_CARGO_CHIEF
	gear_preset = /datum/equipment_preset/uscm_ship/qm/lesser_rank

/datum/job/logistics/armorer
	title = JOB_ARMORER
	gear_preset = /datum/equipment_preset/uscm_ship/armorer

/obj/effect/landmark/start/cargo/pmc
	name = JOB_PMCPLAT_CREW
	icon_state = "ct_spawn"
	job = /datum/job/logistics/cargo/pmc
