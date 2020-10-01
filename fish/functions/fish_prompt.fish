function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char 'λ'
    end
  end

  # Setup colors
  #use extended color pallete if available
#if [[ $terminfo[colors] -ge 256 ]]; then
#    turquoise="%F{81}"
#    orange="%F{166}"
#    purple="%F{135}"
#    hotpink="%F{161}"
#    limegreen="%F{118}"
#else
#    turquoise="%F{cyan}"
#    orange="%F{yellow}"
#    purple="%F{magenta}"
#    hotpink="%F{red}"
#    limegreen="%F{green}"
#fi
  set -l normal (set_color normal)
  set -l white (set_color white)
  set -l turquoise (set_color cyan)
  set -l orange (set_color magenta)
  set -l hotpink (set_color green)
  set -l blue (set_color blue)
  set -l limegreen (set_color yellow)
  set -l purple (set_color green)
 
  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color cyan
  set -g __fish_git_prompt_color_flags red
  set -g __fish_git_prompt_color_prefix cyan
  set -g __fish_git_prompt_color_suffix cyan
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 

  set -l current_user (whoami)

  # Line 1
  echo -n $white'╭─'$hotpink$current_user$white' at '$orange$__fish_prompt_hostname$white' in '$limegreen(pwd|sed "s=$HOME=~=")$turquoise
  __fish_git_prompt " (%s)"
  echo

  # Line 2
  echo -n $white'╰'
  # support for virtual env name
  if set -q VIRTUAL_ENV
      echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
  end
  echo -n $white'─'$__fish_prompt_char $normal
end

