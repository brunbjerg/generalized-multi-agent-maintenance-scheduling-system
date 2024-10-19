set shell := ["fish", "-c"]

write-project PROJECT:
    tmux new -d -s {{PROJECT}} -n 'editor' 'hx {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Compilation" 'ls **.tex | entr tectonic -X compile {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Zathura" 'zathura {{PROJECT}}/main.pdf'
    tmux new-window -t {{PROJECT}} -n "command line" 
    tmux attach

