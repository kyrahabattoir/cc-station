// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/cssinclude
	New()
		..("link")
		setAttribute("rel", "stylesheet")
		setAttribute("type", "text/css")
		selfCloses = 1

	proc/setHref(var/href as text)
		setAttribute("href", href)