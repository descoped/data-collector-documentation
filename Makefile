SHELL=/bin/bash +x

.PHONY: default
default: | help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: clean
clean: ## Clean asciidoc
	@clean.sh

.PHONY: build
build: ## Build asciidoc
	@build.sh

.PHONY: open
open: ## Open asciidoc in browser
	@open target/README.html
