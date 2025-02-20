# 1Password API Key Manager

A command-line tool for securely managing API keys using 1Password CLI. This tool provides an interactive interface for storing API keys in your 1Password vault.

## Features

- Interactive CLI interface using [gum](https://github.com/charmbracelet/gum)
- Secure storage in 1Password
- Vault selection from your available 1Password vaults
- Structured API key storage with title, URL, and key

## Prerequisites

- [1Password CLI](https://1password.com/downloads/command-line/) installed and configured
- [devbox](https://www.jetpack.io/devbox) for development environment setup

## Installation

1. Clone this repository
2. Install devbox if you haven't already:
   ```bash
   curl -fsSL https://get.jetpack.io/devbox | bash
   ```
3. Set up the development environment:
   ```bash
   devbox shell
   ```

## Usage

To store a new API key:

```bash
just api-key
```

This will start an interactive process that will:

1. Let you select a 1Password vault
2. Ask for the API key title
3. Ask for the associated URL
4. Securely input the API key
5. Store the information in your selected 1Password vault

## Development

This project uses:

- [just](https://github.com/casey/just) for command running
- [direnv](https://direnv.net/) for environment management
- [gum](https://github.com/charmbracelet/gum) for interactive CLI
- [1Password CLI](https://1password.com/downloads/command-line/) for secure storage

To set up the development environment:

1. Install devbox
2. Run `devbox shell` to enter the development environment
3. All required tools will be automatically installed

## License

MIT
