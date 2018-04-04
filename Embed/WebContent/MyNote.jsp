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

</head>
<div id="mynote" style="display: none">
<a href="javascript:void(0)" class="easyui-linkbutton" style="font-size: 14px;" onclick="tomain('mynote')">&lt&lt返回</a>
<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="font-size: 14px;" onclick="reloadtb()">刷新</a>
<table id="notedatagrid" class="easyui-datagrid" style="height:464px"   
        data-options="url:'',fitColumns:true,singleSelect:true,rownumbers:true">   
    <thead>   
        <tr>   
            <th data-options="field:'id',width:2,hidden:true">id</th>   
            <th data-options="field:'createtime',width:10">创建时间</th>   
            <th data-options="field:'note',width:100">内容</th>   
            <th data-options="field:'deletenote',width:5,align:'center',formatter:deletenote">操作</th>
        </tr>   
    </thead>   
</table>  
    
</div>
<div id="dlgnote" class="easyui-dialog" title="笔记"
        data-options="iconCls:'icon-save',closed:'true'"
        style="width:500px;height:600px;padding:10px;">
    <input id="tbnote" class="easyui-textbox" data-options="multiline:'true'" style="width:460px;height:500px"> 
    <div style="text-align: center;margin-top:10px">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="savenote()">修改</a>
    </div>
</div>

 <script>
 var id = null;
$(function(){
	$('#notedatagrid').datagrid({    
	    url:'noteAction/getNote.action',
	    methord: 'post',
	});  
});
 
function reloadtb(){
	$('#notedatagrid').datagrid('reload');
}
function deletenote(value,row,index){
    return "<a href=\"javascript:void(0)\" onclick=\"doItems1('"+row.id+"')\">[删除]</a><a href=\"javascript:void(0)\" onclick=\"doItems2('"+row.id+"','"+row.note+"')\">[查看]</a>";
}
function doItems1(id){
	$.messager.confirm('删除', '确认删除?', function(r){
	    if (r){
	    	$.ajax({
	            url:"noteAction/deleteNote.action",
	            type:"post",
	            data:{'tbNote.id':id},
	            dataType:"json",
	            success:function(data){
	                $.messager.alert('提示','删除成功','info','');
	                $('#notedatagrid').datagrid('reload');
	            }
	        });  
	    	
	    }
	});
    }
function doItems2(id1,note){
	$('#dlgnote').dialog('open');
	$("#tbnote").textbox("setValue", note);
	id=id1;
    }
    
function savenote(){
    var note=$("#tbnote").val();
    var data={'tbNote.id':id,'tbNote.note':note};
      $.ajax({
        url:"noteAction/updateNote.action",
        type:"post",
        data:data,
        dataType:"json",
        success:function(data){
        	$('#notedatagrid').datagrid('reload');
        }
    });  
    $('#dlgnote').dialog('close'); 
    $('#notedatagrid').datagrid('reload');
}
</script> 
</html>
