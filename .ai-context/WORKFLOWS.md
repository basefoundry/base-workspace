# Workflows

With Base available, run the manifest-oriented read/plan commands from this
repository. Specify the intended workspace root when it differs from Base's
configured workspace:

```bash
basectl workspace status --manifest workspace.yaml
basectl workspace check --manifest workspace.yaml
basectl workspace doctor --manifest workspace.yaml
basectl workspace clone --manifest workspace.yaml --dry-run
./tests/validate.sh
git diff --check
```

A real clone creates local repositories. Optional demos require
`--include-optional`; their presence is not required for the normal workspace.
Review a plan before changing repositories, and preserve existing local work.
Use a separate inventory for unrelated personal or integration repositories.

Make inventory or documentation changes through an issue-backed canonical
branch and a dedicated worktree. Link the PR, record validation, and update
README/tests together when membership changes. Context-only updates do not
change VERSION, the workspace's repository set, or any sibling checkout.

Sources: [README commands](../README.md), [contribution guide](../CONTRIBUTING.md),
[workspace contract](../workspace.yaml), and [validation](../tests/validate.sh).
