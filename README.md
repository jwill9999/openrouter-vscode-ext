# openrouter README

This repository contains an MVP VS Code extension that integrates the openrouter CLI into VS Code as a small command/GUI. This project is an early proof-of-concept (MVP) and is not production ready.

The extension currently exposes a single command `openrouter.helloWorld` implemented in `src/extension.ts`. The extension binary is built to `./dist/extension.js` using `esbuild`.

Integration:

- This extension is intended to work with the openrouter CLI: https://github.com/jwill9999/openrouter-cli
- The goal is to provide a lightweight VS Code wrapper around the `openrouter-cli` commands (MVP stage).

Developer quick start

Prerequisites:

- Node.js (recommended 18+)
- npm

Build & run (local):

- Build: `npm run compile` (runs `tsc` typecheck, `eslint`, then `node esbuild.js`)
- Watch builds: `npm run watch`

Tests & linting

- Run tests (Jest + ts-jest):
  - `npm test`
  - `npm run test:watch` for watch mode
  - `npm run test:coverage` for coverage
- Lint:
  - `npm run lint` (check)
  - `npm run lint:fix` (auto-fix)

Formatting

- Prettier is configured in `.prettierrc`.
  - `npm run format` to auto-format all files
  - `npm run format:check` to verify formatting (CI friendly)

Makefile targets

This repository includes a `Makefile` with convenient aliases that call the npm scripts:

- `make help` — show available make targets
- `make test` — runs `npm run test`
- `make test-watch` — runs `npm run test:watch`
- `make test-coverage` — runs `npm run test:coverage`
- `make lint` — runs `npm run lint`
- `make build` — runs `npm run compile`

Husky & Git hooks

- Husky is configured: hooks are in `.husky/`.
- Pre-commit runs: `npm run lint && npm run format:check && npm test` (see `.husky/pre-commit`).
- If hooks are not firing, ensure Git is pointed to `.husky`:
  - `git config core.hooksPath .husky`
  - Or run hooks manually: `npx husky run pre-commit`

Project notes

- TypeScript-first project: `src` is the root, compiled output is written to `dist`/`out`.
- ESLint uses the flat config file `eslint.config.mjs` with `eslint-plugin-prettier` enabled.
- Tests live in `src/test`.

Status

- This repository is an MVP and experimental. Do not treat it as production-ready. Issues, missing tests, and rough edges are expected. Contributions should prioritize stabilizing the CLI integration and adding end-to-end tests.

Where to look

- Entry point: `src/extension.ts`
- Tests: `src/test/extension.test.ts`
- Lint config: `eslint.config.mjs`
- Build: `esbuild.js`, `tsconfig.json`
- Hooks: `.husky/pre-commit`

If you'd like, I can also add a short CONTRIBUTING.md describing the exact dev flow (run tests, lint, build, create PRs).

LICENSE: MIT
