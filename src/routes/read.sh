# shellcheck disable=SC2148
if [[ "$1" == "read" ]]; then # Route

  # Data 
  collection_id="$(dataGet "appwrite" "USERS_COLLECTION")"
  get_documents_as_array "$collection_id" "users"

  # Template
  h1 "Appwrite CRUD"
  hr "Sh:erpa" "-"
  h2 "Users"
  p  "List of usernames from the users collection:"
  br
  # shellcheck disable=SC2154
  for user in "${users[@]}"; do
      username="$(field "username" "$user")"
      p "> $username"
  done
  br

fi # End of Route