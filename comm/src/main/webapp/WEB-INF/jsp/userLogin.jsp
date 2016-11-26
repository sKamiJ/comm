<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 获取相对路径和绝对路径 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 引入插件 -->
<link href="<%=path%>/STATIC/css/bootstrap.min.css" rel="stylesheet" />

<style type="text/css">
</style>

<script src="<%=path%>/STATIC/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/STATIC/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<title>登录</title>
</head>
<body>
	<!-- 登录面板 -->
	<div class="panel panel-default col-lg-4 col-lg-offset-4"
		style="margin-top: 20px;">

		<!-- 面板主体 -->
		<div class="panel-body">

			<center>
				<h3 style="margin: 20px 0;">请登录：（样例用户名：kamij；密码：123456）</h3>
			</center>

			<form id="userLoginForm" class="form-horizontal" action="doLogin"
				method="post">

				<!-- 用户名 -->
				<div class="form-group">
					<label class="col-lg-3 control-label">用户名：</label>
					<div class="col-lg-7">
						<div class="input-group">
							<input type="text" class="form-control" name="loginName"
								placeholder="请输入您的用户名" /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-user"></span>
							</span>
						</div>
					</div>
				</div>

				<!-- 密码 -->
				<div class="form-group">
					<label class="col-lg-3 control-label">密码：</label>
					<div class="col-lg-7">
						<div class="input-group">
							<input type="password" class="form-control" name="password"
								placeholder="请输入您的密码" /><span class="input-group-addon">
								<span class="glyphicon glyphicon-lock"></span>
							</span>
						</div>
					</div>
				</div>

				<!-- 提交 -->
				<div class="form-group">
					<div class="col-lg-4 col-lg-offset-8" style="padding-left: 32px;">
						<button type="submit" class="btn btn-primary">确定</button>
					</div>
				</div>
			</form>

		</div>

	</div>

	<object classid="clsid:648A5600-2C6E-101B-82B6-000000000014"
		id="MSComm1" codebase="C:\Windows\SysWOW64\mscomm32.OCX" type="application/x-oleobject"
		style="left: 54px; top: 14px">
		<param name="CommPort" value="3">
		<!--设置并返回通讯端口号。-->
		<param name="DTREnable" value="1">
		<param name="Handshaking" value="0">
		<param name="InBufferSize" value="1024">
		<param name="InputLen" value="0">
		<param name="NullDiscard" value="0">
		<param name="OutBufferSize" value="512">
		<param name="ParityReplace" value="?">
		<param name="RThreshold" value="1">
		<param name="RTSEnable" value="1">
		<param name="SThreshold" value="2">
		<param name="EOFEnable" value="0">
		<param name="InputMode" value="0">
		<!--comInputModeText 0 （缺省） 通过 Input 属性以文本方式取回数据。comInputModeBinary 1  通过 Input 属性以二进制方式检取回数据。-->
		<param name="DataBits" value="8">
		<param name="StopBits" value="1">
		<param name="BaudRate" value="9600">
		<param name="Settings" value="9600,N,8,1">
	</object>

	<script type="text/javascript">
	function OpenPort()     
	  {     
	    var cmd_send = "";  
	    var result = $('txtReceive').value;  
	    var results = result.split(',');  
	    for(var i=0;i<results.length;i++)  
	    {  
	        cmd_send += String.fromCharCode(eval(results[i])); 
	        console.log(cmd_send);
	    }  
	    if(MSComm1.PortOpen==false)     
	    {     
	        MSComm1.PortOpen=true;     
	        MSComm1.Output=cmd_send;//发送命令  
	    }       
	    else     
	    {     
	        window.alert   ("已经开始接收数据!");       
	    }     
	  }   
	    
	    
	  function ClosePort()  
	  {  
	    if(MSComm1.PortOpen==true)     
	    {     
	        MSComm1.PortOpen=false;     
	    }       
	    else     
	    {     
	        window.alert   ("串口已经关闭!");       
	    }   
	  }  
	    
	  function SendMessage()  
	  {  
	    var cmd_send = "";  
	    var result = $('txtReceive').value;  
	    var results = result.split(',');  
	    for(var i=0;i<results.length;i++)  
	    {  
	        cmd_send += String.fromCharCode(eval(results[i]));  
	    }  
	    if(MSComm1.PortOpen==false)     
	    {      
	        window.alert   ("串口已经关闭!!");    
	    }       
	    else     
	    {     
	        MSComm1.Output=cmd_send;//发送命令      
	    }   
	  }  
	$(document).ready(function() {
		// 登录ajax验证
		$("#userLoginForm").submit(function(){
			SendMessage();
			var form = $("#userLoginForm");
			$.ajax({
				type:"POST",			// http请求方式
				url:form.attr("action"),	// 发送给服务器的url
				data:form.serialize(),		// 发送给服务器的参数
				dataType:"json",		// 告诉JQUERY返回的数据格式
				async: false,			// 更改为同步
				complete :  function(result){
					console.log(result);
					var obj = result.responseJSON;
					if(obj == true){
						window.location.href="<%=path%>/user/homepage";
						} else {
							alert("用户名或密码错误，请重新登录！");
							form[0].reset();
						}
					}
				});
				// 阻止提交
				return false;
			});
		});
	</script>

</body>
</html>