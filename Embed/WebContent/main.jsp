<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
if(null==request.getSession().getAttribute("userid")){
    request.getRequestDispatcher("/index.jsp").forward(request, response);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基于Docker的远程在线实验系统</title>
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">   
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">  
 <script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script src="js/base.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div id="total">
		<div id="header">
		    <div></div>
			<h1>欢迎使用SSH远程在线实验系统</h1>
		</div>
		 <div id="title">
			<p class="username">
				欢迎<strong>${username }</strong>登陆系统
			</p>
			<a id="userid" style="display:none">${ userid}</a>
			<a class="loginout" href="systemAction/loginout.action">退出系统</a>
			<!-- <a href="javascript:void(0)" class="loginout"  onclick="hello()">退出系统</a> -->
		</div>
<jsp:include page="FirstPage.jsp"></jsp:include>
<jsp:include page="MyNote.jsp"></jsp:include>
<jsp:include page="Passwd.jsp"></jsp:include>

<div id="footer" style="background:#0573b8;height:109px;width: 100%; bottom: 0px;">
<div style="text-align: center;padding-top:20px">
    <img class="content_img1" src="img/xx.png"/></div>

</div>
</div>

	
	<!-- <script src="js/base.js" type="text/javascript" charset="utf-8"></script> -->
	<script type="text/javascript">
		$(function() {
		});
		$(".content_btn").mouseover(function(){
		    $(this).children(".content_img1").hide();
		    $(this).children(".content_img2").show();
		    $(this).children(".content_text").addClass("content_text_style");   
		});
		$(".content_btn").mouseout(function(){
		    $(this).children(".content_img2").hide();
		    $(this).children(".content_img1").show();
		    $(this).children(".content_text").removeClass("content_text_style");        
		}); 
		function mynote(){
			
			$.ajax({
                url:"systemAction/Mytest.action",
                type:"post",
                data:{},
                dataType:"json",
                success:function(data){
                    if(!data){
                    	$("#mynote").css('display','block');
                        $("#body").css('display','none');
                        $("#notedatagrid").datagrid("resize");
                    }else{
                        location.href='index.jsp';
                    }
                }
            }); 
		   }
		function mypwd(){
	         $.ajax({
                 url:"systemAction/Mytest.action",
                 type:"post",
                 data:{},
                 dataType:"json",
                 success:function(data){
                	 if(!data){
                		 $("#passwd").css('display','block');
                         $("#body").css('display','none');
                	 }else{
                		 location.href='index.jsp';
                	 }
                 }
             }); 
	           }
		 function tomain(pageid){
	           $("#"+pageid).css('display','none');
	           $("#body").css('display','block');
	           } 
		/*  function hello(){
			 $.ajax({
	                url:"systemAction/hello.action",
	                type:"post",
	                data:{},
	                dataType:"json",
	                success:function(data){
	                }
	            }); 
		 } */
	</script>
	
<!-- <div class="warning">
	<div class="text"></div>
	<div class="arrow"></div>
</div> -->
</body>
</html>