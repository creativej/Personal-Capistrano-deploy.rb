# replace these with your server's information
set :domain, "creativej.me"
set :user, "root"

# name this the same thing as the directory on your server
set :application, "test.com"

# use your local repository as the source
#set :repository, "file://#{File.expand_path('.')}"

# or use a hosted repository
set :repository_path, "git-creativej@pl3.projectlocker.com:6thsensedesign.git"
set :repository, "ssh://${repository_path}"

set :app_root, "/var/www/vhosts/creativej.me/"
