
task :runapp do
  sh <<-end
  tail -f $HOME/alfieapp.log
  end
end
