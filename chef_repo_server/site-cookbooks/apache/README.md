
apache Cookbook
===============

Usage
-----
#### apache_setup::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `apache_setup` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[apache::install]"
  ]
}
```
☆ apache::install
- YUM等のパッケージ管理ツールを利用
- debian系のコンフィグは未設定