ssologin() {
  local profile="$1"

  # Make sure a profile is given
  if [ -z "$profile" ]; then
    echo "Usage: $0 <profile>"
    clisso apps ls 2> /dev/null
    return 1
  fi

  # Check if the profile is already valid in clisso
  if clisso status 2>&1 | grep -q "$profile "; then
    echo "Credentials still valid. Skipping login."
  else
    echo "Logging in to '$profile'..."
    clisso get "$profile"
  fi

  echo "Done! To use the profile, run: \`export AWS_PROFILE="$profile"\`"
}


ssologin "$@"
