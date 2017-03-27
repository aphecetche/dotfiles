c = loadfile("cern-account.lua")
c()

gmail = IMAP {
  server = "imap.gmail.com",
  username = "laurent.aphecetche@gmail.com",
  password = getpassword("gmail"),
  ssl = 'tls1',
}

-- move messages inside gmail

-- gmail:unsubscribe_mailbox("github/aliceo2")
-- gmail:unsubscribe_mailbox("github/alibuild")
-- gmail:delete_mailbox("github/aliceo2")
-- gmail:delete_mailbox("github/alibuild")

messages = gmail["INBOX"]:contain_from("Fred de") +
           gmail["INBOX"]:contain_from("Beaux-Arts")
messages:move_messages(gmail["pub/beauxarts"])

messages = gmail["INBOX"]:contain_from("amazon")
messages:move_messages(gmail["pub/amazon"])

-- move some github messages to relevant cern mailboxes

messages = gmail["INBOX"]:contain_to("AliceO2")
messages:move_messages(cern["GIT/aliceo2"])

messages = gmail["INBOX"]:contain_to("alibuild")
messages:move_messages(gmail["GIT/alibuild"])

messages = gmail["INBOX"]:contain_to("alisw/AliRoot")
messages:move_messages(gmail["GIT/aliroot"])
