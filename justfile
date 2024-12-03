set shell := ["fish", "-c"]

compile PROJECT:
    ls **.tex | entr tectonic -X compile {{PROJECT}}

write-project PROJECT:
    tmux new -d -s {{PROJECT}} -n 'editor' 'hx {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Compilation" 'ls **.tex | entr tectonic -X compile {{PROJECT}}/main.tex'
    tmux new-window -t {{PROJECT}} -n "Zathura" 'zathura {{PROJECT}}/main.pdf'
    tmux new-window -t {{PROJECT}} -n "command line" 
    tmux attach

nushell-strategic-data-extract GNUPLOT_FILE: 
    #!/usr/bin/env nu
    fish -c "echo $(pwd)"
    let ordinator_log = open ../ordinator-api/logging/logs/ordinator.developer.log | from json -o
    fish -c "echo $(pwd)"
    let ordinator_strategic_data = $ordinator_log | each { |row| { time: ($row.timestamp | into datetime | format date '%s'), strategic_objective_value: $row.fields.strategic_objective_value?} } | where { |row| $row.strategic_objective_value != null}
    fish -c "echo $(pwd)"
    $ordinator_strategic_data | to csv | save gnuplot_data.csv 
    fish -c "echo $(pwd)"
    gnuplot -p gnuplot/{{GNUPLOT_FILE}}.gp
    fish -c "echo $(pwd)"
    rm gnuplot_data.csv
    fish -c "echo $(pwd)"
    mv {{GNUPLOT_FILE}}.tex papers/actor-based-large-neighborhood-search/figures/
    fish -c "echo $(pwd)"

    
    

