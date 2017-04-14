c = loadfile("cern-account.lua")
c()

-- messages = cern["INBOX"]:contain_subject("[AliBuild]") *
--   cern["INBOX"]:contain_to("alice-analysis-operations")
-- messages:move_messages(cern["OPS/alice"])

-- mind the order for this one (should happen after the
-- preceeding one...)
-- messages = 
-- cern["INBOX"]:contain_to("alice-analysis-operations") +
-- cern["INBOX"]:contain_cc("alice-analysis-operations") +
-- cern["INBOX"]:contain_to("alice-project-analysis-") +
-- cern["INBOX"]:contain_cc("alice-project-analysis-")
-- messages:move_messages(cern["OPS/alice"])
--
-- messages = cern["INBOX"]:contain_to("alice-lcg-task-force") +
-- cern["INBOX"]:contain_cc("alice-lcg-task-force") +
-- cern["INBOX"]:contain_from("WLCG Office") +
-- cern["INBOX"]:contain_to("WLCG Office")
-- messages:move_messages(cern["OPS/lcg"])
--
-- messages = cern["INBOX"]:contain_to("alice-dimuon-tracking-experts") + cern["INBOX"]:contain_cc("alice-dimuon-tracking-experts")
-- messages:move_messages(cern["MUON/MCH"])
--
-- -- physics working groups
-- pwgs={ ["pwg-HF"] = "HF",
--        ["pwg-DQ"] = "DQ",
--        ["pag-dq"] = "DQ",
--        ["pag-hf"] = "HF"
--    }
--
--
-- for i,p in pairs(pwgs) do
--     messages = cern["INBOX"]:contain_to("alice-" .. i) + 
--     cern["INBOX"]:contain_cc("alice-" .. i)
--     messages:move_messages(cern["PWG"])
-- end
--
-- messages = cern["INBOX"]:contain_to("alice-member") *
-- cern["INBOX"]:contain_subject("Paper Draft Open for Comments")
-- messages:move_messages(cern["Papers"])
--
-- messages = cern["INBOX"]:contain_subject("[ALICE Publications]")
-- messages:move_messages(cern["Papers"])

-- O2 stuff

-- general news

-- messages = cern["INBOX"]:contain_to("alice-o2-wp") + 
-- cern["INBOX"]:contain_cc("alice-o2-wp")
-- messages:move_messages(cern["O2/WPs"])
--
-- messages = cern["INBOX"]:contain_to("alice-o2") + 
-- cern["INBOX"]:contain_cc("alice-o2")
-- messages:move_messages(cern["O2"])
