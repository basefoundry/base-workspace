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

The manifest keeps Base's source dependencies required: `base`,
`base-bash-libs`, and `base-cli`. The first-party `base-cli-demo` and
`base-bash-libs-demo` repositories remain listed for discovery and workspace
updates, but are optional for a normal Base checkout. Use
`basectl workspace clone --manifest workspace.yaml --include-optional` when a
local checkout also needs those demos.

## Base

This repository is managed by [Base](https://github.com/basefoundry/base).

Common commands:

```bash
basectl setup base-workspace
basectl check base-workspace
basectl doctor base-workspace
basectl test base-workspace
```
