## Heroku UIlicious Buildpack

This is a [Heroku Buildpack](http://devcenter.heroku.com/articles/buildpacks) to install the [UIlicious CLI](https://github.com/uilicious/uilicious-cli).

### Configuration Variables

The configuration variables help determine the version of the CLI to download from
https://github.com/uilicious/uilicious-cli/releases.

The download URLs follow the format `https://github.com/uilicious/uilicious-cli/releases/download/<version>/uilicious-cli-<os>-<arch>`.

| Variable                | Sample Value | Default    | Description                                      |
| ----------------------- | ------------ | ---------- | ------------------------------------------------ |
| UILICIOUS_CLI_VERSION   | v5.1.6       | latest     | Which version to download. Usually is a git tag. |
| UILICIOUS_CLI_OS        | linux, macos | (inferred) | Which operating system you're installing on.     |
| UILICIOUS_CLI_ARCH      | x64, arm64   | (inferred) | Which CPU architecture you're installing on.     |

We recommend setting `UILICIOUS_CLI_VERSION` to pin your app to a specific version, for stability reasons.

### Contributing

* Install [shell-format](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format) Visual Studio Code extension
* Add the following to your `settings.json`
   ```json
    "shellformat.flag": "-i 2 -ci -bn -sr",
    "shellformat.effectLanguages": [
        "shellscript",
        "dockerfile",
        "dotenv",
        "hosts",
        "ignore",
        "gitignore",
        "properties",
    ]
    ```
