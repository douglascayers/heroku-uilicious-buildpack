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

## Example Build Log

```
-----> UIlicious app detected
-----> Creating runtime environment

       UILICIOUS_CLI_ARCH=x64
       UILICIOUS_CLI_VERSION=v5.1.6
       UILICIOUS_CLI_OS=linux

-----> Downloading UIlicious CLI

       https://github.com/uilicious/uilicious-cli/releases/download/v5.1.6/uilicious-cli-linux-x64

-----> Installing UIlicious CLI
        _    _   _____            _   _          _                       
       | |  | | |_   _|          | | (_)        (_)                      
       | |  | |   | |    ______  | |  _    ___   _    ___    _   _   ___ 
       | |  | |   | |   |______| | | | |  / __| | |  / _ \  | | | | / __|
       | |__| |  _| |_           | | | | | (__  | | | (_) | | |_| | \__ \
        \____/  |_____|          |_| |_|  \___| |_|  \___/   \__,_| |___/
       
        ~ Testing should be a piece of cake! ~
       
       Usage: uilicious-cli <command> <args> [options]
       
       Commands:
         space <subcommand> <args>      space specific commands, currently limited to : list
       
         project <subcommand> <args>    Project specific commands, such as : run, list, upload, download
       
         run <project> <script-path>    Run a test file in a given project [Alias to: project run]
       
         upload <project> <localdir>    Upload (and overwrite) specified project files into uilicious
                                        servers [Alias to: project upload]
       
         download <project> <localdir>  Download (and overwrite) specified project files from uilicious
                                        servers [Alias to: project download]
       
       Options:
         -h, --help                Show help
       
         -v, --version             Show version number
       
         -u, --user <login-email>  Login email [Note: please use --key instead]
       
         -p, --pass <password>     Login password [Note: please use --key instead]
       
         -k, --key  <access-key>   Access key for CLI / API login, you can find this from your `Profile`
                                   -> `Access Keys`
       
         --json, --jsonOutput      Output result as a single final JSON object, disables default step by
                                   step line output
       
         --table, --tableOutput    Output result in a table like format, note that some commands (eg.
                                   list) defaults to this format
       
         -t, --trace               Extremely extremely verbose and noisy logging of all API calls [Note:
                                   this will log provided secrets]
       
         -s, --silent              Surpression of output stream, disables std/json output
       
         --apiHost <url-string>    [Enterprise Only] API url for dedicated or on-premise
       
         --loginAs <login-email>   [Enterprise Only] As an super admin, perform an action impersonating as
                                   the given user
       
       Examples:
         Runs a test file in the given project name
         $ uilicious-cli --key <access-key> project run 'Project-Awesome' 'suite/test-all'
       
         Runs with a custom browser (firefox), width and height instead
         $ uilicious-cli --key <access-key> project run 'Project-Awesome' 'suite/test-all' --browser
         firefox --width 1080 --height 720
       
         Runs a test using your login email and password instead (please use --key instead)
         $ uilicious-cli --user <your-awesome-email@not-evil-corp.com> --pass <super-secure-password> run
         'Project-Awesome' 'suite/test-all'
       
         Upload a folder of files, into the uilicious project, overwrite any existing files
         $ uilicious-cli --key <access-key> project upload 'Project-Delta' ./delta/ui-test/
       
         Download a ulicious project into a folder, overwrite any existing files
         $ uilicious-cli --key <access-key> project download 'Project-Gamma' ./gamma/ui-test/
       
         [Enterprise only] Using the CLI with your dedicated instance of uilicious
         $ uilicious-cli --apiHost https://<hostname>/<subpath-if-present>/api/v3.0/' <command>
       
       Happy Testing =]
       PS: if you are seeing this in a response to a command, it probably was an invalid command

-----> Successfully installed UIlicious CLI 5.1.6
```

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
