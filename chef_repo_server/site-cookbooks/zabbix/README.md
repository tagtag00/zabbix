
zabbix Cookbook
===============

NOTE
----
日本語化をするときは、
zabbix::web_io_installを実行後
# 手動で/usr/share/zabbix/include/defines.inc.phpの下記の３行を修正
# define('ZBX_FONTPATH', '/usr/share/fonts/ipa-pgothic'); // where to search for font (GD > 2.0.18)
# define('ZBX_GRAPH_FONT_NAME', 'ipagp'); // font file name
# define('ZBX_FONT_NAME', 'ipagp');
# 
# httpdとzabbix-serverをrestart

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
