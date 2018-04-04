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
</head>
<div id="passwd" style="display:none;height:490px">
<a href="javascript:void(0)" class="easyui-linkbutton" style="font-size: 14px;" onclick="tomain('passwd')">&lt&lt返回</a>
<div class="text" style="text-align: center;">
    <a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp原密码:</a>
    <input id="oldpwd" class="isNull isPassword textbox password" type="password"/>
</div>
<div class="text" style="text-align: center;">
    <a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp新密码:</a>
    <input id="newpwd1" class="check isNull isPassword textbox password" type="password"/>
</div>
<div class="text" style="text-align: center;">
    <a>确认新密码:</a>
    <input id="newpwd2" class="check isNull isPassword textbox password" type="password"/>
</div>
<div class="text" style="text-align: center;">
<a href="javascript:void(0)" class="easyui-linkbutton" style="width:60px;font-size: 14px;margin-top: 20px" onclick="savepwd()">确认</a>
</div>
<div class="warning">
    <div class="text"></div>
    <div class="arrow"></div>
</div>
</div>
<script>
$(function(){
})

function savepwd(){
	isCheck($(".check"));
    var oldpwd=$("#oldpwd").val();
    var newpwd1=$("#newpwd1").val();
    var newpwd2=$("#newpwd2").val();
    
    if(oldpwd==''){
    	$.messager.alert('提示','请输入原密码','info','');
    	return;
    }else if(newpwd1!=newpwd2){
        $.messager.alert('提示','新密码不一致','info','');
        return;
    }
    var userid=$("#userid").text();
    
    var data1={'tbUser.id':userid,'tbUser.password':oldpwd};
    $.ajax({
        url:"systemAction/checkUser.action",
        type:"post",
        data:data1,
        dataType:"json",
        success:function(data){
        	console.log(data);
        	if(data){
	        	 var data2={'tbUser.id':userid,'tbUser.password':newpwd1};
	             $.ajax({
	                url:"systemAction/updateUser.action",
	                type:"post",
	                data:data2,
	                dataType:"json",
	                success:function(data){
	                if(data){
	                	$.messager.alert('提示','修改完成','info','');
	                    tomain('passwd');
	                }else{
	                	$.messager.alert('提示','修改失败','info','');
	                }  
	                }
	            });  
        	}else{
        		$.messager.alert('提示','原密码错误','info','');
        	}
        }
    });
   
   
}

</script>
</html>
