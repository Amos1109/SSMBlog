package com.hyt.dao;

import java.util.List;
import java.util.Map;

import com.hyt.entity.BlogType;

public interface BlogTypeDao {
	
	public List<BlogType> countList();
	public BlogType findById(Integer id);
	public List<BlogType> list(Map<String,Object> paramMap);
	public Long getTotal(Map<String,Object> paramMap);
	//添、改、删一条博客类型
	public Integer add(BlogType blogType);
	
	public Integer update(BlogType blogType);
	
	public Integer delete(Integer id);
}
