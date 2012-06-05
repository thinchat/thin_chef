package "git-core"

include_recipe "rbenv::system"

group "admin" do
  gid 999
end

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  shell "/bin/bash"
  supports manage_home: true
end

rbenv_global "1.9.3-p194"