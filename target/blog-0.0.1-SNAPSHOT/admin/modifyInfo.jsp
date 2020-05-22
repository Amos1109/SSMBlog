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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
function submitData(){
	var nickName=$("#nickName").val();
	var sign=$("#sign").val();
	var profile=UE.getEditor("editor").getContent();
	if(nickName==null||nickName==""){
		$.messager.alert("系统提示","昵称不能为空！");
	}else if(sign==null||sign==""){
		$.messager.alert("系统提示","个性签名不能为空！");
	}else if(profile==null||profile==""){
		$.messager.alert("系统提示","个人简介不能为空！");
	}else{
		$("#profile").val(profile);
		$("#form1").submit();
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="p" class="easyui-panel" title="修改个人信息" style="padding:10px">
<form id="form1" action="${pageContext.request.contextPath }/admin/blogger/save.do" method="post" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="${currentUser.id }"/>
<input type="hidden" id="profile" name="profile"/>
<table cellspacing="20px">
<tr>
	<td width="80px">用户名：</td>
	<td><input type="text" id="userName" name="userName" style="width:200px;" value="${currentUser.userName }" readonly="readonly"/></td>
</tr>

<tr>
	<td>昵称：</td>
	<td><input type="text" id="nickName" name="nickName" style="width:200px;" value="${currentUser.nickName }" /></td>
</tr>

<tr>
	<td>个性签名：</td>
	<td><input type="text" id="sign" name="sign" style="width:400px;" value="${currentUser.sign }" /></td>
</tr>

<tr>
	<td>头像：</td>
	<td><input type="file" id="imageFile" name="imageFile" style="width:400px;" /></td>
</tr>

<tr>
<td>个人简介：</td>
<td>
<script id="editor" type="text/plain" style="width:100%;height:500px;"></script>
</td>
</tr>


<tr>
<td></td>
<td><a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">提交</a></td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
//实例化编辑器
var ue=UE.getEditor("editor");
ue.addListener("ready",function(){
	//通过ajax获取数据
	UE.ajax.request("${pageContext.request.contextPath }/admin/blogger/find.do",{
		method:"post",
		async:false,
		data:{},
		onsuccess:function(result){
			result=eval("("+result.responseText+")");
			UE.getEditor("editor").setContent(result.profile);
		}
	});

});


</script>
</body>
</html>