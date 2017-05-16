ASCIIDOCTOR=asciidoctor
ASCIIDOCTOR_PDF=asciidoctor-pdf
ASCIIDOCTOR_OPTS=-a allow-uri-read
FILES=index.adoc
TARGETS=html docbook5 docbook45 pdf

.PHONY: help
help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  html      Generate a HTML page"
	@echo "  docbook5  Generate a Docbook 5.0 book"
	@echo "  docbook45 Generate a Docbook 4.5 book"
	@echo "  pdf       Generate a PDF document (requires asciidoctor-pdf)"
	@echo "  all       Do all of the above"

.PHONY: html
html:
	$(ASCIIDOCTOR) $(ASCIIDOCTOR_OPTS) -b html5 $(FILES)

.PHONY: docbook5
docbook5:
	$(ASCIIDOCTOR) $(ASCIIDOCTOR_OPTS) -b docbook5 -o index.5.xml $(FILES)

.PHONY: docbook45
docbook45:
	$(ASCIIDOCTOR) $(ASCIIDOCTOR_OPTS) -b docbook45 -o index.45.xml $(FILES)

.PHONY: pdf
pdf:
	$(ASCIIDOCTOR_PDF) $(ASCIIDOCTOR_OPTS) $(FILES)

.PHONY: all
all: $(TARGETS)
