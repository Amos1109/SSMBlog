package com.hyt.dao;

import org.apache.ibatis.annotations.Param;

import com.hyt.entity.Blogger;

public interface BloggerDao {
	public Blogger getByUserName(@Param("userName")String userName);
	
	//更新博主
	public Integer update(Blogger blogger);
	
	//查询博主
	public Blogger find();
}
