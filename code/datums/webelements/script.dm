// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/script
	New()
		..("script")
		setAttribute("type", "text/javascript")

	proc/setContent(var/content as text)
		innerHtml = content
