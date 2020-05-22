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
//返回博客类型名称
function formatBlogType(val,row){
	return val.typeName;
}

//点击标题弹出用户预览页面
function formatTitle(val,row){
	return "<a target='_blank' href='${pageContext.request.contextPath }/blog/articles/"+row.id+".html'>"+val+"</a>";
}

//根据标题查询
function searchBlog(){
	$("#dg").datagrid('load',{"title":$("#s_title").val()});
}

function openBlogModifyTab(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一个要修改的博客！");
		return;
	}
	var row=selectedRows[0];
	window.location.href="modifyBlog.jsp?id="+row.id
}

//删除博客信息
function deleteBlog(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要删除的博客！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		strIds.push(selectedRows[i].id);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","你确定要删除吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath }/admin/blog/delete.do",{ids:ids},function(result){
				if(result.success){
					$.messager.alert("系统提示","删除成功！");
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
<title>Insert title here</title>
</head>
<body>
<table id="dg" title="文章管理" class="easyui-datagrid" fitcolumns="true"
pagination="true" rownumbers="true" fit="true" toolbar="#tb"
url="${pageContext.request.contextPath }/admin/blog/list.do">
<thead>
<tr>
	<th field="cb" checkbox="true" align="center"></th>
	<th field="id" width="20px" align="center">编号</th>
	<th field="title" width="200px" align="center" formatter="formatTitle">标题</th>
	<th field="releaseDate" width="50px" align="center">发布日期</th>
	<th field="blogType" width="50px" align="center" formatter="formatBlogType">博客类别</th>
</tr>
</thead>
</table>

<div id="tb">
<div>
<a href="javascript:openBlogModifyTab()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
<a href="javascript:deleteBlog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
</div>
<div>
&nbsp;标题：&nbsp;<input type="text" id="s_title" size="20px"/>
<a href="javascript:searchBlog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
</div>
</div>
</body>
</html>