# shellcheck disable=SC2148
if [[ "$1" == "update" ]]; then # Route

  if [[ "$#" -lt 3 ]]; then # Check args
    br
    p "Usage: ${em}appwrite update <username> <newUsername>${x}"
    br
    exit 1
  fi # end Check args

  # Getting the values we'll need
  actual_username="$2"
  new_username="$3"
  collection_id="$(dataGet "appwrite" "USERS_COLLECTION")"


  # Check if the user exists
  documents=$(read_collection "$collection_id")
  document_id=$(echo "$documents" | jq -r --arg username "$actual_username" \
            'select(.username == $username)' | jq -r '."$id"')

  if [ -z "$document_id" ]; then # Main part
    # Exit if username already exist
    br
    p "${btnWarning} Oops! ${x} No ${actual_username} in the base."
    br
    exit 1

  else

    p "${btnSuccess} Ok ${x} Username ${actual_username} is real."
    confirm "Do we change it to ${new_username}"

    # Prepare the Payload
    data='{
        "data": {
        "username": "'"$new_username"'"
        }
    }'

    # Update the username
    if update_document "$collection_id" "$document_id" "$data" > /dev/null; then
      br
      p "${btnSuccess} Done! ${x} ${actual_username} is now called ${new_username}."
      br
      exit 0
    else
      br
      p "${btnWarning} Oops! ${x} Process exited with code ${?}"
      br
      exit 1
    fi # end Update the username

  fi # end Main part

fi # end Route