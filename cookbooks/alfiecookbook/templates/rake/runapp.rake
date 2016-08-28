
task :runapp do
  sh <<-end
  CORTO_VERBOSITY=TRACE nohup corto run alfieapp >> $HOME/alfieapp.log 2>&1 &
  end
end
