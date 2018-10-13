// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/paragraph
	New()
		..("p")

	proc/setText(txt as text)
		innerHtml = txt