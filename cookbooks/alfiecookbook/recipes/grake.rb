
rakefiles = %w(listapp.rake killapp.rake psql.rake runapp.rake)

HOME = Dir.home("vagrant")

directory "#{HOME}/.rake"

rakefiles.each do |f|
  template "#{HOME}/.rake/#{f}" do
    source "rake/#{f}"
    owner "vagrant"
  end
end
