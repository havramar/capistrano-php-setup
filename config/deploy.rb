lock '3.2.1'

set :application, 'app_name'
set :repo_url, 'git@github.com:havramar/capistrano-php-setup.git'


# Assuming that composer.phar is in the repository,
# otherwise setup according to docs: https://github.com/capistrano/composer#configuration
# SSHKit.config.command_map[:composer] = "php composer.phar"

# Must postpone assigning shared_path as its value is set later in env config file.
# See: http://capistranorb.com/documentation/faq/how-can-i-access-stage-configuration-variables/
task :lazy_load_composer_path do
  SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"
end

namespace :deploy do
  before :starting, :lazy_load_composer_path
  before :starting, 'composer:install_executable'
end

# new relic
require_relative './credentials.rb'
after "deploy:updated", "newrelic:notice_deployment"
