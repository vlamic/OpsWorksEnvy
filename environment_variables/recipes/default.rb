Chef::Log.info("Setting environment variables")

Chef::Log.info("Setting environment variables for current process")
node[:environment_variables].each do |name, value|
	ENV["#{name}"] = "#{value}"
end

Chef::Log.info("Writing variables to /etc/environment to have them after restart")
template "/etc/environment" do
	source "environment.erb"
	mode "0644"
	owner "root"
	group "root"
	variables({
		:environment_variables => node[:environment_variables]
	})
end

Chef::Log.info("Creating shell file to export variables")
template "/usr/local/bin/environment.sh" do
	source "environment.sh.erb"
	mode "0755"
	owner "root"
	group "root"
end

Chef::Log.info("Exporting variables for every new created process")
execute "/usr/local/bin/environment.sh" do
	user "root"
	action :run
end

