OpsWorksEnvy
==================

Set environment variables for your environment and Node.js OpsWorks project.

You can do 2 things:
* Sets environment variables for machine
	* To make it work specify your variables, enable Custom Chef Recipes and include "environment_variables::configure" recipe to the "configure" section of your application layer
* Sets environment variables for Node.js process
	* Same as above, but no need to include custom recipe's; Default OpsWorks monitrc file will be overwritten and environment variables will be passed to Node.js process

To set environment variables specify custom Chef JSON with required key/value pairs.

E.g. 
```json
{
  "environment_variables": {
    "NODE_ENV": "production"
  },
  "deploy": { 
    "app_name": {
      "environment_variables": {
        "NODE_ENV": "production",
        "ENV_1": "value_of_env_1",
        "ENV_2": "value_of_env_2"
      }
    }
  }
}
```

In JSON above first "environment_variables" sets environment variables for machine (user root).
The section "environment_variables" under "deploy" specifying environment variables for Node.js process which will be hit with "monit restart app_name".
