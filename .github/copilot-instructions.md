# Copilot / AI Agent Instructions for openrouter

This file guides AI coding agents working on the `openrouter` VS Code extension. Keep it short and focused: what an agent needs to know to be productive immediately.

- Project purpose: a small VS Code extension (CLI GUI) exposing a single command `openrouter.helloWorld` implemented in `src/extension.ts`. The built extension entry point is `./dist/extension.js` (compiled by `esbuild`).

- Build and test commands (project root):
  - Build: `npm run compile` (runs `tsc --noEmit` typecheck, `eslint src`, then `node esbuild.js`)
  - Run tests: `npm test` (Jest via `ts-jest`) — tests are in `src/test/*.test.ts`
  - Watch: `npm run watch` (esbuild + tsc watchers)

- Formatting & linting:
  - Prettier config: `.prettierrc` — run `npm run format` to fix; `npm run format:check` to verify.
  - ESLint: flat config in `eslint.config.mjs`. Run `npm run lint` (or `npm run lint -- --fix`) to lint/fix.
  - The project integrates Prettier into ESLint using `eslint-plugin-prettier` and enforces `prettier/prettier` as an error.

- Husky / Git hooks:
  - Hooks live in `.husky/`. Pre-commit runs `npm run lint && npm run format:check && npm test`.
  - If hooks don't run, ensure `core.hooksPath` points to `.husky` and Husky is installed (see `package.json: "prepare": "husky"`). Manual run: `npx husky run pre-commit`.

- Important configs:
  - `jest.config.json` — uses `ts-jest` and `tsconfig.json`.
  - `tsconfig.json` — `module: Node16`, `target: ES2022`, `isolatedModules: true`.
  - `.vscode/settings.json` — format on save enabled, Prettier as default formatter.

- Patterns & conventions:
  - TypeScript-first: `src` is root; `rootDir` is `src` and compiled output lives in `dist`/`out`.
  - Tests use Jest + `ts-jest` and live in `src/test`.
  - Keep commands in `package.json` as single-source for build/test/lint/format.

- Where to modify behavior:
  - Add commands in `package.json` scripts.
  - Update lint rules in `eslint.config.mjs`.
  - Change build bundling in `esbuild.js`.

- Quick examples:
  - Run tests and lint: `npm run lint && npm test`
  - Format everything then stage: `npm run format && git add -A`

If anything above is out-of-date or you need a deeper walkthrough (CI, publishing to Marketplace, or multi-command hooks), ask and I'll update this file with exact commands and examples.
