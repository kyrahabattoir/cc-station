// SPDX-License-Identifier: CC-BY-NC-SA-3.0

// handles timed player actions
datum/controller/process/actions
	var/action_controler

	setup()
		name = "Actions"
		schedule_interval = 5

		action_controler = actions

	doWork()
		actions.process()