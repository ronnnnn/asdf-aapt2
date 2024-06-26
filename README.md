<div align="center">

# asdf-aapt2 [![Build](https://github.com/ronnnnn/asdf-aapt2/actions/workflows/build.yml/badge.svg)](https://github.com/ronnnnn/asdf-aapt2/actions/workflows/build.yml) [![Lint](https://github.com/ronnnnn/asdf-aapt2/actions/workflows/lint.yml/badge.svg)](https://github.com/ronnnnn/asdf-aapt2/actions/workflows/lint.yml)

[AAPT2 (Android Asset Packaging Tool)](https://developer.android.com/tools/aapt2) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- No more dependencies are needed.

# Install

Plugin:

```shell
asdf plugin add aapt2
# or
asdf plugin add aapt2 https://github.com/ronnnnn/asdf-aapt2.git
```

aapt2:

```shell
# Show all installable versions
asdf list-all aapt2

# Install specific version
asdf install aapt2 latest

# Set a version globally (on your ~/.tool-versions file)
asdf global aapt2 latest

# Now aapt2 commands are available
aapt2 version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/ronnnnn/asdf-aapt2/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Seiya Kokushi](https://github.com/ronnnnn/)
