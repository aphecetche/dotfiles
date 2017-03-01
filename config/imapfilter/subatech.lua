c = loadfile("cern.lua")
c()

-- options.namespace=false

subatech = IMAP {
  server = "imap-subatech.in2p3.fr",
  username = "aphecete",
  password = getpassword("subatech"),
  ssl = 'auto'
}


prefix="~/IMAPMAILBOXES/"

messages = subatech["INBOX"]:contain_subject("[SPAM]")
messages:move_messages(subatech[prefix .. "Junk"])

messages = subatech["INBOX"]:contain_subject("[tout-campus-nantes]") +
subatech["INBOX"]:contain_to("personnel@imt-atlantique.fr")
messages:move_messages(subatech[prefix .. "IMT"])

messages = subatech["INBOX"]:contain_field("X-Spam-Level","***") +
subatech["INBOX"]:contain_field("X-Spam-Level","****") +
subatech["INBOX"]:contain_field("X-Spam-Level","*****") +
subatech["INBOX"]:contain_field("X-Spam-Level","******")
messages:move_messages(subatech[prefix .. "Junk"])

messages = subatech["INBOX"]:contain_subject("[ufr-sciences]") + 
subatech["INBOX"]:contain_from("informations-universite") +
subatech["INBOX"]:contain_subject("INTRANETSCIENCES") +
subatech["INBOX"]:contain_from("drpi@univ-nantes.fr") +
subatech["INBOX"]:contain_subject("[campus-lombarderie]") +
subatech["INBOX"]:contain_to("tous@univ-nantes.fr")
messages:move_messages(subatech[prefix .. "Univ"])

messages = subatech["INBOX"]:contain_to("LCGFR-") +
subatech["INBOX"]:contain_cc("LCGFR-") +
subatech["INBOX"]:contain_from("biscarat") +
subatech["INBOX"]:contain_to("biscarat") +
subatech["INBOX"]:contain_cc("biscarat") +
subatech["INBOX"]:contain_from("duflot") +
subatech["INBOX"]:contain_to("duflot") +
subatech["INBOX"]:contain_cc("duflot") +
subatech["INBOX"]:contain_from("vernet") +
subatech["INBOX"]:contain_to("vernet") +
subatech["INBOX"]:contain_cc("vernet")
messages:move_messages(cern["OPS/lcg"])

-- messages = subatech[prefix.."InfoSR"]:contain_to("LCGFR-") +
-- subatech[prefix.."InfoSR"]:contain_cc("LCGFR-")
-- messages:move_messages(cern["OPS/lcg"])

messages = subatech["INBOX"]:contain_from("amadeus.net") +
subatech["INBOX"]:contain_cc("amadeus.net") +
subatech["INBOX"]:contain_to("amadeus.net") +
subatech["INBOX"]:contain_subject("easyJet booking reference")
messages:move_messages(subatech[prefix .. "Missions"])

messages = subatech["INBOX"]:contain_from("SUBATECH-glpi-ticket") + 
subatech["INBOX"]:contain_to("SUBATECH-glpi-ticket") +
subatech["INBOX"]:contain_cc("SUBATECH-glpi-ticket")
messages:move_messages(subatech[prefix .. "InfoSR"])

messages = subatech["INBOX"]:contain_from("grambow") +
subatech["INBOX"]:contain_from("huguet") +
subatech["INBOX"]:contain_from("decatoire")
messages:move_messages(subatech[prefix.."Admin"])

-- messages = subatech[prefix.."MID"]:select_all()
-- messages:move_messages(cern["MUON/MID"])
-- messages = subatech[prefix.."MTR"]:select_all()
-- messages:move_messages(cern["MUON/MTR"])
-- subatech:delete_mailbox(prefix.."MID")
-- subatech:delete_mailbox(prefix.."MTR")
-- subatech:delete_mailbox(prefix.."Apple Mail To Do")
-- subatech:delete_mailbox(prefix.."Deleted Messages (Subatech)");

-- messages = subatech[prefix.."Jpsi2mumu-pA"]:select_all()
-- messages:move_messages(cern["Papers/Jpsi2mumu-pA-2013"])
-- subatech:unsubscribe_mailbox(prefix.."Jpsi2mumu-pA")
-- subatech:delete_mailbox(prefix.."Jpsi2mumu-pA")

-- messages = subatech[prefix.."Phi2mumu-pA"]:select_all()
-- messages:move_messages(cern["Papers/Phi2mumu-pA"])
-- messages = subatech[prefix.."Phi2mumu-AA"]:select_all()
-- messages:move_messages(cern["Papers/Phi2mumu-PbPb"])
-- subatech:unsubscribe_mailbox(prefix.."Phi2mumu-pA")
-- subatech:unsubscribe_mailbox(prefix.."Phi2mumu-AA")
-- subatech:delete_mailbox(prefix.."Phi2mumu-pA")
-- subatech:delete_mailbox(prefix.."Phi2mumu-AA")

-- subatech:unsubscribe_mailbox(prefix .. "Junk (Subatech)")
-- subatech:unsubscribe_mailbox(prefix .. "Drafts (Subatech)")
-- subatech:unsubscribe_mailbox(prefix .. "Sent Messages (Subatech)")
-- subatech:unsubscribe_mailbox(prefix .. "ToDos.mbox (Subatech)")
-- subatech:delete_mailbox(prefix .. "Junk (Subatech)")
-- subatech:delete_mailbox(prefix .. "Drafts (Subatech)")
-- subatech:delete_mailbox(prefix .. "Sent Messages (Subatech)")
-- subatech:delete_mailbox(prefix .. "ToDos.mbox (Subatech)")
--
-- subatech:delete_mailbox(prefix .. "CERN")

-- mbox=subatech[prefix .. "Archive"]
-- messages = mbox:arrived_before("01-Jan-2012")
-- messages:move_messages(subatech[prefix .. "Archive-pre2012"])
-- messages = subatech[prefix .. "Archive-2017"]:select_all()
-- messages:move_messages(subatech[prefix .. "Archive"])
-- messages:move_messages(subatech[prefix .. "Archive-2012"])
-- messages = mbox:arrived_since("01-Jan-2012") * mbox:arrived_before("01-Jan-2013")
-- messages:move_messages(subatech[prefix .. "Archive-2012"])
-- messages = mbox:arrived_since("01-Jan-2013") * mbox:arrived_before("01-Jan-2014")
-- messages:move_messages(subatech[prefix .. "Archive-2013"])
-- messages = mbox:arrived_since("01-Jan-2014") * mbox:arrived_before("01-Jan-2015")
-- messages:move_messages(subatech[prefix .. "Archive-2014"])
-- messages = mbox:arrived_since("01-Jan-2015") * mbox:arrived_before("01-Jan-2016")
-- messages:move_messages(subatech[prefix .. "Archive-2015"])
-- messages = mbox:arrived_since("01-Jan-2016") * mbox:arrived_before("01-Jan-2017")
-- messages:move_messages(subatech[prefix .. "Archive-2016"])
--
-- subatech:delete_mailbox(prefix.."A trier")
-- subatech:delete_mailbox(prefix.."apple")
-- subatech:delete_mailbox(prefix.."MCH-Run3")

-- mailboxes, folders = subatech:list_all("~/IMAPMAILBOXES")
--
-- for _,v in pairs(mailboxes) do
--     print(v)
-- end

