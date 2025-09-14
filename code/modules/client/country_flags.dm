/proc/ip2country(ipaddr, client/origin)
	if(!origin || origin?.country)
		return //null source, or already has a flag

	var/list/http_response[] = world.Export("http://ip-api.com/json/[ipaddr]")
	if(http_response) //check for a response
		var/page_content = http_response["CONTENT"]
		if(page_content)
			var/list/geodata = json_decode(html_decode(file2text(page_content)))
			if(geodata["countryCode"] == "GB" && ((geodata["regionName"] == "Scotland") || (geodata["regionName"] == "Wales")))
				origin?.country = geodata["regionName"]
			else if(geodata["countryCode"] == "CA" && (geodata["regionName"] == "Quebec"))
				origin?.country = geodata["regionName"]
			else if(geodata["countryCode"] == "BR")
				origin?.country = geodata["region"] // Use Brazilian state code instead of country code
			else
				origin?.country = geodata["countryCode"]
			return geodata["countryCode"]
	else //null response, ratelimited most likely. Try again in 60s
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(ip2country), ipaddr, origin), 60 SECONDS)

GLOBAL_LIST_INIT(countries, icon_states('icons/flags.dmi'))
GLOBAL_LIST_INIT(brazilian_states, icon_states('icons/state_flags_br.dmi'))

/proc/country2chaticon(country_code, targets)
	if(GLOB.brazilian_states.Find(country_code))
		return "[icon2html('icons/state_flags_br.dmi', targets, country_code)]"
	else if(GLOB.countries.Find(country_code))
		return "[icon2html('icons/flags.dmi', targets, country_code)]"
	else
		return "[icon2html('icons/flags.dmi', targets, "unknown")]"
