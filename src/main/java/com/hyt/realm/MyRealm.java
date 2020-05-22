package com.hyt.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.hyt.entity.Blogger;
import com.hyt.service.BloggerService;
import com.hyt.util.Const;

public class MyRealm extends AuthorizingRealm {
	@Resource
	private BloggerService bloggerService;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		String userName=(String)token.getPrincipal();
		Blogger blogger=bloggerService.getByUserName(userName);
		if(blogger!=null) {
			SecurityUtils.getSubject().getSession().setAttribute(Const.CURRENT_USER, blogger);
			AuthenticationInfo authenInfo=new SimpleAuthenticationInfo(blogger.getUserName(), blogger.getPassword(),getName());
			return authenInfo;
		}
		return null;
	}

}
