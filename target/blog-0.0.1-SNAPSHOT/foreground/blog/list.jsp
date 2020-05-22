<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
			<div class="layui-col-md8">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-carousel" id="carousel">
					  		<div carousel-item>
					  		 <div><img src="https://img.zcool.cn/community/0132815c2581eba80121df90120d8c.jpg@1380w" alt=""></div>
							    <div><img src="https://img.zcool.cn/community/01cdfb5c244470a8012029ac59da4c.png@1380w" alt=""></div>
					  		</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<c:forEach var="blog" items="${blogList }">
					<div class="layui-col-md12">
						<div class="main list">
							<div class="subject"><a href="javascript:;" class="caty">${blog.blogType.typeName }</a><a href="${pageContext.request.contextPath }/blog/articles/${blog.id}.html" title="${blog.title }">${blog.title }</a><em>发表于&nbsp;<fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></em></div>
							<div class="content layui-row">
								<div class="layui-col-md8">
									<div class="list-text">摘要：${blog.summary }</div>
									<div class="list-stat layui-row">

										<div class="layui-col-xs3 layui-col-md3 Label">
											<i class="layui-icon layui-icon-note"></i>
											<a href="javascript:;">${blog.keyWord }</a>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											<i class="layui-icon layui-icon-reply-fill"></i>
											<em>${blog.replyHit }条评论</em>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											<i class="layui-icon layui-icon-read"></i>
											<em>${blog.clickHit }次阅读</em>
										</div>

										<div class="layui-col-xs3 layui-col-md3 alink">
											<a href="${pageContext.request.contextPath }/blog/articles/${blog.id}.html" class="layui-btn layui-btn-xs">阅读原文</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					</c:forEach>
					<div class="layui-col-md12" id="pages"></div>
				</div>
	        </div>
</body>
</html>