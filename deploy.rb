server "#{domain}", :app, :web, :db, :primary => true

set :deploy_via, :copy
set :copy_exclude, [".git", ".DS_Store"]
set :scm, :git
set :branch, "master"

# set this path to be correct on yoru server
set :deploy_to, "#{app_root}#{application}"
set :use_sudo, false
set :keep_releases, 2
set :git_shallow_clone, 1
ssh_options[:paranoid] = false

# this tells capistrano what to do when you deploy
namespace :deploy do
	desc <<-DESC
	Deploying changes to live server
	DESC
	
	task :default do
		run "cd #{deploy_to}; git pull origin master"
	end
end

# my custom setup very simple
namespace :my_setup do
	desc <<-DESC
	Setup repository at live server
	DESC

	task :default do
		run "git clone #{repository_path} #{deploy_to}"
	end
end

namespace :whois do 
	desc <<-DESC
	Test capistrano
	DESC
	
	task :default do 
		run "jwhois --version"
	end
end 
