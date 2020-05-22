<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/detail.css">

</head>
<body>
<div class="layui-col-md8">
				<div class="layui-row">
<div class="layui-col-md12">
						<div class="main">
							<div class="title">
								<p>${blog.title }</p>
								<div class="layui-row stat">
									<div class="layui-col-md3 layui-col-xs12">发布时间：<em><fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></em></div>
									<div class="layui-col-md2 layui-col-xs6">分类：<a href="javascript:;">${blog.blogType.typeName }</a></div>
									<div class="layui-col-md2 layui-col-xs6">作者：<a href="javascript:;">Amos</a></div>
									<div class="layui-col-md5 layui-col-xs12">
										<div class="layui-row">
											<div class="layui-col-md6 layui-col-xs6">
												<i class="layui-icon layui-icon-reply-fill"></i>
												<em>${blog.replyHit }条评论</em>
											</div>
											<div class="layui-col-md6 layui-col-xs6">
												<i class="layui-icon layui-icon-read"></i>
												<em>${blog.clickHit }次阅读</em>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="content">
						        <p>${blog.content }</p>
							</div>
							<div class="copyright">
								<p>本文链接：<a href="${pageContext.request.contextPath }/blog/articles/${blog.id }.html">${pageContext.request.contextPath }/blog/articles/${blog.id }.html</a></p>
								<p>转载声明：本站文章若无特别说明，皆为原创，转载请注明来源：Amospace，谢谢！^^</p>
							</div>
							<div style="padding-left:330px;padding-bottom:20px;padding-top:10px">
<div class="bshare-custom">
<script type="text/javascript" charset="UTF-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=1&amp;Lang=zh"></script>
<script type="text/javascript" charset="UTF-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
<a title="分享到QQ空间" class="bshare-qzone"></a>
<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
</div>

</div>
							<div class="operation">
								<a href="javascript:;" class="layui-btn layui-btn-normal">点赞</a>
								<a href="javascript:;" class="layui-btn layui-btn-warm">赞赏</a>
							</div>
							<div class="Label">
								<i class="layui-icon layui-icon-note"></i>
								<a href="javascript:;">${blog.keyWord }</a>
							</div>
						</div>
					</div>
					</div>
					</div>

</body>

</html>