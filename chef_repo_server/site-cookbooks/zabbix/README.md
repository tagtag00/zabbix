
zabbix Cookbook
===============

NOTE
----
☆日本語化をするときは、
zabbix::web_io_installを実行後
# 手動で/usr/share/zabbix/include/defines.inc.phpの下記の３行を修正
# define('ZBX_FONTPATH', '/usr/share/fonts/ipa-pgothic'); // where to search for font (GD > 2.0.18)
# define('ZBX_GRAPH_FONT_NAME', 'ipagp'); // font file name
# define('ZBX_FONT_NAME', 'ipagp');
# 
# httpdとzabbix-serverをrestart

☆smtpによるメール送信設定
zabbix::mail_settingを実行後
/var/lib/zabbixsrv/alertscripts/sendmessage_smtp_php/sendmessage_smtp_php.sh に設定値を書き込みます
$MAIL_FROM = "zabbix@localhost";  
                          「zabbix@localhost」の箇所に送信元にするメールアドレスを記述
$MAIL_FROMNAME = "Zabbix 障害通知"; 
                          「Zabbix 障害通知」の箇所に送信元の表示名を記述
$MAIL_SMTP_HOST = 'smtp.example.com:25'; 
                          「smtp.example.com:25」の箇所に「SMTPサーバ:ポート」の形式で記述
$MAIL_SMTP_USER = 'XXXXXXXX';
                            XXXXXXXX の箇所にユーザ名を記述
$MAIL_SMTP_PASS = 'XXXXXXXX';
                            XXXXXXXX の箇所にパスワードを記述

カスタムスクリプトの登録

設置した sendmessage_smtp_php/sendmessage_smtp_php.sh をカスタムスクリプトに登録します

[管理] → [メディアタイプ]をクリックします
右上の「メディアタイプの作成」をクリックします
次のように設定し、「保存」をクリックします
設定項目  設定値
Description sendmessage_smtp_php.sh
Type  Script
Script name sendmessage_smtp_php/sendmessage_smtp_php.sh
ユーザのメディア設定に登録

先に登録したカスタムスクリプトをユーザのMediaに登録します。

[管理] → [ユーザ]をクリックします
リストからカスタムスクリプトを登録したいユーザをクリックします
Media設定の「追加」をクリックします
次のように設定し、「追加」をクリックします
設定項目  設定値
Type  sendmessage_smtp_php.sh
Send to 送信先メールアドレス
「保存」をクリックします

Usage
-----
#### zabbix::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `zabbix` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[zabbix::install]"
  ]
}
```
