# Branching Strategy

This documentfor Git branching strategy.

## Main Branches

- `main`:  
  - It Contains production-ready code.
  - Only updated code via pull requests (PRs) from `develop` or `release/*` branches.

- `develop`:  
  - Integration branch for features.
  - Contains the latest code merged from feature branches.
  - Regularly deployed to staging like preprod,UAT for testing.

## Supporting Branches

### Feature Branches
- Naming convention: `feature/dev-jiraid`
- Created from: `develop`
- Merged into: `develop`
- Example: `feature/dev-tst-123`

### Bugfix Branches
- Naming convention: `bugfix/<issue-description>`
- Created from: `develop`
- Merged into: `develop`

### Release Branches
- Naming convention: `release/<version>`
- Created from: `develop`
- Merged into: `main` and `develop`
- Used for final QA and minor bug fixes before release.

### Hotfix Branches
- Naming convention: `hotfix/<issue-description>`
- Created from: `main`
- Merged into: `main` and `develop`
- Used for critical fixes in production.

## Pull Request Guidelines

- All changes must go through a PR.
- PRs must be reviewed by at least one team member.
- PR titles should follow the format: `[TYPE] Brief description`
  - Types: `FEATURE`, `BUGFIX`, `REFACTOR`, `HOTFIX`, `DOCS`
---

