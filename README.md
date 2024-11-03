# XML transformation via XSLT

This repo is a handy API service we can use in our Make scenarios to convert XML into HTML (or other XML) via an XSLT.

```plain
bundle
bin/dev
```

And to transform some XML into HTML, pass `xml` and `xslt` parameters as either files or plain text:

```plain
curl -X POST http://localhost:3000/transform \
  -F "xml=@sample/user-roles.xml" \
  -F "xslt=@sample/user-roles.xslt"
```

```plain
curl -X POST http://localhost:3000/transform \
  -F "xml=@sample/user-scopes.xml" \
  -F "xslt=@sample/user-scopes.xslt"
```
