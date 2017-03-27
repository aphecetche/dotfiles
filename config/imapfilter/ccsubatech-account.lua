c = loadfile("common.lua")
c()

ccsubatech = IMAP {
  server = "subatechmail.in2p3.fr",
    username = "aphecete@subatech.in2p3.fr",
  password = getpassword("ccsubatech"),
    ssl ='auto'
}


