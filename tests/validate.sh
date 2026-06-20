#!/usr/bin/env bash

required_files=(
  README.md
  VERSION
  CHANGELOG.md
  CONTRIBUTING.md
  .github/pull_request_template.md
  .github/base-project.yml
  LICENSE
  base_manifest.yaml
  .github/workflows/project-intake.yml
  .github/workflows/tests.yml
)

for file in "${required_files[@]}"; do
  [[ -f "$file" ]] || {
    printf 'Missing required file: %s\n' "$file" >&2
    exit 1
  }
done

if grep -Eq 'default_branch:[[:space:]]*master\b' workspace.yaml; then
  printf 'workspace.yaml must not use master as a default branch.\n' >&2
  exit 1
fi

printf 'Repository baseline is present.\n'
