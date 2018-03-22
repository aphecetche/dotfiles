c = loadfile("cern-account.lua")
c()


-- move messages from Archive to Archive-YEAR
-- cern:create_mailbox("Archive/Archive-2016")
-- cern:create_mailbox("Archive/Archive-2017")
--
-- mbox = cern['Archive']:select_all()
--
-- messages =  mbox:arrived_since('01-Jan-2017') * mbox:arrived_before('01-Jan-2018')
-- messages:move_messages(cern['Archive/Archive-2017'])
--
-- messages =  mbox:arrived_since('01-Jan-2016') * mbox:arrived_before('01-Jan-2017')
-- messages:move_messages(cern['Archive/Archive-2016'])
--
-- messages =  mbox:arrived_since('01-Jan-2015') * mbox:arrived_before('01-Jan-2016')
-- messages:move_messages(cern['Archive/Archive-2015'])

