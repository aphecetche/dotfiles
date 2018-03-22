Kept for the record, but only the gmail.lua is currently used, manually, in
 order to "extract" from gmail account the professional emails that could have
 sneaked in.

 Usage : 

```
imapfilter -c gmail.lua -n 
```

(remove -n to actually make the move)

Also cern.lua is used to move Archive mails to Archive/Archive-YEAR at the end of year.

Note that for ccsubatech one must specify the location of the truststore :

```
imapfilter -c ccsubatech.lua -t /usr/local/etc/openssl/cert.pem
```
