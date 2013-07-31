node[:deploy].each do |application, deploy|
	if deploy[:application_type] != 'nodejs'
		Chef::Log.debug("Skipping deploy::nodejs application #{application} as it is not a node.js app")
		next
	end 

	node[:environment_variables].each do |name, value|
		ENV["#{name}"] = "#{value}"
	end

	template "/usr/local/bin/environment.sh" do
		source "environment.sh.erb"
		mode "0755"
	   	owner deploy[:user]
    	group deploy[:group]
	end

	execute "/usr/local/bin/environment.sh" do
		action :run
	end
end
