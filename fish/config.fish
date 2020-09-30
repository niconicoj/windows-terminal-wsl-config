if status is-interactive
and not set -q TMUX
    exec tmux
end

set PATH $HOME/.cargo/bin $PATH
set -gx PULSE_SERVER tcp:(grep nameserver /etc/resolv.conf | awk '{print $2}')

if not pgrep -f spotifyd > /dev/null
    command spotifyd > /dev/null
end
