// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/textarea
	New(var/type as text)
		..("textarea")

	proc/setName(var/name as text)
		setAttribute("name", name)
		
	proc/setValue(var/txt as text)
		innerHtml = txt