# Heroku Buildpack for UIlicious

![uilicious buildpack logo](https://uilicious.com/assets/images/illustration/automate-user-journey-tests-illustration.svg)

This is a [Heroku Buildpack](http://devcenter.heroku.com/articles/buildpacks) to install the [UIlicious CLI](https://github.com/uilicious/uilicious-cli).

## Usage

### Using the Heroku UIlicious buildpack

```shell
heroku buildpacks:set https://github.com/douglascayers/heroku-uilicious-buildpack#latest -a my-app
```

### Locking to a buildpack version

For stability reasons, you may want to lock dependencies - including buildpacks - to a specific version.

First, find the version you want from
[the list of buildpack versions](https://github.com/douglascayers/heroku-uilicious-buildpack/releases).
Then, specify that version with `buildpacks:set` by appending the version tag to the url:

```shell
heroku buildpacks:set https://github.com/douglascayers/heroku-uilicious-buildpack#v1 -a my-app
```

### Chain with multiple buildpacks

The buildpack automatically exports the uilicious-cli binary onto the `$PATH` for easy use in subsequent buildpacks.

### Configuration Variables

By default, the buildpack will install the latest UIlicious CLI version from [GitHub](https://github.com/uilicious/uilicious-cli/releases).

The download URLs follow the format `https://github.com/uilicious/uilicious-cli/releases/download/<version>/uilicious-cli-<os>-<arch>`.

The buildpack automatically infers the operating system and machine architecture of the Heroku dyno
to know which binary to install. However, you may set the following configuration variables to use specific values.

| Variable                | Sample Value | Default    | Description                                      |
| ----------------------- | ------------ | ---------- | ------------------------------------------------ |
| UILICIOUS_CLI_VERSION   | v5.1.6       | latest     | Which version to download. Usually is a git tag. |
| UILICIOUS_CLI_OS        | linux, macos | (inferred) | Which operating system you're installing on.     |
| UILICIOUS_CLI_ARCH      | x64, arm64   | (inferred) | Which CPU architecture you're installing on.     |

We recommend setting `UILICIOUS_CLI_VERSION` to pin your app to a specific version, for stability reasons.

## Development

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
