<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Hello</title>
<!--<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
   
     <script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
 -->
</head>
<div id="body">
    <div class="content_box" >
        <div class="text" style="text-align:center; color: red; font-size:14px; font-weight: 900; height: 12px;" >${message}</div>
        <%-- <a class="content_btn" href="doexpAction/startExp.action?userid=${ userid}"> --%>
        <a class="content_btn" href="doexpAction/startExp.action">
            <img class="content_img1" src="img/3_12.png"/>
            <img class="content_img2" src="img/2_12.png"/>
            <div class="content_text">开始实验</div>
        </a>    
        <a class="content_btn" onclick="mynote()"> 
            <img class="content_img1" src="img/3_13.png"/>
            <img class="content_img2" src="img/2_13.png"/>
            <div class="content_text">我的笔记</div>
        </a>
         <a class="content_btn" href="http://jwxt.njupt.edu.cn"/>
            <img class="content_img1" src="img/3_14.png"/>
            <img class="content_img2" src="img/2_14.png"/>
            <div class="content_text">教务网站</div>
        </a> 
        <a class="content_btn" onclick="mypwd()">
            <img class="content_img1" src="img/3_15.png"/>
            <img class="content_img2" src="img/2_15.png"/>
            <div class="content_text">修改密码</div>
        </a>
    
    </div>
</div>
<script>
$(function(){

})



</script>
</html>
