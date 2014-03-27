set :stage, :staging

role :app, %w{188.226.217.39:2752}
role :web, %w{188.226.217.39:2752}
role :db,  %w{188.226.217.39:2752}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '188.226.217.39:2752', user: 'deploy', roles: %w{web app db}

set :deploy_to, "/home/deploy/wisemonkeys/staging"

set :rails_env, 'staging'       # If the environment differs from the stage name
set :branch, 'staging'