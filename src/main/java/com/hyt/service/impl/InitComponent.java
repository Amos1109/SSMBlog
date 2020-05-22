package com.hyt.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.hyt.entity.Blog;
import com.hyt.entity.BlogType;
import com.hyt.entity.Blogger;
import com.hyt.service.BlogService;
import com.hyt.service.BlogTypeService;
import com.hyt.service.BloggerService;
import com.hyt.util.Const;

@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware {

	private static ApplicationContext applicationContext;
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		InitComponent.applicationContext=applicationContext;
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application=sce.getServletContext();
		//博客类别
		BlogTypeService blogTypeService=(BlogTypeService) applicationContext.getBean("blogTypeService");
		List<BlogType> blogTypeList=blogTypeService.countList();
		application.setAttribute(Const.BLOG_TYPE_COUNT_LIST, blogTypeList);
		
		//博主信息
		BloggerService bloggerService=(BloggerService) applicationContext.getBean("bloggerService");
		Blogger blogger=bloggerService.find();
		blogger.setPassword(null);
		application.setAttribute(Const.BLOGGER, blogger);
		
		//按年月分类的博客数量
		BlogService blogService =(BlogService) applicationContext.getBean("blogService");
		List<Blog> blogCountList=blogService.countList();
		application.setAttribute(Const.BLOG_COUNT_LIST, blogCountList);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
