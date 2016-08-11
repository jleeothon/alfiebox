
task :psql do
  sh "su -l postgres -c psql"
end
