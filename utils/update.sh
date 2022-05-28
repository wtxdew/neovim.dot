#!/usr/bin/env bash
set -eo pipefail
declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"

declare -r NVIM_BASE_DIR="${NVIM_BASE_DIR:-"$XDG_CONFIG_HOME/nvim"}"
declare -r NVIM_CONFIG_DIR="${NVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/nvim"}"
declare -r NVIM_CACHE_DIR="${NVIM_CACHE_DIR:-"$XDG_CACHE_HOME/nvim"}"

###
function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

################################################################################
# Main function
################################################################################
function main() {
  # parse_arguments "$@"
  msg "Update Nvim configuration of wtxdew"
  nvim --headless +PackerUpdate +qall
  cd ~/.config/nvim && git pull
  nvim --headless +PackerSync +qall
  msg "Neovim update complete"
}

main "$@"
