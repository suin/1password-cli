default:
    echo 'Hello, world!'

api-key:
    #!/usr/bin/env zsh
    set -euo pipefail
    vault=$(op vault list --format json | jq '.[].name' -r | gum filter)
    echo "Vault: $vault"
    title=$(gum input --placeholder title)
    echo "Title: $title"
    url=$(gum input --placeholder url)
    echo "URL: $url"
    api_key=$(gum input --password --placeholder api_key)
    echo "API Key: $(echo $api_key | head -c 4)***"
    op item create \
        --template=api-key.json \
        --vault="$vault" \
        --title="$title" \
        --url="$url" \
        key="$api_key"