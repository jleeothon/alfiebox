
task :listapp do
  sh "ps -C alfieapp -o pid="
end
