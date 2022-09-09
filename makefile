TEXT!=find text -name '*.md' | sort
TODAY!=date -I date
.DEFAULT: build

.PHONY: build
build: plain epub html pdf

.PHONY: plain
plain: $(TEXT)
	pandoc --wrap=auto --columns=72 -o soft-doctrines_${TODAY}.txt $(TEXT)

.PHONY: epub
epub: $(TEXT)
	pandoc -t epub3 -o soft-doctrines_${TODAY}.epub ./epub.yaml $(TEXT)

.PHONY: pdf
pdf: $(TEXT)
	pandoc -t pdf -o soft-doctrines_${TODAY}.pdf $(TEXT)

.PHONY: html
html: $(TEXT)
	pandoc -s -o soft-doctrines_${TODAY}.html ./html.yaml $(TEXT)

clean:
	rm -f soft-doctrines*
