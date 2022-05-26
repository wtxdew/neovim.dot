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

###
function remove_old_cache_files() {
  local packer_cache="$NVIM_CONFIG_DIR/plugin/packer_compiled.lua"
  if [ -e "$packer_cache" ]; then
    msg "Removing old packer cache file"
    rm -f "$packer_cache"
  fi

  if [ -e "$NVIM_CACHE_DIR/luacache" ] || [ -e "$NVIM_CACHE_DIR/lvim_cache" ]; then
    msg "Removing old startup cache file"
    rm -f "$NVIM_CACHE_DIR/{luacache,nvim_cache}"
  fi
}

###
function setup_lvim() {
  #remove_old_cache_files
  #setup_shim

  echo "Preparing Packer setup"
  "$INSTALL_PREFIX/bin/nvim" --headless \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
  echo "Packer setup complete"
}

###
function clone_dot() {
  msg "Cloning NeoVim configuration"
  if ! git clone --branch "master" \
    --depth 1 "https://github.com/wtxdew/neovim.dot.git" "$NVIM_BASE_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

###
function backup_old_config() {
  local src="$NVIM_CONFIG_DIR"
  if [ ! -d "$src" ]; then
    return
  fi
  mkdir -p "$src.old"
  touch "$src/ignore"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive -hh --stats --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    OS="$(uname -s)"
    case "$OS" in
      Linux | *BSD)
        cp -r "$src/"* "$src.old/."
        ;;
      Darwin)
        cp -R "$src/"* "$src.old/."
        ;;
      *)
        echo "OS $OS is not currently supported."
        ;;
    esac
  fi
  msg "Backup operation complete"
}

###
function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

###
function check_system_deps() {
  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
  check_neovim_min_version
}

###
function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge install -y"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

################################################################################
# Main function
################################################################################
function main() {
  parse_arguments "$@"
  msg "Detecting platform for managing any additional neovim dependencies"
  detect_platform
  check_system_deps
  backup_old_config
  clone_dot
  setup_lvim
}

main "$@"
