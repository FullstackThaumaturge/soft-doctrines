TEXT!=find text -name '*.md' | sort

.DEFAULT: build

.PHONY: build
build: plain epub html pdf

.PHONY: plain
plain: $(TEXT)
	pandoc --wrap=auto --columns=72 -o soft-doctrines.txt $(TEXT)

.PHONY: epub
epub: $(TEXT)
	pandoc -t epub3 -o soft-doctrines.epub ./epub.yaml $(TEXT)

.PHONY: pdf
pdf: $(TEXT)
	pandoc -t pdf -o soft-doctrines.pdf ./epub.yaml $(TEXT)

.PHONY: html
html: $(TEXT)
	pandoc -s -o soft-doctrines.html ./html.yaml $(TEXT)

clean:
	rm -f soft-doctrines.*
