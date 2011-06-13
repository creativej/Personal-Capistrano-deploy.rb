# replace these with your server's information
set :domain, "creativej.me"
set :user, "root"

# name this the same thing as the directory on your server
set :application, "6thsensedesign.com"

# use your local repository as the source
set :repository, "file://#{File.expand_path('.')}"

# or use a hosted repository
set :repository, "ssh://git-creativej@pl3.projectlocker.com:6thsensedesign.git"

server "#{domain}", :app, :web, :db, :primary => true

set :deploy_via, :copy
set :copy_exclude, [".git", ".DS_Store"]
set :scm, :git
set :branch, "master"

set :app_root, "/var/www/vhosts/creativej.me/"

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
		run "cd #{deploy_to}; git pull --rebase"
	end
end

# my custom setup very simple
namespace :my_setup do
	desc <<-DESC
	Setup repository at live server
	DESC

	task :default do
		run "git clone #{repository} #{deploy_to}"
	end
end