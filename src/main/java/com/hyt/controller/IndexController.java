package com.hyt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hyt.entity.Blog;
import com.hyt.entity.PageBean;
import com.hyt.service.BlogService;
import com.hyt.util.StringUtil;

@Controller
public class IndexController {
	@Resource
	private BlogService blogService;
	@RequestMapping({"/index"})
	public ModelAndView index(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="typeId",required=false)String typeId,
			@RequestParam(value="releaseDateStr",required=false)String releaseDateStr,	
		HttpServletRequest request	) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("title","Amospace");
		if(StringUtil.isEmpty(page)) {
			page="1";
		}
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size",pageBean.getPageSize());
		map.put("typeId", typeId);
		map.put("releaseDateStr", releaseDateStr);
		List<Blog>list=blogService.list(map);
		mav.addObject("mainPage", "foreground/blog/list.jsp");
		mav.addObject("blogList",list);
		return mav;
	}
}
