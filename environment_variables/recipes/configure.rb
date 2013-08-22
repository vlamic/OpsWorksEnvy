node[:deploy].each do |application, deploy|
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
