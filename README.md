# auto-gofmt

A GitHub Action for auto-formatting Go code using [gofumpt](https://github.com/mvdan/gofumpt).

> **This is the maintained replacement for [iamnotaturtle/auto-gofmt](https://github.com/iamnotaturtle/auto-gofmt)**, which is no longer maintained. Drop-in compatible — just change the `uses:` reference.

## Usage

```yaml
- name: gofumpt
  uses: jameswoolfenden/auto-gofmt@v0.2
```

### Parameters

| Parameter | Required | Default | Description |
| - | :-: | :-: | - |
| commit_message | :x: | `"Formatting go code"` | Custom git commit message, ignored if used with `same_commit` |
| same_commit | :x: | `false` | Update the current commit instead of creating a new one. Requires checkout fetch-depth 0. |
| commit_options | :x: | - | Custom git commit options |
| push_options | :x: | - | Custom git push options |
| formatter_options | :x: | `-l -w .` | `gofumpt` options (default: whole repository) |
| file_pattern | :x: | `*` | Custom git add file pattern, cannot be used with `only_changed` |
| dry | :x: | `false` | Dry mode — files won't change, action fails if unformatted files exist |
| only_changed | :x: | `false` | Only format files changed in the last commit. Cannot be used with `file_pattern`. Requires checkout fetch-depth 0. |
| github_token | :x: | `${{ github.token }}` | GITHUB_TOKEN or a Personal Access Token |

### Example

```yaml
name: CI

on:
  pull_request:
    branches: [master]

jobs:
  format:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          ref: ${{ github.head_ref }}
          fetch-depth: 0

      - uses: jameswoolfenden/auto-gofmt@v0.2
        with:
          only_changed: true
```

## References

- [GitHub Prettier Action](https://github.com/creyD/prettier_action)
- [auto-go-format](https://github.com/sladyn98/auto-go-format)
- Original: [iamnotaturtle/auto-gofmt](https://github.com/iamnotaturtle/auto-gofmt)
