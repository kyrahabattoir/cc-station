// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/title
	New()
		..("title")

	proc/setText(txt as text)
		innerHtml = txt
