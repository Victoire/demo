# Capifony documentation: http://capifony.org
# Capistrano documentation: https://github.com/capistrano/capistrano/wiki

# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL

set :application, "appventus.com"

set :scm,         :git
set :repository,  "ssh://git@stash.appventus.com:7999/app/appventus.com.git"
set :deploy_via,  :remote_cache

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :use_composer,   true
set :update_vendors, false
set :composer_options, "--verbose --prefer-dist --optimize-autoloader"

set :writable_dirs,     ["var/cache", "var/logs", "web/uploads"]
set :webserver_user,    "www-data"
set :permission_method, :acl
set :use_set_permissions, true

set :shared_files,    ["app/config/parameters.yml", "web/.htaccess", "web/robots.txt"]
set :shared_children, ["var/logs", "web/uploads", "app/sessions", "web/data", "web/wp-content"]

set :dump_assetic_assets, true
set :model_manager, "doctrine"

set :use_sudo,    false
set :symfony_env, 'prod'
set :symfony_console, "bin/console"

set :keep_releases, 3

# desc "Deploy to production"
# task :prod do
    set :domain,      "appventus.com"
    set :deploy_to,   "/var/www/appventus/appventus.com"
    set :user,        "nimba"
    set :branch,      "develop"
    set :deploy_via,  :remote_cache

    role :web,        domain
    role :app,        domain, :primary => true
    role :db,         domain, :primary => true
# end

namespace :apache do
  [:stop, :start, :restart, :reload].each do |action|
    desc "#{action.to_s.capitalize} Apache"
    task action, :roles => :web do
      capifony_pretty_print "--> #{action.to_s.capitalize} Apache"

      run "#{sudo} /etc/init.d/apache2 #{action.to_s}"
      capifony_puts_ok
    end
  end
end

namespace :victoire do
    desc "(re)generate victoire views"
    task :generate_views do
        capifony_pretty_print "--> (re)generate victoire views"

        run "cd #{latest_release} && php bin/console victoire:generate:view --env=prod"
        capifony_puts_ok
    end
end

namespace :bower do
    desc "bower install"
    task :install do
        capifony_pretty_print "--> bower install"

        run "cd #{latest_release} && bower install --config.interactive=false"
        capifony_puts_ok
    end
end

before "deploy:finalize_update", "bower:install"

after 'deploy' do
    symfony.doctrine.schema.update
end

after "deploy", "deploy:web:disable"
after "deploy", "victoire:generate_views"
after "deploy", "deploy:set_permissions"
after "deploy", "apache:reload"
after "deploy", "deploy:web:enable"
after "deploy", "deploy:cleanup"