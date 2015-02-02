# User guide

To generate the documentation:

```bash
$ sudo gem install yard
$ yard - README.md
$ open ./doc/index.html
```

To generate a pdf:

```bash
$ brew install wkhtmltopdf
$ yard $ yard --one-file
$ html2pdf ./doc/index.html docs.pdf
```

Enjoy!
