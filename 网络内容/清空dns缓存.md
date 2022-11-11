OS X Mountain Lion or Lion

Use the following Terminal command to reset the DNS cache:

```text
sudo killall -HUP mDNSResponder
```

Mac OS X v10.6

Use the following Terminal command to reset the DNS cache:

```text
sudo dscacheutil -flushcache
```

