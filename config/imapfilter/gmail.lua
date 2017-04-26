c = loadfile("cern-account.lua")
c()
cc = loadfile("ccsubatech-account.lua")
cc()

gmail = IMAP {
  server = "imap.gmail.com",
  username = "laurent.aphecetche@gmail.com",
  password = getpassword("gmail"),
  ssl = 'tls1',
}

-- move label:cern messages to relevant cern mailboxes

messages = gmail["cern"]:select_all()
messages:move_messages(cern["INBOX"])

-- move label:subatech messages to ccsubatech
messages = gmail["subatech"]:select_all()
messages:move_messages(ccsubatech["INBOX"])

