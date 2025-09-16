// new file - don't wanna cram this in with other pmc's, feels bloaty

// riflemen
/datum/equipment_preset/uscm/pmc
	name = "Tactical Unit"
	paygrades = list("PMC-OP" = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TacUnit"
	access = list(ACCESS_WY_GENERAL)
	faction_group = FACTION_LIST_WY
	faction = FACTION_PMC
	idtype = /obj/item/card/id/pmc
	assignment = JOB_PMCPLAT_STANDARD
	rank = JOB_SQUAD_MARINE
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	skills = /datum/skills/pfc

/datum/equipment_preset/uscm/pmc/sl
	name = "Operations Leader"
	paygrades = list("PMC-OL" = JOB_PLAYTIME_TIER_0)
	role_comm_title = "OpLead"
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_SENIOR_LEAD, ACCESS_WY_ARMORY)
	assignment = JOB_PMCPLAT_LEADER
	idtype = /obj/item/card/id/pmc
	rank = JOB_SQUAD_LEADER
	skills = /datum/skills/pmc/director

/datum/equipment_preset/uscm/pmc/tl
	name = "Team Leader"
	paygrades = list("PMC-TL" = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TeamLead"
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_PMC_TL)
	assignment = JOB_PMCPLAT_FTL
	idtype = /obj/item/card/id/pmc
	rank = JOB_SQUAD_TEAM_LEADER
	skills = /datum/skills/pmc/SL

/datum/equipment_preset/uscm/pmc/sg
	name = "Heavy Weapons Specialist"
	paygrades = list("PMC-WS" = JOB_PLAYTIME_TIER_0)
	role_comm_title = "HWS"
	access = list(ACCESS_WY_GENERAL, ACCESS_PMC_GUNNER)
	assignment = JOB_PMCPLAT_SG
	idtype = /obj/item/card/id/pmc
	rank = JOB_SQUAD_SMARTGUN
	skills = /datum/skills/smartgunner

/datum/equipment_preset/uscm/pmc/med
	name = "Medical Specialist"
	paygrades = list("PMC-MS" = JOB_PLAYTIME_TIER_0)
	role_comm_title = "MS"
	access = list(ACCESS_WY_GENERAL, ACCESS_WY_MEDICAL)
	assignment = JOB_PMCPLAT_MEDIC
	idtype = /obj/item/card/id/pmc
	rank = JOB_SQUAD_MEDIC
	skills = /datum/skills/combat_medic_pve

// ******* NEW ROLES

/datum/equipment_preset/uscm_ship/mp/pmc
	name = "Internal Security (PMC MP)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/pmc
	faction_group = FACTION_LIST_WY
	faction = FACTION_PMC
	access = list(ACCESS_WY_GENERAL,
	ACCESS_WY_MEDICAL,
	ACCESS_WY_SECURITY,
	ACCESS_WY_RESEARCH,
	ACCESS_MARINE_BRIG,
	ACCESS_MARINE_ARMORY,
	ACCESS_WY_EXEC,
	ACCESS_WY_PMC,
	ACCESS_WY_PMC_TL,
	ACCESS_WY_ARMORY,
	ACCESS_WY_SECRETS,
	ACCESS_WY_DATABASE,
	ACCESS_WY_LEADERSHIP,
	ACCESS_WY_SENIOR_LEAD)
	minimum_age = 22
	assignment = JOB_PMCPLAT_MP
	rank = JOB_POLICE
	paygrades = list(PAY_SHORT_ME4 = JOB_PLAYTIME_TIER_0, PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_1, PAY_SHORT_ME6 = JOB_PLAYTIME_TIER_3)
	role_comm_title = "MP"
	skills = /datum/skills/MP
	minimap_icon = "mp"

/datum/equipment_preset/uscm_ship/mp/pmc/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc/platoon/cmd(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/pmc/mp(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/pmc/leader(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/mpsec(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/smallpouch(new_human), WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/pmc/leader(new_human), WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/full(new_human), WEAR_WAIST)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/pmc/crew
	name = "Ship Crew"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/pmc
	faction_group = FACTION_LIST_WY
	faction = FACTION_PMC
	assignment = JOB_PMCPLAT_CREW
	rank = JOB_PMC_STANDARD
	paygrades = list("PMC-OP" = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/general //BLUD NEED TO KNOW EVERYTHING

/datum/equipment_preset/pmc/crew/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/pmc/platoon(new_human), WEAR_L_EAR)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/vest/grey(new_human), WEAR_JACKET)
	//waist
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/alt(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp78(new_human), WEAR_IN_R_STORE)
