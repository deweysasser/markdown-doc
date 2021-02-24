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

