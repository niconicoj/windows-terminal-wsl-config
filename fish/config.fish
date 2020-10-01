if status is-interactive
and not set -q TMUX
    exec tmux
end

set PATH $HOME/.cargo/bin $PATH
set -gx PULSE_SERVER tcp:(grep nameserver /etc/resolv.conf | awk '{print $2}')
set -gx EDITOR vim

if not pgrep -f spotifyd > /dev/null
    command spotifyd > /dev/null
end
