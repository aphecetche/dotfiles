c = loadfile("cern-account.lua")
c()

messages = cern["INBOX"]:contain_subject("GIT-AliPhysics")
messages:move_messages(cern["GIT/aliphysics"])

messages = cern["INBOX"]:contain_subject("GIT-AliRoot")
messages:move_messages(cern["GIT/aliroot"])

messages = cern["INBOX"]:contain_subject("JIRA") *
  cern["INBOX"]:contain_subject("PWGPP")
messages:move_messages(cern["JIRA/pwgpp"])

messages = cern["INBOX"]:contain_subject("JIRA") *
  cern["INBOX"]:contain_subject("ALIROOT")
messages:move_messages(cern["JIRA/aliroot"])

messages = cern["INBOX"]:contain_subject("[AliBuild]") *
  cern["INBOX"]:contain_to("alice-analysis-operations")
messages:move_messages(cern["OPS/build"])

-- mind the order for this one (should happen after the
-- preceeding one...)
messages = 
cern["INBOX"]:contain_to("alice-analysis-operations") +
cern["INBOX"]:contain_cc("alice-analysis-operations") +
cern["INBOX"]:contain_to("alice-project-analysis-") +
cern["INBOX"]:contain_cc("alice-project-analysis-")
messages:move_messages(cern["OPS"])

messages = cern["INBOX"]:contain_to("alice-lcg-task-force") +
cern["INBOX"]:contain_cc("alice-lcg-task-force") +
cern["INBOX"]:contain_from("WLCG Office") +
cern["INBOX"]:contain_to("WLCG Office")
messages:move_messages(cern["OPS/lcg"])

messages = cern["INBOX"]:contain_to("alice-dpg") + 
cern["INBOX"]:contain_cc("alice-dpg")
messages:move_messages(cern["OPS/dpg"])

messages = cern["INBOX"]:contain_to("alice-dimuon-tracking-experts") + cern["INBOX"]:contain_cc("alice-dimuon-tracking-experts")
messages:move_messages(cern["MUON/MCH"])

-- physics working groups
pwgs={ ["pwg-HF"] = "HF",
       ["pwg-DQ"] = "DQ",
       ["pag-dq"] = "DQ",
       ["pag-hf"] = "HF"
   }


for i,p in pairs(pwgs) do
    messages = cern["INBOX"]:contain_to("alice-" .. i) + 
    cern["INBOX"]:contain_cc("alice-" .. i)
    messages:move_messages(cern["PWG/" .. p])
end

messages = cern["INBOX"]:contain_to("alice-member") *
cern["INBOX"]:contain_subject("Paper Draft Open for Comments")
messages:move_messages(cern["Papers"])

messages = cern["INBOX"]:contain_subject("[ALICE Publications]")
messages:move_messages(cern["Papers"])

-- O2 stuff

-- general news

messages = cern["INBOX"]:contain_to("alice-o2-cwg-all") + 
cern["INBOX"]:contain_cc("alice-o2-cwg-all")
messages:move_messages(cern["O2"])

-- computing working groups
cwgs={13,4,2,6,7,9}
for _,cwg in pairs(cwgs) do
    messages = cern["INBOX"]:contain_to("alice-o2-cwg" .. cwg) + 
    cern["INBOX"]:contain_cc("alice-o2-cwg" .. cwg)
    messages:move_messages(cern["O2/CWG" .. cwg])
end

-- mbox=cern["INBOX"]
-- messages = mbox:arrived_since("01-Jan-2012") * mbox:arrived_before("01-Jan-2013")
-- messages:move_messages(cern["Archive-2012"])
-- messages = mbox:arrived_since("01-Jan-2013") * mbox:arrived_before("01-Jan-2014")
-- messages:move_messages(cern["Archive-2013"])
-- messages = mbox:arrived_since("01-Jan-2014") * mbox:arrived_before("01-Jan-2015")
-- messages:move_messages(cern["Archive-2014"])
-- messages = mbox:arrived_since("01-Jan-2015") * mbox:arrived_before("01-Jan-2016")
-- messages:move_messages(cern["Archive-2015"])
-- messages = mbox:arrived_since("01-Jan-2016") * mbox:arrived_before("01-Jan-2017")
-- messages:move_messages(cern["Archive-2016"])
--
-- cern:rename_mailbox("JIRA/qa","JIRA/pwgpp")
-- cern:rename_mailbox("JIRA/reco","JIRA/aliroot")
-- cern:create_mailbox("O2/MRRTF")



