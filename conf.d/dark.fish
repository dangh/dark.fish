function dark -a action
    switch $action
        case restart
            pkill -x dark >/dev/null 2>&1
    end

    nohup lockf -t 0 $TMPDIR/dark.lock fish -P -c '
        command dark | while read -l mode
            emit apple_interface_theme_changed $mode
        end
    ' >/dev/null 2>&1 &
    disown
end

dark
