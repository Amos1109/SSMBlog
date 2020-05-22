package com.hyt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyt.dao.BlogDao;
import com.hyt.entity.Blog;
import com.hyt.service.BlogService;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Resource
	private BlogDao blogDao;
	
	@Override
	public List<Blog> countList() {
		// TODO Auto-generated method stub
		return blogDao.countList();
	}

	@Override
	public List<Blog> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return blogDao.list(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return blogDao.getTotal(map);
	}

	@Override
	public Blog findById(Integer id) {
		// TODO Auto-generated method stub
		return blogDao.findById(id);
	}

	@Override
	public Integer add(Blog blog) {
		// TODO Auto-generated method stub
		return blogDao.add(blog);
	}

	@Override
	public Integer update(Blog blog) {
		// TODO Auto-generated method stub
		return blogDao.update(blog);
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return blogDao.delete(id);
	}

	@Override
	public Integer getBlogByTypeId(Integer typeId) {
		// TODO Auto-generated method stub
		return blogDao.getBlogByTypeId(typeId);
	}

}
