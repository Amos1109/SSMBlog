<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
function submitData(){
	var title=$("#title").val();
	var blogTypeId=$("#blogTypeId").combobox("getValue");
	var content=UE.getEditor("editor").getContent();
	var keyWord=$("#keyWord").val();
	if(title==null||title==''){
		$.messager.alert("系统提示","标题不能为空！");
	}else if(blogTypeId==null||blogTypeId==''){
		$.messager.alert("系统提示","博客类别不能为空！");
	}else if(content==null||content==''){
		$.messager.alert("系统提示","请输入内容");
	}else{
		$.post("${pageContext.request.contextPath }/admin/blog/save.do",
				{'id':'${param.id}','title':title,'blogType.id':blogTypeId,'content':content,
			'summary':UE.getEditor('editor').getContentTxt().substr(0,155),
			'keyWord':keyWord},
			function(result){
				if(result.success){
					$.messager.alert("系统提示","博客修改成功！");
				}else{
					$.messager.alert("系统提示","博客修改失败！");
				}
		},"json");
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="p" class="easyui-panel" title="修改文章" style="padding:10px">
<table cellspacing="20px">
<tr>
	<td width="80px">博客标题：</td>
	<td><input type="text" id="title" name="title" style="width:400px;"/></td>
</tr>
<tr>
<td>所属类别：</td>
<td>
<select class="easyui-combobox" id="blogTypeId" name="blogType.id" style="width:154px;" editable="false" panelHeight="auto">
<option value="">请选择博客类别...</option>
<c:forEach var="blogType" items="${blogTypeCountList}">
<option value="${blogType.id }">${blogType.typeName }</option>
</c:forEach>
</select>
</td>
</tr>
<tr>
<td>正文内容：</td>
<td>
<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
</td>
</tr>

<tr>
<td>关键字：</td>
<td><input type="text" id="keyWord" name="keyWord" style="width:400px;"/>
&nbsp;（多个关键字中间用空格隔开）</td>
</tr>

<tr>
<td></td>
<td><a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">修改博客</a></td>
</tr>
</table>
</div>

<script type="text/javascript">
//实例化编辑器
var ue=UE.getEditor("editor");

ue.addListener("ready",function(){
	//通过ajax请求数据
	UE.ajax.request("${pageContext.request.contextPath }/admin/blog/findById.do",
		{
			method:"post",
			asyc:false,
			data:{"id":"${param.id}"},
			onsuccess:function(result){
				result=eval("("+result.responseText+")");
				$("#title").val(result.title);
				$("#keyWord").val(result.keyWord);
				$("#blogTypeId").combobox("setValue",result.blogType.id);
				UE.getEditor("editor").setContent(result.content);
			}
		}	
	);
});
</script>
</body>
</html>