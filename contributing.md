# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test aapt2 https://github.com/ronnnnn/asdf-aapt2.git "aapt2 --help"
```

Tests are automatically run in GitHub Actions on push and PR.
