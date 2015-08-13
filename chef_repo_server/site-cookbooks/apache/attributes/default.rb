# DocumentRoot RedHat:/var/www/html debian:/var/wwww
#
# httpd.confの設定情報
#
default['apache']['ServerAdmin'] = "webmaster@example.co.jp"
default['apache']['ServerName'] = "localhost"
default['apache']['DocumentRoot'] = "/var/www/html"
default['apache']['Port'] = "80"
default['apache']['User'] = "apache"
default['apache']['Group'] = "apache"
# 下記はそう変更することが少ない項目
default['apache']['ServerTokens'] = "Prod"
default['apache']['KeepAlive'] = "On"
default['apache']['HostnameLookups'] = "off"
default['apache']['EnableSendfile'] = "off"
