function setup_home_session_vars;
# Only source this once.
if [ -n "$__HM_SESS_VARS_SOURCED" ]
  return
end
set -gx __HM_SESS_VARS_SOURCED '1'
set -gx DELTA_PAGER 'less -R'
set -gx EDITOR 'micro'
set -gx FLAKE '/home/xaolan/freljord'
set -gx GTK2_RC_FILES '/home/xaolan/.config/gtk-2.0/gtkrc'
set -gx MANPAGER 'sh -c \'col -bx | bat -l man -p\''
set -gx MANROFFOPT '-c'
set -gx QT_QPA_PLATFORMTHEME 'qt5ct'
set -gx QT_STYLE_OVERRIDE 'kvantum'
set -gx SKIM_ALT_C_OPTS '--preview \'eza --icons --git --color always -T -L 3 {} | head -200\' --exact'
set -gx SKIM_DEFAULT_COMMAND 'rg --files --hidden'
set -gx XCURSOR_SIZE '18'
set -gx XCURSOR_THEME 'Bibata-Modern-Ice'
set -gx XDG_CACHE_HOME '/home/xaolan/.local/cache'
set -gx XDG_CONFIG_HOME '/home/xaolan/.config'
set -gx XDG_DATA_HOME '/home/xaolan/.local/share'
set -gx XDG_DESKTOP_DIR '/home/xaolan/Desktop'
set -gx XDG_DOCUMENTS_DIR '/home/xaolan/Documents'
set -gx XDG_DOWNLOAD_DIR '/home/xaolan/Downloads'
set -gx XDG_MUSIC_DIR '/home/xaolan/Music'
set -gx XDG_PICTURES_DIR '/home/xaolan/Pictures'
set -gx XDG_PUBLICSHARE_DIR '/home/xaolan/Public'
set -gx XDG_SCREENSHOTS_DIR '/home/xaolan/Pictures/Screenshots'
set -gx XDG_STATE_HOME '/home/xaolan/.local/state'
set -gx XDG_TEMPLATES_DIR '/home/xaolan/Templates'
set -gx XDG_VIDEOS_DIR '/home/xaolan/Videos'
end
setup_home_session_vars
