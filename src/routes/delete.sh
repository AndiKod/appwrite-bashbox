# shellcheck disable=SC2148
if [[ "$1" == "delete" ]]; then # Route

  # Data
  username="$2"
  collection_id="$(dataGet "appwrite" "USERS_COLLECTION")"

  documents=$(read_collection "$collection_id")
  document_id=$(echo "$documents" | jq -r --arg username "$username" \
            'select(.username == $username)' | jq -r '."$id"')

  if [ -n "$document_id" ]; then

    confirm "Are you sure you want to delete ${username}"

    delete_document "${collection_id}" "${document_id}" > /dev/null
    br
    p "${btnSuccess} Done! ${x} ${username} is gone."
    br  

  else
    br
    p "${btnWarning} Oops! ${x} No ${username} here."
    br
  fi

  # Job Done!
  exit 0

fi # End Route