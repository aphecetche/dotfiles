f = loadfile("common.lua")
f()

cern = IMAP {
  server = "imap.cern.ch",
  username = "laphecet",
  password = getpassword("cern"),
  ssl = 'auto'
}

