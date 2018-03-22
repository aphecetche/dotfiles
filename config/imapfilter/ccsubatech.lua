-- load the definition of the Subatech account (CC version)
cc = loadfile("ccsubatech-account.lua")
cc()

-- load the definition of the CERN account
ce = loadfile("cern-account.lua")
ce()

ccsubatech["INBOX"]:check_status()

-- use the options below when moving large number of messages for instance
-- otherwise use the options defined in common.lua
options.timeout = 300
options.limit=50

subatechInbox = ccsubatech["INBOX"]

messages = subatechInbox:contain_to("LCGFR-") +
subatechInbox:contain_cc("LCGFR-") +
subatechInbox:contain_from("biscarat") +
subatechInbox:contain_to("biscarat") +
subatechInbox:contain_cc("biscarat") +
subatechInbox:contain_from("duflot") +
subatechInbox:contain_to("duflot") +
subatechInbox:contain_cc("duflot") +
subatechInbox:contain_from("vernet") +
subatechInbox:contain_to("vernet") +
subatechInbox:contain_cc("vernet")
messages:move_messages(cern["OPS/lcg"])

ccsubatech["Attic/Archive-2012"]:select_all():move_messages(ccsubatech["Archive/Archive-2012"])
