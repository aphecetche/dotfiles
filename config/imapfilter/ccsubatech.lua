-- load the definition of the Subatech account (CC version)
c = loadfile("ccsubatech-account.lua")
c()

-- load the definition of the CERN account
ce = loadfile("cern-account.lua")
ce()

ccsubatech["INBOX"]:check_status()

-- use the options below when moving large number of messages for instance
-- otherwise use the options defined in common.lua
options.timeout = 300
options.limit=50

subatechInbox = ccsubatech["INBOX"]
-- TODO : move all those filters to the server itself
--
messages = subatechInbox:contain_subject("[SPAM]")
messages:move_messages(ccsubatech[ "Junk"])

messages = subatechInbox:contain_subject("[tout-campus-nantes]") +
subatechInbox:contain_to("personnel@imt-atlantique.fr")
messages:move_messages(ccsubatech["IMT"])

messages = subatechInbox:contain_field("X-Spam-Level","***") +
subatechInbox:contain_field("X-Spam-Level","****") +
subatechInbox:contain_field("X-Spam-Level","*****") +
subatechInbox:contain_field("X-Spam-Level","******")
messages:move_messages(ccsubatech[ "Junk"])

messages = subatechInbox:contain_subject("[ufr-sciences]") + 
subatechInbox:contain_from("informations-universite") +
subatechInbox:contain_subject("INTRANETSCIENCES") +
subatechInbox:contain_from("drpi@univ-nantes.fr") +
subatechInbox:contain_subject("[campus-lombarderie]") +
subatechInbox:contain_to("tous@univ-nantes.fr")
messages:move_messages(ccsubatech["Univ"])

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

-- messages = subatech[prefix.."InfoSR"]:contain_to("LCGFR-") +
-- subatech[prefix.."InfoSR"]:contain_cc("LCGFR-")
-- messages:move_messages(cern["OPS/lcg"])

messages = subatechInbox:contain_from("amadeus.net") +
subatechInbox:contain_cc("amadeus.net") +
subatechInbox:contain_to("amadeus.net") +
subatechInbox:contain_subject("easyJet booking reference")
messages:move_messages(ccsubatech["Missions"])

messages = subatechInbox:contain_from("SUBATECH-glpi-ticket") + 
subatechInbox:contain_to("SUBATECH-glpi-ticket") +
subatechInbox:contain_cc("SUBATECH-glpi-ticket") +
subatechInbox:contain_from("barbet") +
subatechInbox:contain_from("chawoshi") +
subatechInbox:contain_from("pierrick")
messages:move_messages(ccsubatech["InfoSR"])

messages = subatechInbox:contain_from("grambow") +
subatechInbox:contain_from("huguet") +
subatechInbox:contain_from("decatoire") +
subatechInbox:contain_from("farah")
messages:move_messages(ccsubatech["Admin"])
--
--
-- for _,v in pairs(mailboxes) do
--     print(v)
-- end

