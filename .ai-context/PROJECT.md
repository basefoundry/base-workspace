# Base workspace inventory

`base-workspace` maintains the version-controlled inventory for a canonical Base
workspace. It is a small manifest repository, not a runtime, application, or
replacement for the Base CLI.

`workspace.yaml` declares four required repositories: base, base-bash-libs,
base-cli, and base-workspace. It also declares three optional reference consumers:
base-demo, base-cli-demo, and base-bash-libs-demo. Optional demos support validation
and development without becoming prerequisites for a normal Base checkout.

Other repositories can coexist under the same local workspace root while
remaining outside this inventory. Directory discovery by `basectl projects list`
and manifest-selected workspace operations answer different questions. Use a
separate manifest to manage a different group; do not silently expand this
canonical inventory to every checkout on one person's machine.

Sources: [README](../README.md), [workspace manifest](../workspace.yaml), and
[manifest validation](../tests/validate.sh).
