= Bash Interactive Menu
== A Simple Extensible Dashboard and Menu System written in Bash

You can place your own menu modules under: 

- ~/.bim/modules
- /etc/bim/modules
- /usr/share/bim/modules

All your menus can be connected to other menus. For example: to connect to the Dashboard you might use: 

declare -A dashboard_entry+=(
   ["Say Hello World"]="echo Hello World"
   ["ls -l"]="ls -l"
)

declare -A dashboard_enable+=()

declare -A dashboard_reply+=(
   ["esc"]="echo got seq esc"
)

declare -A dashboard_reply_help+=(
   ["esc"]="echo got seq esc"
)

