// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/admins/proc/player_notes(var/player)
	if(!player)
		return
	if (src.level < 0)
		alert("UM, EXCUSE ME??  YOU AREN'T AN ADMIN, GET DOWN FROM THERE!")
		usr << sound('sound/misc/poo2.ogg')
		return
	var/dat = ""
	dat += ""
	var/query = ""
	query += config.player_notes_baseurl
	query += "playernotes.php?action=getnotes&ckey=[player]"
	var/http[] = world.Export(url_encode(query,1))

	if(!http)
		dat += "Query Failed."
		usr << browse(dat, "window=notesp;size=875x400")
		return

	var/key
	var/contentExists = 0
	for (key in http)
		if (key == "CONTENT")
			contentExists = 1

	if (0 == contentExists)
		dat += "Query Failed."
		usr << browse(dat, "window=notesp;size=875x400")
		return

	var/content = ""
	content += file2text(http["CONTENT"])
	var/deletelinkpre = "<A href='?src=\ref[src];action=notes2;target=[player];type=del;id="
	var/deletelinkpost = "'>(DEL)"

	var/regex/R = new("!!ID(\\d+)", "g")
	content = R.Replace(content, "[deletelinkpre]$1[deletelinkpost]")

	dat += content
	dat = "<h1>Player Notes for <b>[player]</b></h1><HR></FONT><br><A href='?src=\ref[src];action=notes2;target=[player];type=add'>Add Note</A><br><HR>[dat]"
	usr << browse(dat, "window=notesp;size=875x400")
	return


/proc/add_player_note(player, admin, notetext)
	//var/akey = url_encode(text("[admin]"))
	//var/ckey = url_encode(text("[player]"))
	var/akey = text("[admin]")
	var/ckey = text("[player]")
	var/server = ""
	if (config && config.server_name != null)
		server = config.server_name
	else
		server = "server"

	notetext = replacetext(notetext, "'", " ")
	notetext = replacetext(notetext, "\"", " ")

	var/note = notetext
	var/query = text("")
	query += config.player_notes_baseurl
	query += "playernotes.php?action=addnote&ckey=[ckey]&serverid=[server]&akey=[akey]&note=[note]"
	query = url_encode(query, 1)
	boutput(usr, query)
	spawn(0) world.Export(query)