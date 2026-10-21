# Architecture

The durable configuration is `workspace.yaml`: schema version, workspace name,
and repository entries with URL, default branch, and required/optional status.
`base_manifest.yaml` independently identifies this repository as a Base-managed
project and declares its validation command.

Base implements parsing, clone/update operations, status, checks, and diagnostics.
This repository supplies their input. No runtime service or package import is
needed to read the inventory. Standard contributor, issue, and CI files provide
repository governance rather than another workspace engine.

`tests/validate.sh` checks the repository baseline and the exact seven-repository
contract, including canonical URLs, main branches, required flags, and exclusions.
A deliberate inventory change therefore needs a matching test change and review;
adding a documentation pack does not change workspace membership.

Sources: [workspace.yaml](../workspace.yaml), [project manifest](../base_manifest.yaml),
[validation driver](../tests/validate.sh), and
[contribution guide](../CONTRIBUTING.md).
