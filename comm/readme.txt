//=====================================================================
//项目名:SSM_Framework
//制作者:KamiJ
//版本:v2.0.0.20160709
//说明:SSM（spring+spring-mvc+mybatis）的框架工程，提供搭建B/S架构MIS系统的最小工程，用户根据自身情况实现各类功能
//=====================================================================

//更新日志==============================================================
1、更改包名为cn；
2、更改database文件夹为SQL；
3、更改了上层工程的结构；
4、新添了对静态文件的支持；
5、重做了T_User表；
6、实现了简单的登录、退出以及登录过滤器验证；
//=====================================================================

//使用说明=============================================================
1、安装jdk 1.8.0_77（java开发工具）
2、安装eclipse（集成开发环境）
3、安装tomcat8.0.35（网页服务器）
4、eclipse中window-preference-Server-Runtime Environments中添加Apache Tomcat v8.0并配置正确Tomcat8.0文件夹地址（配置网页服务器）
5、eclipse中window-preference-Web-JSP Files中Encoding更改为UTF-8（解决网页编码问题，如中文显示乱码）
6、eclipse中导入SSM_Framework并开始工作
注:
*若未创建过Maven项目，pom.xml会报错，则可以直接用提供的repository替换掉C盘-用户-<自己的用户名>-.m2文件夹中的repository，或者创建一个Maven web app项目，自动联网下载所需jar包，若缺少jdbc4包，则可以自己将jdbc4.jar添加到相应目录下。
*若JRE版本与实际安装的版本不一致，则右键项目名—>properties—>java build path—>libraries，选择JRE System Library，点击Edit，更改合适版本。
//=====================================================================

//项目中各文件说明======================================================
1:Deployment Descriptor:对网页项目的描述
2:Java Resources:项目中Java资源（后端工作地址）
	2.1:src/main/java:存放java包的文件夹（在此处添加各类java类以及接口）
		2.1.1:cn.kamij.ssm.controller:存放controller（控制器）类的包
		2.1.2:cn.kamij.ssm.mapper:存放mapper类的包（可自动生成，见7）
			2.1.2.1:*.java:数据库所提供的功能接口
			2.1.2.2:*.xml:数据库与java的映射配置
		2.1.3:cn.kamij.ssm.model:存放model（对应数据库中的表或者视图）类的包（可自动生成，见7）
		2.1.4:cn.kamij.ssm.service:通过数据库接口所生成的各种网页所需服务功能的接口
		2.1.5:cn.kamij.ssm.service.impl:实现2.1.4的服务
		2.1.6:cn.kamij.ssm.filter:存放过滤器类的包
	2.2:src/main/resources:存放配置文件的文件夹
		2.2.1:jdbc.properties:所使用数据库资源的配置（需要根据自己情况更改）
				2.2.1.1:driver:数据库驱动类型
				2.2.1.2:url:数据库url地址，对应driver类型
				2.2.1.3:username:该数据库登陆名
				2.2.1.4:password:该数据库登陆密码（以下可省略）
				2.2.1.5:initialSize:初始化连接大小
				2.2.1.6:maxActive:连接池最大数量
				2.2.1.7:maxIdle:连接池最大空闲
				2.2.1.8:minIdle:连接池最小空闲
				2.2.1.9:maxWait:获取连接最大等待时间
		2.2.2:log4j.properties:生成log文件的配置（在控制台调试用，可无视）
		2.2.3:spring-mvc.xml:spring-mvc的配置文件，用于自动扫描控制器，视图模式，注解的启动（需要根据自己包的情况更改路径）
		2.2.4:spring-mybatis.xml:完成spring和mybatis的整合，用于自动扫描，自动注入，配置数据库（需要根据自己包的情况更改路径）
	2.3:src/test/java:存放控制台执行的用于测试服务功能的java文件夹
		2.3.1:cn.kamij.ssm.test:存放控制台执行的用于测试服务功能的类的包
	2.4:Libraries:java程序所依赖的各类包
		2.4.1:JRE 系统库（可以在项目的properties（属性）-Java Build Path（Java构建路径）中更改配置）
		2.4.2:Maven Dependecies:Maven（一种项目构建工具，可以自动联网下载jar包）所生成的依赖库，可以在pom.xml中配置
3:JavaScript Resources:项目中JavaScript资源（可无视）
4:Deployed Resources:项目中网页资源（前端工作地址）
	4.1:webapp:存放网页上各类应用的文件夹
		4.1.1:WEB-INF:存放网页信息的文件夹
			4.1.1.1:jsp:存放所有jsp（每个文件都可以理解为一个网页）的文件夹（在此处添加各类网页）
			4.1.1.2:web.xml:网页的配置文件，可以在<welcome-file-list>中添加初始页面
		4.1.2:index.jsp:默认的初始页面（例:http://localhost:8080/SSM_Framework 即会显示该页面）
		4.1.3:STATIC:存放静态资源的文件夹
			4.1.3.1:css：存放css的文件夹
			4.1.3.2:fonts:存放fonts的文件夹
			4.1.3.3:img:存放图片的文件夹
			4.1.3.4:js:存放js的文件夹
	4.2:web-resources:存放网页上的资源的文件夹（可无视）
5:SQL:存放数据库SQL语句的文件夹
6:logs:由log4j生成的控制台日志文件的文件夹
7:mybatis-generator-core-1.3.2:自动生成实体类（model）、MyBatis映射文件以及DAO接口（mapper）的应用，具体见文件夹中的readme.txt
8:src:由2、3、4所生成的实际保存在文件夹中的各类资源
9:target:存放项目构建后的文件和目录，jar包、war包、编译的class文件等（由Maven构建生成）
10:pom.xml:用于管理：源代码、配置文件、开发者的信息和角色、问题追踪系统、组织信息、项目授权、项目的url、项目的依赖关系等等（在这里配置Maven所依赖的jar包）
//=====================================================================

//使用流程=============================================================
1、构思所要实现的功能
2、构建E-R图，转换成相应关系模式，并分解达到BCNF
3、在数据库中生成各种表、视图
4、在该项目中完成各类配置（pom.xml;jdbc.properties;spring-mvc.xml;spring-mybatis.xml;web.xml）
5、完成model和mapper（使用mybatis-generator-core-1.3.2自动生成）
6、完成service（应用mapper所完成的提供给controller的功能，可在test中测试一下功能）
7、完成controller（对url地址的控制以及提供给网页的资源）
8、完成jsp（运用controller提供资源完成网页）
9、右键项目，运行方式-run on server，选择Tomcat v8.0 Server，完成
注：数据流：数据库中产生的表、视图通过mybatis映射到java中，在java中完成功能后通过spring-mvc在网页服务器上运行
//=====================================================================

//参考=================================================================
http://blog.csdn.net/gebitan505/article/details/44455235
//=====================================================================
