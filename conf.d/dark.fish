function dark
    argparse -i w/watch -- $argv
    set -l action $argv[1]

    switch $action
        case restart
            pkill -x dark >/dev/null 2>&1
    end

    if set -q _flag_watch
        nohup lockf -t 0 $TMPDIR/dark.lock fish -P -c '
            command dark -w | while read -l mode
                emit apple_interface_theme_changed $mode
            end
        ' >/dev/null 2>&1 &
        disown
    else
        command dark
    end
end

dark -w
