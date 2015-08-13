devtools_install Cookbook
==========================
TODO: Enter the cookbook description here.

Note
-----
2015/8/13 CentOS 6.5 において"Development Tools"のgroupinstallでエラーが発生
>>
Error: Package: systemtap-devel-2.7-2.el6.x86_64 (base)
           Requires: kernel-devel
 You could try using --skip-broken to work around the problem
 You could try running: rpm -Va --nofiles --nodiges
<<

Usage
-----
#### devtools_install::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `devtools_install` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[devtools_install]"
  ]
}
```

License and Authors
-------------------
Authors: TODO: List authors
