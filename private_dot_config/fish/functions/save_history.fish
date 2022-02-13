# sync history across all fish instances
function save_history --on-event fish_preexec
  history --save
end
