Some useful tools to debug

See the log : 

```
sudo tail -f /usr/local/var/log/dovecot/dovecot.log
```

See the configuration changes wrt defaults :

```
doveconf -n
```

Testing dovecot connection :

```
openssl s_client -connect localhost:993
a login user pass
a logout
```

Note : to get the local server certificate in case it's forgotten (as an alternative to re-generate it), use : 

openssl s_client -connect 127.0.0.1:993 -showcerts 2>&1 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | head -n 27 > dovecot.pem


