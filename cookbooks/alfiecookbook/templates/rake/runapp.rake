
task :runapp do
  sh <<-end
  nohup corto run alfieapp >> $HOME/alfieapp.log 2>&1 &
  end
end
