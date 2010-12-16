#/bin/bash 
sudo gem uninstall eco_apps_util
gem build eco_apps_util.gemspec
sudo gem install --no-rdoc --no-ri eco_apps_util-0.2.0.gem