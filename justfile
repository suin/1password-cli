default:
    echo 'Hello, world!'

api-key:
    #!/usr/bin/env zsh
    set -euo pipefail
    title=$(gum input --placeholder title)
    echo "Title: $title"
    api_key=$(gum input --password --placeholder api_key)
    echo "API Key: $(echo $api_key | head -c 4)***"
    url=$(gum input --placeholder url)
    echo "URL: $url"
    vault=$(op vault list --format json | jq '.[].name' -r | gum filter)
    echo "Vault: $vault"
    op item create \
        --template=api-key.json \
        --vault="$vault" \
        --title="$title" \
        --url="$url" \
        key="$api_key" > /dev/null
    echo "API Key created in 1Password"

aws-access-key:
    #!/usr/bin/env zsh
    set -euo pipefail
    title="aws-access-key-$(gum input --placeholder title --prompt "> aws-access-key-")"
    echo "Title: $title"
    access_key_id=$(gum input --placeholder access_key_id)
    echo "Access Key ID: $(echo $access_key_id | head -c 4)***"
    secret_access_key=$(gum input --password --placeholder secret_access_key)
    echo "Secret Access Key: $(echo $secret_access_key | head -c 4)***"
    vault=$(op vault list --format json | jq '.[].name' -r | gum filter)
    echo "Vault: $vault"
    op item create \
        --template=aws-access-key.json \
        --vault="$vault" \
        --title="$title" \
        --url=https://console.aws.amazon.com/iam \
        "access key id"="$access_key_id" \
        "secret access key"="$secret_access_key" > /dev/null
    echo "AWS Access Key created in 1Password"
    echo "Testing AWS Access Key"
    export AWS_ACCESS_KEY_ID=$(op read "op://$vault/$title/access key id")
    export AWS_SECRET_ACCESS_KEY=$(op read "op://$vault/$title/secret access key")
    aws sts get-caller-identity
