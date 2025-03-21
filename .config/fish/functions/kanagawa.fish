# base16-fish (https://github.com/tomyun/base16-fish)
# based on base16-shell (https://github.com/chriskempson/base16-shell)
# untitled scheme by untitled

function kanagawa-theme -d "kanagawa"
  set color00 1F/1F/28 # Base 00 - Black
  set color01 C3/40/43 # Base 08 - Red
  set color02 98/BB/6C # Base 0B - Green
  set color03 DC/A5/61 # Base 0A - Yellow
  set color04 7E/9C/D8 # Base 0D - Blue
  set color05 95/7F/B8 # Base 0E - Magenta
  set color06 7F/B4/CA # Base 0C - Cyan
  set color07 DC/D7/BA # Base 05 - White
  set color08 72/71/69 # Base 03 - Bright Black
  set color09 $color01 # Base 08 - Bright Red
  set color10 $color02 # Base 0B - Bright Green
  set color11 $color03 # Base 0A - Bright Yellow
  set color12 $color04 # Base 0D - Bright Blue
  set color13 $color05 # Base 0E - Bright Magenta
  set color14 $color06 # Base 0C - Bright Cyan
  set color15 36/36/46 # Base 07 - Bright White
  set color16 FF/A0/66 # Base 09
  set color17 D2/7E/99 # Base 0F
  set color18 2A/2A/37 # Base 01
  set color19 22/32/49 # Base 02
  set color20 C8/C0/93 # Base 04
  set color21 93/8A/A9 # Base 06
  set colorfg $color07 # Base 05 - White
  set colorbg $color00 # Base 00 - Black

  if test -n "$TMUX"
    # Tell tmux to pass the escape sequences through
    # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
    function put_template; printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $argv; end;
    function put_template_var; printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $argv; end;
    function put_template_custom; printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $argv; end;
  else if string match 'screen*' $TERM # [ "${TERM%%[-.]*}" = "screen" ]
    # GNU screen (screen, screen-256color, screen-256color-bce)
    function put_template; printf '\033P\033]4;%d;rgb:%s\007\033\\' $argv; end;
    function put_template_var; printf '\033P\033]%d;rgb:%s\007\033\\' $argv; end;
    function put_template_custom; printf '\033P\033]%s%s\007\033\\' $argv; end;
  else if string match 'linux*' $TERM # [ "${TERM%%-*}" = "linux" ]
    function put_template; test $argv[1] -lt 16 && printf "\e]P%x%s" $argv[1] (echo $argv[2] | sed 's/\///g'); end;
    function put_template_var; true; end;
    function put_template_custom; true; end;
  else
    function put_template; printf '\033]4;%d;rgb:%s\033\\' $argv; end;
    function put_template_var; printf '\033]%d;rgb:%s\033\\' $argv; end;
    function put_template_custom; printf '\033]%s%s\033\\' $argv; end;
  end

  # 16 color space
  put_template 0  $color00
  put_template 1  $color01
  put_template 2  $color02
  put_template 3  $color03
  put_template 4  $color04
  put_template 5  $color05
  put_template 6  $color06
  put_template 7  $color07
  put_template 8  $color08
  put_template 9  $color09
  put_template 10 $color10
  put_template 11 $color11
  put_template 12 $color12
  put_template 13 $color13
  put_template 14 $color14
  put_template 15 $color15

  # 256 color space
  put_template 16 $color16
  put_template 17 $color17
  put_template 18 $color18
  put_template 19 $color19
  put_template 20 $color20
  put_template 21 $color21

  # syntax highlighting variables
  # https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
  set -U fish_color_normal DCD7BA
  set -U fish_color_command 7E9CD8
  set -U fish_color_keyword D27E99
  set -U fish_color_quote DCA561
  set -U fish_color_redirection DCD7BA
  set -U fish_color_end FFA066
  set -U fish_color_error C34043
  set -U fish_color_param DCA561
  set -U fish_color_comment 727169
  set -U fish_color_match --background=7FB4CA
  set -U fish_color_selection --background=7FB4CA
  set -U fish_color_history_current --bold
  set -U fish_color_operator 98BB6C
  set -U fish_color_escape D27E99
  set -U fish_color_autosuggestion 727169
  set -U fish_color_cwd 7E9CD8
  set -U fish_color_cwd_root C34043
  set -U fish_color_user 7E9CD8
  set -U fish_color_host DCA561
  set -U fish_color_host_remote D27E99
  set -U fish_color_cancel FFA066
  set -U fish_color_search_match --background=FFA066
  set -U fish_color_valid_path
  
  # pager color variables
  # https://fishshell.com/docs/current/interactive.html#pager-color-variables
  set -U fish_pager_color_progress FFA066
  set -U fish_pager_color_background --background=1F1F28
  set -U fish_pager_color_prefix 7E9CD8
  set -U fish_pager_color_completion DCA561
  set -U fish_pager_color_description FFA066
  set -U fish_pager_color_secondary_background
  set -U fish_pager_color_secondary_prefix
  set -U fish_pager_color_secondary_completion
  set -U fish_pager_color_secondary_description
  set -U fish_pager_color_selected_background --background=7E9CD8
  set -U fish_pager_color_selected_prefix 1F1F28
  set -U fish_pager_color_selected_completion 223249
  set -U fish_pager_color_selected_description 7FB4CA

  # remember current theme
  set -U base16_theme kanagawa

  # clean up
  functions -e put_template put_template_var put_template_custom
end
