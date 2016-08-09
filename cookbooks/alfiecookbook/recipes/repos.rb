
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
  ["cortoproject", "corto", "0044adadf8e504128ff98a475e4a9e0e21844a71"],
  ["cortoproject", "c-binding", "0de7d81901ccd77a18f54f4742853f1f2ef8e22a"],
  ["cortoproject", "xml", "85bc8aa8f75c6a33bd47862b6df8efe51264703a"],
  ["cortoproject", "corto-language", "d857d7d0e43136a074ae3036dc546548bdc1612c"],
  ["cortoproject", "io", "9bec7a136f82f7a9ade8e7e17d5a9bdf5dda226c"],
  ["cortoproject", "cortodoc", "a9f9f38e96908e23ab0fa8f051eaf02847b21136"],
  ["cortoproject", "test", "6904a482b259d599f15c6228303ca00a568ee258"],
  ["cortoproject", "json", "0045469acf4102ea1ba2e3ed7b60eacb95d4a9c0"],
  ["cortoproject", "web", "0e7c37e0785df2d99717a2c1fb3fab5f59f0c93a"],
  ["cortoproject", "postgresql", "28c36c2e13387f96904a8edc59da00eaf2f63940"],
  ["jleeothon", "corto-jinja", "ea839f5a0f0820743145fbb64cc776777c324ab2"],
]

corto_repos.each do |repo|
  git "#{alfieproject}/#{repo[1]}" do
    repository "https://github.com/#{repo[0]}/#{repo[1]}"
    action :checkout
    user "vagrant"
    revision repo[2]
  end
end

template "#{alfieproject}/rakefile" do
  source "rakefile"
  owner "vagrant"
end
