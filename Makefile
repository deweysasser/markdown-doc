OS=$(shell uname)
MARKDOWN_FILES=$(wildcard *.md)
HTML_FILES=$(foreach f,$(MARKDOWN_FILES),$(GEN_DIR)/$(basename $f).html)
GEN_DIR=generated/html

include os-magic.mk


# Where are the tools?
ifeq ($(OS), MacOS)
MARKDOWN=/usr/local/bin/markdown
else
MARKDOWN=markdown
endif


######################################################################
# Targets
all: contents

contents: 
	./scripts/update-toc *.md

setup: .git/hooks/pre-commit


# Set up the git hooks which re-generates the TOCs before every commit
hooks: .git/hooks/pre-commit

.git/hooks/pre-commit: scripts/pre-commit
	mkdir -p $(dir $@)
	cp $< $@
	chmod +x $@

html: $(HTML_FILES)

# On Mac, we can depend on and install markdown
ifeq ($(OS),MacOS)
$(GEN_DIR)/%.html: $(MARKDOWN)
endif

$(GEN_DIR)/%.html: %.md $(GEN_DIR)
	$(MARKDOWN) $< > $@



$(GEN_DIR):
	mkdir -p $@

# We know how to install Markdown on MacOS
ifeq ($(OS),Darwin)
$(MARKDOWN):
	brew install markdown
endif


clean:
	rm -rf generated

# Just some debugging info
info:
	@echo OS=$(OS)
	@echo MARKDOWN=$(MARKDOWN)
	@echo MARKDOWN_FILES=$(MARKDOWN_FILES)
	@echo HTML_FILES=$(HTML_FILES)
