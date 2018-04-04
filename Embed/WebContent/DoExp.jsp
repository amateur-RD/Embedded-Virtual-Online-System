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
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
   
    <script src="jquery/jquery-2.1.1.js" type="text/javascript" charset="utf-8"></script>
   <!--  <script type="text/javascript" src="easyui/jquery.min.js"></script> -->
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

</head>
<a id="userid" style="display:none">${ userid}</a>
<!-- <div id="title">
    <div
        style="background:#177dbe;text-indent: 30px;border-radius: 5px; cursor: pointer;display:inline;padding:5px;margin:0 0 0 20px;">
        <a class="endexp" href="javascript:void(0)" style="font-size: 14px;color:white;" onClick="endExp()">结束实验</a>

    </div>
    <div
        style="background:#177dbe;text-indent: 30px;border-radius: 5px; cursor: pointer;display:inline;padding:5px;margin:0 0 0 20px;">
        <a href="javascript:void(0)" class="" style="font-size: 14px;color:white;" onclick="$('#dlg').dialog('open')">做个笔记</a>
    </div>
</div>  -->
 <body style="margin:0px;padding:0px;background:#0573b8;">
	<div style="float:left;width: 67%;height: 91.5%;margin:0px;padding:0px;">
		<iframe id="iframe1" src="${dockerUrl}" style="width: 100%;height: 115%" scrolling="no"></iframe>
	</div>
	
	<div
		style="float:left;width: 33%;height: 63%;margin:0px;padding:0px;overflow:hidden">

		<div style="margin:-130px 0px 0px -60px">
			<iframe src="${ monitorUrl}" style="width: 100%;height: 100%" scrolling="no"></iframe>

		</div>
	</div>
    <div style="margin:-120px 5px;float:left;width: 32%;height: 51%;padding:0px;min-width: 350px" class="dd">
        <a id="devid" class="easyui-linkbutton" style="display:none" >devid</a>
        <div style="text-align: center;min-width: 350px"> 
            <a id="bt0" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮1</a>
            <a id="bt1" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮2</a>
            <a id="bt2" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮3</a>
            <a id="bt3" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮4</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt4" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮5</a>
            <a id="bt5" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮6</a>
            <a id="bt6" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮7</a>
            <a id="bt7" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮8</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt8" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮9</a>
            <a id="bt9" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮10</a>
            <a id="bt10" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮11</a>
            <a id="bt11" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮12</a>
        </div>    
        <div style="text-align: center;min-width: 350px;padding-top:2px"> 
            <a id="bt12" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮13</a>
            <a id="bt13" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮14</a>
            <a id="bt14" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮15</a>
            <a id="bt15" class="easyui-linkbutton" style="width:80px;height:80px;border-radius:40px" >按钮16</a>
        </div>
        <hr>
		<div style="text-align: center;min-width: 350px">
		        <a class="easyui-linkbutton" href="javascript:void(0)" style="width:80px;height:30px;font-size: 14px;margin-top:5px" onClick="endExp()">结束实验</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" style="width:80px;height:30px;font-size: 14px;margin-top:5px" onclick="$('#dlg').dialog('open')">做个笔记</a>
		</div>    
    </div>
	
	
</body>

<div id="dlg" class="easyui-dialog" title="笔记"
        data-options="iconCls:'icon-save',closed:'true'"
        style="width:500px;height:600px;padding:10px;">
    <input id="tb" class="easyui-textbox" data-options="multiline:'true'" style="width:460px;height:500px"> 
    <div style="text-align: center;margin-top:10px">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="savenote()">Add</a>
    </div>
</div>
<script>
$(function(){
	
	$.ajax({
        url:"doexpAction/getBt.action",
        type:"post",
        data:{},
        dataType:"json",
        success:function(data){
        	$.each(data, function(i,val){      
        		$('#'+i).val(val);
        	  })
        }
    }); 
})
/* $(window).unload(function(){
	$.ajax({
	    url:"doexpAction/endExp.action",
	    type:"post",
	    data:{'tbMonitor.flag':'N'},
	    dataType:"json",
	    success:function(data){
	    }
	}); 
        }); */
function endExp(){
$.ajax({
    url:"doexpAction/endExp.action",
    type:"post",
    data:{},
    dataType:"json",
    success:function(data){
    	javascript :history.go(-1);
    }
}); 
console.log('返回');
}

function savenote(){
	var note=$("#tb").val();
	var userid=$("#userid").text();
	var data={'tbNote.userid':userid,'tbNote.note':note};
	 $.ajax({
        url:"doexpAction/addnote.action",
        type:"post",
        data:data,
        dataType:"json",
        success:function(data){
        }
    });  
	
	
	$('#dlg').dialog('close');
}
$("div.dd a").click(function(){
	
	var data={'devID':$('#devid').val(),'key':$(this).val()};
	console.log(data);
	/* $.ajax({
    url:"",
    type:"post",
    data:data,
    dataType:"json",
    success:function(data){
    }
 }); */
});

</script>
</html>
