script "install pip and mongoctl" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		sudo apt-get install python-pip -y &&
		sudo pip install mongoctl &&
		mongoctl install
	EOH
end
