// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/option
	New()
		..("option")

	proc/setValue(var/val as text)
		setAttribute("value", val)

	proc/setText(var/txt as text)
		innerHtml = txt