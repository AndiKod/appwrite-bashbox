# shellcheck disable=SC2148
# @file Appwrite CRUD BashBox

use "std/fmt"
use "appwrite/crud"

# @description The homescreen function
main() {
  # Template
  h1 "Appwrite CRUD"
  hr "Sh:erpa" "-"
  h2 "Routes"
  p  "* appwrite create <username>"
  p  "* appwrite read"
  p  "* appwrite update <username> <newUsername>"
  p  "* appwrite delete <username>"
  br

}

# The Homescreen
if [[ "$#" == 0 ]]; then
  main
  exit 0
fi

# CREATE
# Route: appwrite create <username>
. "${ROOT}/src/routes/create.sh"

# READ
# Route: appwrite read
. "${ROOT}/src/routes/read.sh"

# UPDATE    
# Route: appwrite update <username> <newUsername>
. "${ROOT}/src/routes/update.sh"

# DELETE
# Route: appwrite delete <username>
. "${ROOT}/src/routes/delete.sh"