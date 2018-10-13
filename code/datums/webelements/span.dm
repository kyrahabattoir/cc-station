// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/span
	New(var/type as text)
		..("span")

	proc/setText(var/txt as text)
		src.innerHtml = txt