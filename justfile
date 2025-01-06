set shell := ["fish", "-c"]

compile PROJECT:
    ls **.tex | entr tectonic -X compile {{PROJECT}}

write-project PROJECT:
    tmux new -d -s {{PROJECT}} -n 'editor' 'hx {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Compilation" 'ls **.tex | entr tectonic -X compile {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Zathura" 'zathura {{PROJECT}}/main.pdf'
    tmux new-window -t {{PROJECT}} -n "command line" 
    tmux attach

nushell-strategic-data-extract GNUPLOT_OUTPUT_FILE: 
    #!/usr/bin/env nu
    echo hello 0
    let ordinator_log = open ../ordinator-api/logging/logs/ordinator.developer.log | from json -o
    # let ordinator_strategic_data = $ordinator_log | each { |row| { time: ($row.timestamp | into datetime | format date '%s'), strategic_objective_value: $row.fields.strategic_objective_value?} } | where { |row| $row.strategic_objective_value != null}
    let ordinator_strategic_data = $ordinator_log | each { |row| { time: ($row.timestamp | into datetime | format date '%s'), strategic_urgency: $row.fields.strategic_urgency?, strategic_resource_penalty: $row.fields.strategic_resource_penalty?} } | where { |row| $row.strategic_urgency != null}
    $ordinator_strategic_data | to csv | save --force gnuplot_data.csv 
    $ordinator_strategic_data | length | print
    gnuplot -e "set output '{{GNUPLOT_OUTPUT_FILE}}'" -p gnuplot/strategic_objective_value.gp
    rm gnuplot_data.csv
    mv {{GNUPLOT_OUTPUT_FILE}} papers/actor-based-large-neighborhood-search/figures/
    echo hello 7

    
    

