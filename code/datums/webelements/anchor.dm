// SPDX-License-Identifier: CC-BY-NC-SA-3.0

/datum/tag/anchor
	New()
		..("a")

	proc/setHref(var/href as text)
		setAttribute("href", href)

	proc/setText(var/txt as text)
		innerHtml = txt