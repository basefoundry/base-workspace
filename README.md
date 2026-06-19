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

## Base

This repository is managed by [Base](https://github.com/basefoundry/base).

Common commands:

```bash
basectl setup base-workspace
basectl check base-workspace
basectl doctor base-workspace
basectl test base-workspace
```
