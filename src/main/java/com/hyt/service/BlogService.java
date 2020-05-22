package com.hyt.service;

import java.util.List;
import java.util.Map;

import com.hyt.entity.Blog;

public interface BlogService {
	public List<Blog>countList();
	
	public List<Blog>list(Map<String,Object>map);
	//博客数量
	public Long getTotal(Map<String,Object>map);
	
	public Blog findById(Integer id);
	
	public Integer add(Blog blog);
	
	public Integer update(Blog blog);
	
	public Integer delete(Integer id);
	
	public Integer getBlogByTypeId(Integer typeId);
}
