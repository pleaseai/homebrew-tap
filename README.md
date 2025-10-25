# PleaseAI Homebrew Tap

Official Homebrew tap for PleaseAI tools.

## What is this?

This is a Homebrew tap (third-party repository) that provides formulae for installing PleaseAI command-line tools.

## Installation

### Quick Install

Install any formula directly:

```bash
brew install pleaseai/tap/asana-cli
```

### Tap First (Optional)

Or add the tap first, then install:

```bash
brew tap pleaseai/tap
brew install asana-cli
```

## Available Formulae

### asana-cli

Manage your Asana tasks from the command line.

**Installation:**
```bash
brew install pleaseai/tap/asana-cli
```

**Usage:**
```bash
asana --help
asana auth login --token YOUR_TOKEN
asana task list -a me
```

**Repository:** [pleaseai/asana](https://github.com/pleaseai/asana)

## Updating

Update all installed formulae from this tap:

```bash
brew upgrade
```

Or update a specific formula:

```bash
brew upgrade asana-cli
```

## Uninstalling

Remove a formula:

```bash
brew uninstall asana-cli
```

Remove the tap:

```bash
brew untap pleaseai/tap
```

## How It Works

This tap is automatically updated by GitHub Actions whenever a new release is published to the respective tool repositories.

The formulae are maintained at:
- **asana-cli**: [asana-cli.rb](./asana-cli.rb)

## Contributing

Formulae in this tap are automatically generated and updated. Please do not submit manual updates.

If you find issues with a formula, please open an issue in the respective tool's repository:
- asana-cli issues: [pleaseai/asana/issues](https://github.com/pleaseai/asana/issues)

## License

MIT
