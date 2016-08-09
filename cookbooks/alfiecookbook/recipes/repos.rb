
HOME = Dir.home("vagrant")

alfieproject = "#{HOME}/alfieproject"
directory alfieproject do
  owner "vagrant"
end

directory "#{HOME}/cortoproject" do
    action :delete
    recursive true
end

corto_repos = [
  ["cortoproject", "corto"],
  ["cortoproject", "c-binding"],
  ["cortoproject", "xml"],
  ["cortoproject", "corto-language"],
  ["cortoproject", "io"],
  ["cortoproject", "cortodoc"],
  ["cortoproject", "test"],
  ["cortoproject", "json"],
  ["cortoproject", "web"],
  # Figure out how to clone private repos later
  # ["jleeothon", "alfie"],
  # ["jleeothon", "alfieapp"],
]

corto_repos.each do |repo|
  git "#{alfieproject}/#{repo[1]}" do
    repository "https://github.com/#{repo[0]}/#{repo[1]}"
    action :checkout
    user "vagrant"
  end
end

template "#{alfieproject}/rakefile" do
  source "rakefile"
  owner "vagrant"
end
