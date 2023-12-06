$sessionName = "main";

#create tmux session
write-host("create tmux session: $sessionName");
tmux new -d -s $sessionName 'pwsh';

#rename current window
tmux rename-window -t $sessionName 'work';

#some settings
tmux setw -g mode-keys vi

#create new window(s)
#######monitor
$window = "monitor"
write-host("create window: $window")
#create new window
tmux new-window -t $sessionName -n $window;

#start btop
tmux send-keys -t $sessionName 'btop' C-m;

#split window
tmux split-window -t $sessionName -h;

#start dry (container management tool)
tmux send-keys -t $sessionName 'docker start -ai dry' C-m;
start-sleep -seconds 5;
tmux send-key -t $sessionName F2;

#split window again
tmux split-window -t $sessionName -v -l 40%;


#######ikabot
$window = "ikabot"
write-host("create window: $window");

#create new window and start ikabot as container
tmux  new-window -t $sessionName -n $window;
tmux send-keys -t $sessionName 'docker start -ai hardcore_albattani' C-m;

#output
write-host("use this command to connect to the created session:`ntmux attach -t $sessionName");

#attach session
#tmux attach -t $sessionName
 
