package com.hyt.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hyt.dao.BlogTypeDao;
import com.hyt.entity.BlogType;
import com.hyt.service.BlogTypeService;
@Service("blogTypeService")

public class BlogTypeServiceImpl implements BlogTypeService {
	@Resource
	private BlogTypeDao blogTypeDao;
	@Override
	public List<BlogType> countList() {
		// TODO Auto-generated method stub
		return blogTypeDao.countList();
	}

	@Override
	public BlogType findById(Integer id) {
		// TODO Auto-generated method stub
		return blogTypeDao.findById(id);
	}

	@Override
	public List<BlogType> list(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return blogTypeDao.list(paramMap);
	}

	@Override
	public Long getTotal(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return blogTypeDao.getTotal(paramMap);
	}

	@Override
	public Integer add(BlogType blogType) {
		// TODO Auto-generated method stub
		return blogTypeDao.add(blogType);
	}

	@Override
	public Integer update(BlogType blogType) {
		// TODO Auto-generated method stub
		return blogTypeDao.update(blogType);
	}

	@Override
	public Integer delete(Integer id) {
		// TODO Auto-generated method stub
		return blogTypeDao.delete(id);
	}


}
