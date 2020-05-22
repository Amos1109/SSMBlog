<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
function openBlogTypeAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加博客类别信息");
	url="${pageContext.request.contextPath }/admin/blogType/save.do";
}

function openBlogTypeModifyDialog(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","只能选择一条要编辑的数据！");
		return;
	}
	var row=selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle","编辑博客类别信息");
	$("#fm").form("load",row);
	url="${pageContext.request.contextPath }/admin/blogType/save.do?id="+row.id;
}
//保存博客类别信息
function saveBlogType(){
	$("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				//关闭对话框，刷新数据
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	});
}

function resetValue(){
	$("#typeName").val("");
	$("#orderNo").val("");
}

function closeBlogTypeDialog(){
	$("#dlg").dialog("close");
	resetValue();
}

//删除博客类别
function deleteBlogType(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的数据！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确定要删除这些数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath }/admin/blogType/delete.do",{ids:ids},function(result){
				if(result.success){
					if(result.exist){
						$.messager.alert("系统提示",result.exist);
					}else{
						$.messager.alert("系统提示","删除成功！");
					}
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","删除失败！");
				}
			},"json");
		}
	});
}
</script>
<meta charset="UTF-8">
<title>博客类别管理</title>
</head>
<body>
<table id="dg" title="博客类别管理" class="easyui-datagrid" fitcolumns="true" pagination="true" rownumbers="true" url="${pageContext.request.contextPath }/admin/blogType/list.do"
fit="true" toolbar="#tb">
<thead>
<tr>
<th field="cb" checkbox="true" align="center"></th>
<th field="id" width="20" align="center">编号</th>
<th field="typeName" width="100" align="center">博客类型名称</th>
<th field="orderNo" width="100" align="center">排序序号</th>
</tr>
</thead>
</table>

<div id="tb">
<a href="javascript:openBlogTypeAddDialog();" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
<a href="javascript:openBlogTypeModifyDialog();" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
<a href="javascript:deleteBlogType();" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:500px;height:180px;padding:10px 20px"
closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
		<tr>
		<td>博客类别名称：</td>
		<td><input type="text" id="typeName" name="typeName" class="easyui-validatebox" required="required"/></td>
		</tr>
		
		<tr>
		<td>博客类别排序：</td>
		<td><input type="text" id="orderNo" name="orderNo" class="easyui-validatebox" required="required" style="width:60px"/>（类别根据排序序号重小到大排序）</td>
		</tr>
		</table>
	</form>
</div>

<div id="dlg-buttons">
<a href="javascript:saveBlogType();" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
<a href="javascript:closeBlogTypeDialog();" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>