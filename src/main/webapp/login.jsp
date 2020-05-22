<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  	<meta name="apple-mobile-web-app-capable" content="yes">
  	<meta name="format-detection" content="telephone=no">
	<title>登陆 - Blog</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/common.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css">
</head>
<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12 layui-hide-xs xs-hide"></div>
			<div class="layui-col-md4 layui-col-md-offset4 login-main">
				<img src="http://www.muzhuangnet.com/upload/201610/17/201610171329086541.png" class="logo">
				<div class="main formbox">
					<form action="${pageContext.request.contextPath }/blogger/login.do" method="post" accept-charset="utf-8" class="layui-form">
						<div class="inputbox">
							<input type="text" name="userName" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input" value="${blogger.userName}">
						</div>
					    
					    <div class="margin20"></div>
						<div class="inputbox">
					    	<input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${blogger.password}">
						</div>
						<span><font color="red">${errorInfo }</font></span>
					    <div class="margin20"></div>
					    <div class="inputbox info">
					    	<input type="checkbox" name="checkbox" lay-skin="primary" checked="checked" />
					    	我已阅读并同意<a href="javascript:;">用户协议</a>和<a href="javascript:;">隐私条款</a>
					    </div>

					    <div class="layui-row layui-col-space20 bts">
					    	<div class="layui-col-md6">
					    		<button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
					    	</div>
					    	<div class="layui-col-md6">
					    		<a href="javascript:;" class="layui-btn layui-btn-normal">注册</a>
					    	</div>
							<div class="layui-col-md12">
								<a href="index.html" class="layui-btn layui-btn-primary">返回首页</a>
							</div>
					    </div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="${pageContext.request.contextPath }/static/layui/layui.all.js"></script>
<script>
	
</script>
</html>