// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/button
	New()
		..("button")

	proc/setText(var/txt as text)
		innerHtml = txt