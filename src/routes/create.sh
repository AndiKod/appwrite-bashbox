# shellcheck disable=SC2148
# Register a new user by it's username
if [[ "$1" == "create" ]]; then # Route

  # Printing the Usage if not enough args 
  if [[ "$#" -lt 2 ]]; then
    br
    p "Usage: ${em}appwrite create <username>${x}"
    br
    exit 1
  fi

  # Getting the values we'll need
  new_user="$2"
  collection_id="$(dataGet "appwrite" "USERS_COLLECTION")"
    
  confirm "Do we register ${new_user}"

  # Prepare the Payload
  # A uuid is expected as documentId
  # If needed, run: webi uuidv7@stable
  data='{
      "documentId": "'$(uuidv7)'",
      "data": {
      "username": "'$new_user'"
      }
  }'

  # Register the user
  if create_document "$collection_id" "$data" > /dev/null 2>&1; then
    br
    p "${btnSuccess} Done! ${x} ${new_user} is registered."
    br
    exit 0
  else
    br
    p "${btnWarning} Oops! ${x} Process exited with code ${?}"
    br
    exit 1
  fi
  
fi # End Route