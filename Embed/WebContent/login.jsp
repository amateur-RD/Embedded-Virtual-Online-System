<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕设</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		
		//设置登陆
		var l = $(window).width()/2-225;
		var t = $(window).height()/2-140;
		$("#login").css('left',l+"px").css("top",t+"px");
		$("#sre").css('left',l+"px").css("top",t+"px");
		
		
		$(".text .checkpwd").on("click",function(){
			var c = $(".text input[type='checkbox']")[0];
			if(c.checked){
				c.checked=false;
			}else{
				c.checked=true;
			}
		});
	});
	
	
	function sub(){
		return isCheck($(".check"));
	}
	function changeUrl() {
		$("#codevalidate").attr("src","loginAction/getCheckcode.action?"+Math.random());
    }
</script>
</head>
<body>
<div id="sre"></div>
<div id="login">
	<h1>登录</h1>
	<p style="text-align: center">初次登录账号密码均为学号</p>
	<!-- loginAction/login.action -->
	<form action="loginAction/login.action" method="post" onsubmit="return sub()">
		<div class="text"><input class="check isNull isAccont textbox username" type="text" name="tbUser.username" placeholder="请输入用户名" value="admin" /></div>
		<div class="text"><input class="check isNull isPassword textbox password" type="password" name="tbUser.password" placeholder="请输入密码" value="admin"/></div>
		<div class="text"><img id="codevalidate" src="loginAction/getCheckcode.action" width="90" height="30" style="margin-left: 10px" onclick="changeUrl()"><input type="text" class="textbox" placeholder=" 输入验证码" required="required" name="codevalidate" style="width: 60%;float:left"></div>
		<div class="text" style="text-align: right; color: red; font-size:12px; font-weight: 900; height: 12px;" >${message}</div>
		<div class="text"><input style="text-indent: 0px;" class="btn" type="submit" value="登陆系统" /></div>
		<div class="text">
			<!-- <input type="checkbox" /><span class="checkpwd">记住密码</span>
			<a class="fopwd" href="##">忘记密码？</a> -->
		</div>
	</form>
</div>
<div class="warning">
	<div class="text"></div>
	<div class="arrow"></div>
</div>
</body>
</html>