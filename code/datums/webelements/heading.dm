// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/heading
	New(var/level = 1)
		..("h[level]")

	proc/setText(txt as text)
		innerHtml = txt