信息: 至少有一个JAR被扫描用于TLD但尚未包含TLD。 为此记录器启用调试日志记录，以获取已扫描但未在其中找到TLD的完整JAR列表。 在扫描期间跳过不需要的JAR可以缩短启动时间和JSP编译时间。  
五月 25, 2024 10:06:13 下午 org.apache.catalina.core.StandardContext listenerStart  
严重: 配置应用程序监听器[org.springframework.web.context.ContextLoaderListener]错误  
java.lang.ClassNotFoundException: org.springframework.web.context.ContextLoaderListener  
at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1338)  
at org.apache.catalina.loader.WebappClassLoaderBase.loadClass(WebappClassLoaderBase.java:1150)  
at org.apache.catalina.core.DefaultInstanceManager.loadClass(DefaultInstanceManager.java:487)  
at org.apache.catalina.core.DefaultInstanceManager.loadClassMaybePrivileged(DefaultInstanceManager.java:469)  
at org.apache.catalina.core.DefaultInstanceManager.newInstance(DefaultInstanceManager.java:142)  
at org.apache.catalina.core.StandardContext.listenerStart(StandardContext.java:4368)  
at org.apache.catalina.core.StandardContext.startInternal(StandardContext.java:4899)  
at org.apache.catalina.util.LifecycleBase.start(LifecycleBase.java:171)  
at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1364)  
at org.apache.catalina.core.ContainerBase$StartChild.call(ContainerBase.java:1354)  
at java.util.concurrent.FutureTask.run(FutureTask.java:266)  
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)  
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)  
at java.lang.Thread.run(Thread.java:745)