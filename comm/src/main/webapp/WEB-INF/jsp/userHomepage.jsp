<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Integer userId = (Integer) request.getSession().getAttribute("userId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 引入插件 -->
<link href="<%=path %>/STATIC/css/bootstrap.min.css" rel="stylesheet" />

<style type="text/css">
</style>

<script src="<%=path %>/STATIC/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path %>/STATIC/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<title>主页</title>
</head>
<body>
	<button type="button" class="btn btn-primary" id="quit">退出</button>

	编号：<%out.println(userId); %>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#quit").click(function(){
			$.ajax({
				type:"POST",					// http请求方式
				url:"<%=path %>/user/quit",	// 发送给服务器的url
				dataType:"json",				// 告诉JQUERY返回的数据格式
				complete : function(str) {
					window.location.href = "<%=path %>/user/login";
				}
			});
		});
	});
	</script>
</body>
</html>