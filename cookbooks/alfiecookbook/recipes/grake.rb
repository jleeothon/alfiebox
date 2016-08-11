
rakefiles = %w(applist.rake appkill.rake psql.rake apprun.rake)

HOME = Dir.home("vagrant")

directory "#{HOME}/.rake"

rakefiles.each do |f|
  template "#{HOME}/.rake/#{f}" do
    source "rake/#{f}"
    owner "vagrant"
  end
end
