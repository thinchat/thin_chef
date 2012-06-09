include_recipe "apt"
package "git-core"
package "vim"

apt_repository "nginx-stable" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end

apt_repository "nginx-stable" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  shell "/bin/bash"
  supports :manage_home => true
end

gem_package "ruby-shadow" do
  action :install
  ignore_failure true
end
