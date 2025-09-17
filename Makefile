# Show help for each make target
help:
	@echo "Available make commands:"
	@echo "  make test            Run Jest tests (TypeScript)"
	@echo "  make test-watch      Run Jest in watch mode"
	@echo "  make test-coverage   Run Jest with coverage"
	@echo "  make test-extension  Run VS Code extension tests"
	@echo "  make build           Build the extension"
	@echo "  make lint            Lint the code"
# Makefile for openrouter VSCode Extension

# Run Jest tests (TypeScript)
test:
	npm run test

# Run Jest in watch mode
test-watch:
	npm run test:watch

# Run Jest with coverage
test-coverage:
	npm run test:coverage

# Run VS Code extension tests
test-extension:
	npm run test:extension

# Build the extension
build:
	npm run compile

# Lint the code
lint:
	npm run lint

lint-fix :
	npm run lint:fix

install:
	npm install

format:
	npm run format
