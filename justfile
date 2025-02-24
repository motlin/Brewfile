# List all available brew-related recipes
default:
    @just --list --unsorted

# Dump current Homebrew packages to Brewfile with descriptions
dump:
    brew bundle dump --force --describe

# Install all dependencies from Brewfile
install:
    brew bundle install

# Clean up outdated downloads and remove old versions
cleanup:
    brew cleanup

# Update Homebrew and upgrade all packages
upgrade:
    brew update
    brew upgrade
    brew cleanup
    uv tool upgrade --all

# Show outdated packages
outdated:
    brew outdated

