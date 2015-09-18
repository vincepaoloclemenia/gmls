set :rails_env, :staging
set :branch, :staging
set :deploy_to, '/home/gmls-beta'
set :user, 'gmls-beta'
set :nginx_server_name, 'gmls-beta.cloudapp.net'
# set :default_env, { 'SECRET_KEY_BASE' => '6277cfb7ba35b74cc7b4e617c65d0288898f8cf7152b2c5a72c19397801d8030db8952aeaf6320bd31c10da478583d937160d378652fb9143f0edd1d66a549c5' } 
set :linked_files, %w[config/database.yml tmp/pids/unicorn.pid log/unicorn.log]
# set :linked_dirs, %w{ public/paperclip }

server 'gmls-beta.cloudapp.net', user: 'gmls-beta', roles: %w[web app]


set :ssh_options, {
  #keys: ["/Users/ken/.ssh/erfrsUser.key"],
  # auth_methods: %w[publickey],
  forward_agent: true
}

