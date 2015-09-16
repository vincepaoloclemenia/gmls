set :rails_env, :staging
set :branch, :staging
set :deploy_to, '/home/gmls'
set :user, :gmls
set :nginx_server_name, 'gmls.cloudapp.net'
# set :default_env, { 'SECRET_KEY_BASE' => '6277cfb7ba35b74cc7b4e617c65d0288898f8cf7152b2c5a72c19397801d8030db8952aeaf6320bd31c10da478583d937160d378652fb9143f0edd1d66a549c5' } 
set :linked_files, %w[config/database.yml tmp/pids/unicorn.pid log/unicorn.log]
# set :linked_dirs, %w{ public/paperclip }

server 'gmls.cloudapp.net', user: 'gmls', roles: %w[web app]


set :ssh_options, {
  #keys: ["/Users/ken/.ssh/erfrsUser.key"],
  auth_methods: %w[publickey],
  forward_agent: true
}

# gmls/@dminGMLS2015

# DNS Name: gmls.cloudapp.net
# Public virtual IP (VIP) address: 111.221.102.30
# Internal IP address: 100.73.124.99

# SSH details
# gmls.cloudapp.net : 22
# Size: Basic_A0 (shared core, 768 MB memory)
# SSH Certificate Thumbprint: 89219369b069fcc5d28d7aa9befaba57
# Location: Southeast Asia