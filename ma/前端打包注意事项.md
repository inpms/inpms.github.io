

```
1、删除掉package-lock.json
2，确保node是V18版本
3，更换新的npm淘宝源：npm config set registry https://registry.npmmirror.com/
4,使用npm命令：npm install --legacy-peer-deps
```

1、安卓打包，注意gradle要用6.7.1版本版本不一致就会有问题

2、Ios打包，先编译在打包，调试需要连接真机，测试发布testflight
