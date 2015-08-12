# DocumentRoot RedHat:/var/www/html debian:/var/wwww
default['apache']['DocumentRoot'] = "/var/www/html"
default['apache']['Port'] = 80
default['apache']['User'] = "apache"
default['apache']['Group'] = "apache"
default['apache']['ServerName'] = "localhost:80"
default['apache']['ServerAdmin'] = "webmaster@example.co.jp"

# apache2.2までの設定
# default['apache']['HostnameLookups'] = "off"
# default['apache']['EnableSendfile'] = "off"
# default['apache']['addtext']= ''