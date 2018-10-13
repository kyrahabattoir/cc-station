// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/css
	New()
		..("style")
		setAttribute("type", "text/css")

	proc/setContent(var/content as text)
		innerHtml = content
