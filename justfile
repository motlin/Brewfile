export MISE_MINIMUM_RELEASE_AGE_EXCLUDES := "npm:@openai/codex,npm:@anthropic-ai/claude-code"

# List all available brew-related recipes
default:
    @just --list --unsorted

# Dump current Homebrew packages to Brewfile with descriptions
dump:
    brew bundle dump --force --no-cargo
    sed -i '' 's/, args: { appdir: "\/Applications" }//' Brewfile

# Install all dependencies from Brewfile
install:
    brew bundle install

# Clean up outdated downloads and remove old versions
cleanup:
    brew cleanup

# Update Homebrew and upgrade all packages
upgrade:
    brew update --quiet
    brew outdated
    brew upgrade --quiet --yes
    brew cleanup --quiet
    uv tool upgrade --all
    mise list --global | awk '$NF ~ /^[0-9]/ {print $1}' | xargs -I{} mise upgrade --bump {}
    gcloud components update --quiet

# Show outdated packages
outdated:
    brew outdated
