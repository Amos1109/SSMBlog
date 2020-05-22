package com.hyt.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hyt.entity.Blog;
import com.hyt.service.BlogService;

@Controller
@RequestMapping({"/blog"})
public class BlogController {
	
	@Resource
	private BlogService blogService;
	
	@RequestMapping({"/articles/{id}"})
	public ModelAndView details(@PathVariable("id")Integer id,HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		Blog blog =blogService.findById(id);
		mav.addObject("blog",blog);
		//阅读人数+1并更新
		blog.setClickHit(blog.getClickHit()+1);
		blogService.update(blog);
		mav.addObject("mainPage", "foreground/blog/view.jsp");
		mav.addObject("title", blog.getTitle()+"~Amospace");
		mav.setViewName("index");
		return mav;
	}
}
