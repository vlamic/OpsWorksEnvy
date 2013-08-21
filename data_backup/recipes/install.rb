script "install pip and mongoctl" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		pip install mongoctl
		mongoctl install-mongodb
	EOH
end
