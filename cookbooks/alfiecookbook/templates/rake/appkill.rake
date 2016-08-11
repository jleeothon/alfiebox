
task :appkill do
  pids = `ps -C alfieapp -o pid=`
  pids.split("\n").each do |pid|
    sh "kill -9 #{pid}"
  end
end
