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

assert_manifest_repo() {
  local name="$1"
  local url="$2"
  local required="$3"

  if ! awk -v expected_name="$name" \
    -v expected_url="$url" \
    -v expected_required="$required" '
    /^  - name:/ {
      if (in_entry) {
        exit
      }
      in_entry = ($3 == expected_name)
      next
    }
    in_entry && $1 == "url:" { actual_url = $2 }
    in_entry && $1 == "default_branch:" { actual_branch = $2 }
    in_entry && $1 == "required:" { actual_required = $2 }
    END {
      exit !(in_entry && actual_url == expected_url && actual_branch == "main" && actual_required == expected_required)
    }
  ' workspace.yaml; then
    printf 'workspace.yaml has an unexpected %s repository contract.\n' "$name" >&2
    exit 1
  fi
}

assert_manifest_repo base git@github.com:basefoundry/base.git true
assert_manifest_repo base-bash-libs git@github.com:basefoundry/base-bash-libs.git true
assert_manifest_repo base-cli git@github.com:basefoundry/base-cli.git true
assert_manifest_repo base-cli-demo https://github.com/basefoundry/base-cli-demo.git false
assert_manifest_repo base-bash-libs-demo https://github.com/basefoundry/base-bash-libs-demo.git false

printf 'Repository baseline is present.\n'
