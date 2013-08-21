Chef::Log.info("Creating sample configuration mongodb file")

FileUtils.mkdir("/root/.mongoctl")

template "/root/.mongoctl/mongoctl.config" do
	source "mongoctl.config.erb"
	mode "0440"
	owner "root"
	group "root"
end

Chef::Log.info("Installing mongoctl and mongodb")
script "install pip and mongoctl" do
	interpreter "bash"
	user "root"
	cwd "/tmp"
	code <<-EOH
		pip install mongoctl
		mongoctl install-mongodb
	EOH
end
