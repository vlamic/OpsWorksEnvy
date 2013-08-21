Chef::Log.info("Configuring NPM")

Chef::Log.info("Creating shell file to set npm variables")
template "/usr/local/bin/npm.sh" do
	source "npm.sh.erb"
	mode "0755"
	owner "root"
	group "root"
end

Chef::Log.info("Exporting npm variables for every new created process")
execute "/usr/local/bin/npm.sh" do
	user "root"
	action :run
end

