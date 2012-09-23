---
layout: post
title: "Install Redmine 2.1.0 on Ubuntu Server 12.04 64bit"
date: 2012-09-23 16:30
comments: true
categories: [lean, continuous delivery, continuous integration, redmine, ubuntu, team]
---
We have been using Redmine for issue tracking and wiki since 2010. Thanks to wiki, everyone is able to access and share information. Major topics are:

  * How to create a new developer environment?
  * Rules and conventions: continuous delivery, version number syntax, CI job configuration, coding style, creating specification, etc.
  * SCM description: how to perform a build and deployment.
  * Runtime environments' data (test, CI, production, DVCS).

We don't share constant information over email. If this information isn't in our wiki, then
> We write it into the wiki, and share wiki page.

__Wiki helps you to eliminate waste!__ Let's see the installation process!
<!--more-->
{% codeblock %}
sudo su -
{% endcodeblock %}

### Install LAMP server
{% codeblock %}
tasksel install lamp-server
{% endcodeblock %}
Set mysql root password, you need it later! [_ref. MYSQL_ROOT_PASSWORD_]

### Install infrastructure
{% codeblock %}
apt-get install ruby-full libmysqlclient-dev libmagickwand-dev libapache2-mod-passenger
{% endcodeblock %}

Note: After this operation, 306 MB of additional disk space will be used.

### Install Redmine 2.1.0

{% codeblock Create Redmine database %}
# You need MYSQL_ROOT_PASSWORD!
mysql -u root -p
create database redmine character set utf8;
create user 'redmine'@'localhost' identified by 'REDMINEDB_PASSWORD';
grant all privileges on redmine.* to 'redmine'@'localhost';
exit
{% endcodeblock %}
You need _REDMINEDB_PASSWORD_ later!

{% codeblock Download Redmine %}
wget http://rubyforge.org/frs/download.php/76448/redmine-2.1.0.tar.gz
tar xzvf redmine-2.1.0.tar.gz
mv redmine-2.1.0 redmine
mv redmine /var/www/redmine
{% endcodeblock %}

### Configure Redmine 2.1.0
{% codeblock %}
cd /var/www/redmine
cp config/database.yml.example config/database.yml
{% endcodeblock %}

{% codeblock Settings Redmine Edit database.yml %}
production:
adapter:        mysql
database:       redmine
host:           localhost
username:       redmine
password:       REDMINEDB_PASSWORD
{% endcodeblock %}

{% codeblock Install Rake %}
apt-get install rake
apt-get install ruby-bundler
{% endcodeblock %}

The next step will take a while (about 2 minutes):

{% codeblock Install Rake %}
cd config
bundle install --without development test postgresql sqlite
{% endcodeblock %}
You must get _"Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed."_
{% codeblock %}
rake generate_secret_token
{% endcodeblock %}

{% codeblock Initialize Redmine lang:ruby %}
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake redmine:load_default_data
{% endcodeblock %}

### Settings Apache
{% codeblock Edit /etc/apache2/mods-available/passenger.conf lang:apache %}
PassengerDefaultUser www-database
{% endcodeblock %}

{% codeblock Edit /etc/apache2/sites-available/default lang:apache %}
# Overwrite Document root
DocumentRoot /var/www/redmine/public
# Add Directory element
<Directory /var/www/redmine>
  RailsBaseURI /redmine
</Directory>
{% endcodeblock %}

{% codeblock Set permissions and restart apache2 %}
a2enmod passenger
cd /var/www
mkdir redmine/public/plugin_assets
chown -R www-data:www-data redmine/
chmod -R 755 redmine/
chmod -R 777 redmine/public/plugin_assets
chmod -R 777 redmine/files
service apache2 restart
{% endcodeblock %}

After all you get an ugly message: _apache2: "Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName"_

{% codeblock Set server's FQ name, edit /etc/apache2/httpd.conf lang:apache %}
# Change 'localhost' to real server name
ServerName YOUR_REAL_SERVER_NAME
{% endcodeblock %}

{% codeblock Restart apache %}
service apache2 restart
{% endcodeblock %}

Navigate browser to redmine server address, and redmine login page will be shown.
> Change default admin/admin user's password!!!

__Do not forget__ Redmine host name settings after login: Click _Setting,_ choose _General Tab_ and set _Host name and path_ to YOUR_REAL_SERVER_NAME

## Conclusion
{%img left /images/post/redmine1.png Redmine %}
All company must have a central knowledge base that easily access by team members. Use Redmine wiki to share __same information__ to everyone and everywhere! __Wiki helps you to eliminate waste!__


