package com.hyt.service;


import com.hyt.entity.Blogger;

public interface BloggerService {
	public Blogger getByUserName(String userName);
	
	//更新博主
	public Integer update(Blogger blogger);
	
	//查询博主
	public Blogger find();
}
