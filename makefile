TEXT!=find text -name '*.md' | sort

.DEFAULT: build

.PHONY: build
build: plain epub html

.PHONY: plain
plain: $(TEXT)
	pandoc -o soft-doctrines.txt $(TEXT)

.PHONY: epub
epub: $(TEXT)
	pandoc -t epub3 -o soft-doctrines.epub ./epub.yaml $(TEXT)

.PHONY: html
html: $(TEXT)
	pandoc -s -o soft-doctrines.html ./html.yaml $(TEXT)

clean:
	rm -f soft-doctrines.*
