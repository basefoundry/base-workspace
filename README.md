# base-workspace

Private workspace manifest for Base-managed projects.

## Workspace manifest

`workspace.yaml` is the durable private inventory for the local Base workspace.
Use it with Base workspace commands:

```bash
basectl workspace status --manifest workspace.yaml
basectl workspace check --manifest workspace.yaml
basectl workspace doctor --manifest workspace.yaml
basectl workspace clone --manifest workspace.yaml --dry-run
```

The manifest keeps Base's source and workspace dependencies required: `base`,
`base-bash-libs`, `base-cli`, and `base-workspace`. The first-party
`base-demo`, `base-cli-demo`, and `base-bash-libs-demo` repositories remain
listed for validation and workspace updates, but are optional for a normal
Base checkout. Use `basectl workspace clone --manifest workspace.yaml --include-optional`
when a local checkout also needs those demos.

Personal projects and adjacent integration repositories are intentionally not
members of this canonical manifest. They may still exist under the same local
workspace root; use a separate manifest when they need to be cloned or updated
as a group.

## Base

This repository is managed by [Base](https://github.com/basefoundry/base).

Common commands:

```bash
basectl setup base-workspace
basectl check base-workspace
basectl doctor base-workspace
basectl test base-workspace
```
