# List all available brew-related recipes
default:
    @just --list --unsorted

# Dump current Homebrew packages to Brewfile with descriptions
dump:
    brew bundle dump --force --describe
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
    brew upgrade --quiet
    brew cleanup --quiet
    uv tool upgrade --all
    mise list --global | grep "latest" | awk '{print $1}' | grep -v "Tool" | xargs -I{} mise upgrade {}
    gcloud components update --quiet

# Show outdated packages
outdated:
    brew outdated

