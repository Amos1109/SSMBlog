package com.hyt.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.hyt.entity.Blog;
import com.hyt.entity.BlogType;
import com.hyt.entity.Blogger;
import com.hyt.service.BlogService;
import com.hyt.service.BlogTypeService;
import com.hyt.service.BloggerService;
import com.hyt.util.Const;
import com.hyt.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping({"/admin/system"})
public class SystemAdminController {
	@Resource
	private BlogTypeService blogTypeService;
	@Resource
	private BloggerService bloggerService;
	@Resource
	private BlogService blogService;
	/*
	 * 刷新系统缓存
	 */
	@RequestMapping({"/refreshSystem"})
	public String refreshSystem(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ServletContext application=RequestContextUtils.getWebApplicationContext(request).getServletContext();
		//博客类别
		List<BlogType>list=blogTypeService.countList();
		application.setAttribute(Const.BLOG_TYPE_COUNT_LIST, list);
		//博主信息
		Blogger blogger=bloggerService.find();
		blogger.setPassword(null);
		application.setAttribute(Const.BLOGGER, blogger);
		//按年月分类的博客数量
		List<Blog> blogCountList=blogService.countList();
		application.setAttribute(Const.BLOG_COUNT_LIST, blogCountList);
		JSONObject result=new JSONObject();
		result.put("success", Boolean.TRUE);
		ResponseUtil.write(response, result);
		return null;
	}
}
