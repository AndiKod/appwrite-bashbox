# Appwrite CRUD from Bash 

This BashBox is a demo of a CLI Appwrite CRUD implementation, using the Appwrite BashLib collection of functions and built with [Sh:erpa](https://sherpa-cli.netlify.app/). 

_Note: A BashBox is package like a Cargo Crate, but for Bash. It can be installed, updated or uninstalled from the command-line, and bring new functionalities or tools right into the terminal ...on Linux, MacOS or WSL2._

## Prerequisites

[Sh:erpa](https://github.com/SherpaCLI/sherpa) need to be installed, in the same way we need Cargo to install & use crates.

Be sure you have bash, curl & gawk installed, then run:

```bash
curl -sSL https://raw.githubusercontent.com/SherpaBasecamp/sherpa/refs/heads/master/tools/install.sh | bash
```

Check [the QuickInstall](https://sherpa-cli.netlify.app/install/install/) page in the documantation.

## Install appwrite

1. Run the Install command

```bash
sherpa install -n "appwrite" -u "https://github.com/AndiKod/appwrite-bashbox.git"
```

The repo will be cloned, the executable built from the src/ files and be available as `appwrite`.

2. Install the appwrite library

```bash 
sherpa install -n "appwrite" -t "lib" -u "https://github.com/AndiKod/appwrite-bashlib.git"
``` 
This is needed to interact with Appwrite.


2. Example usage

Head to [appwrite.io](https://appwrite.io), create a project, a database and a "Users" collection with a "username" field.

_in boxes/appwrite/data/appwrite.yaml:_

```yaml [data/appwrite.yaml]
API_URL: https://cloud.appwrite.io/v1
DB_ID: -here your database ID-
PROJECT_ID: -here your project ID-            
```
The API_KEY is expected to be stored in '$SCD/env.yaml'

```yaml
APPWRITE_KEY: -here your API Key-
```

```bash
# Reminder of the commands:
appwrite

# List usernames in the collection
appwrite read

# Add a new username in the list
appwrite create <username>

# Update a username in the list
appwrite update <username> <newUsername>

# Delete a username from the list
appwrite delete <username>
```