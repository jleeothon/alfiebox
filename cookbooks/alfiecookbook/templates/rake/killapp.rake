
task :killapp do
  sh "killall alfieapp -u `whoami`"
end
