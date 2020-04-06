#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  local backup_dir="$HOME/.dotbackup"

  if [ ! -d "$backup_dir" ];then
    command echo "$backup_dir not found. Auto Make it"
    command mkdir "$backup_dir"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})

  command echo "[INFO] script_dir: $script_dir"
  command echo "[INFO] dotdir: $dotdir"
  command echo "[INFO] backup_dir: $backup_dir"

  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue

      if [[ -L "$HOME/`basename $f`" ]];then
        command echo "Remove old symlink: $HOME/`basename $f`"
        command rm -f "$HOME/`basename $f`"
      fi

      if [[ -e "$HOME/`basename $f`" ]];then
        command echo "Backup old dotfile: $HOME/`basename $f`"
        command mv "$HOME/`basename $f`" "$backup_dir"
      fi

      command echo "Make symlink: $HOME/`basename $f` -> $f"
      command ln -snf $f $HOME
    done

    if [ -d "$HOME/bin" ]; then
      command mv "$HOME/bin/*" "$backup_dir/"
    fi
    command ln -snf $dotdir/bin $HOME
  else
    command echo "same install src dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
git config --global include.path "$HOME/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

