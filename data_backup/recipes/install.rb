script "install pip and mongoctl" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py &&
		sudo python get-pip.py &&
		sudo pip install mongoctl
	EOH
end
