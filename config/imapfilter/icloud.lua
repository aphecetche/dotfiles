f = loadfile("common.lua")
f()

icloud = IMAP {
  server = "imap.mail.me.com",
  username = "laurent.aphecetche@me.com",
  password = getpassword("icloud"),
  ssl = 'tls1',
}

icloud:delete_mailbox( "trash")
icloud:delete_mailbox( "Deleted Messages")




