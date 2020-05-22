<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<title>${title }</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/common.css">
</head>
<body>
	<header class="layui-bg-cyan">
		<nav class="layui-container">
			<div class="layui-row">
			    <div class="layui-col-md2 logo">
			    	<a href="javascript:;"><img src="http://www.muzhuangnet.com/upload/201610/17/201610171329086541.png"></a>
			    </div>
			    <div class="layui-col-md8 layui-hide-xs">
			    	<ul class="layui-nav layui-bg-cyan">
					  	<li class="layui-nav-item layui-this">
					    	<a href="${pageContext.request.contextPath }/index.html">首页</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">PHP<span class="layui-badge-dot"></span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Ruby</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Python</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">Discuz<span class="layui-badge-dot"></span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">仓库<span class="layui-badge">9</span></a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">关于</a>
					  	</li>
					</ul>
			    </div>
			    <div class="layui-col-md2 layui-hide-xs userinfoBox">
			    	<ul class="layui-nav layui-bg-cyan">
					  	<li class="layui-nav-item">
					    	<a href="javascript:;"><i class="layui-icon layui-icon-search search"></i></a>
					  	</li>
					  	<li class="layui-nav-item" lay-unselect="">
						    <a href="javascript:;"><img src="${pageContext.request.contextPath }/static/userImages/${blogger.imageName}" class="layui-nav-img">Amos</a>
						    <dl class="layui-nav-child">
						      	<dd><a href="${pageContext.request.contextPath }/admin/main.jsp">后台管理</a></dd>
						    </dl>
						</li>
					</ul>
			    </div>
		   	</div>
		</nav>
	</header>

	<div class="layui-container">
		<div class="layui-row layui-col-space20">
			<jsp:include page="${mainPage}"></jsp:include>
	        <div class="layui-col-md4">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-card">
						  	<div class="layui-card-header">
								<span class="layui-breadcrumb" lay-separator="|">

									<a href="javascript:;">博主信息</a>
								</span>
						  	</div>
						  	<div class="layui-card-body" id="binfo" style="text-align: center;">
								<img src="${pageContext.request.contextPath }/static/userImages/${blogger.imageName}" style="width:120px;height:120px"/> 
								<!-- <img src="http://121.43.102.125:8080/images/18164308.jpg" style="width:120px;height:120px"/> -->
								<p>${blogger.nickName }</p>
								<p>${blogger.sign }</p>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="layui-card">
						  	<div class="layui-card-header">
								<span>
									按日志类别
								</span>
						  	</div>
						  	<div class="layui-card-body">
								<table class="layui-table" lay-skin="nob">
								  	<tbody>
								  	<c:forEach var="blogTypeCount" items="${blogTypeCountList }">
								    	<tr><td><a href="${pageContext.request.contextPath }/index.html?typeId=${blogTypeCount.id }">${blogTypeCount.typeName }(${blogTypeCount.blogCount })</a></td></tr>
								    </c:forEach>
								  	</tbody>
								</table>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="layui-card">
						  	<div class="layui-card-header">
								<span>
									按日志日期
								</span>
						  	</div>
						  	<div class="layui-card-body">
								<table class="layui-table" lay-skin="nob">
								  	<tbody>
								  	<c:forEach var="blogCount" items="${blogCountList }">
								    	<tr><td><a href="${pageContext.request.contextPath }/index.html?releaseDateStr=${blogCount.releaseDateStr }">${blogCount.releaseDateStr }（${blogCount.blogCount }）</a></td></tr>
								    </c:forEach>
								  	</tbody>
								</table>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
				</div>
	        </div>
		</div>
	</div>

	<!-- 尾部 -->
	<div class="footer"></div>
	<footer class="layui-bg-cyan">
		<div class="layui-container">
			<div class="layui-row">
				<p>本站部分内容来源于网络，若侵犯到您的利益，请联系站长删除！谢谢！Powered By <a href="https://gitee.com/XzcGroup/XzcBlogTemplate" target="_blank" title="XzcBlogTemplate">XzcBlogTemplate</a></p>
			</div>
		</div>
	</footer>
</body>
<script src="${pageContext.request.contextPath }/static/layui/layui.all.js"></script>

<script>
	layui.carousel.render({
	    elem: '#carousel'
	    ,width: '100%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
  	});
  	layui.laypage.render({
	    elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 2 //数据总数，从服务端得到
  	});
</script>
</html>