// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/scriptinclude
	New()
		..("script")
		setAttribute("type", "text/javascript")

	proc/setSrc(var/source as text)
		setAttribute("src", source)