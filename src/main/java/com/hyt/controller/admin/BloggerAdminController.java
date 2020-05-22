package com.hyt.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hyt.entity.Blogger;
import com.hyt.service.BloggerService;
import com.hyt.util.Const;
import com.hyt.util.CryptographyUtil;
import com.hyt.util.DateUtil;
import com.hyt.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping({"/admin/blogger"})
public class BloggerAdminController {
	@Resource
	private BloggerService bloggerService;
	@RequestMapping({"save"})
	public String save(@RequestParam("imageFile")MultipartFile imageFile,Blogger blogger,HttpServletRequest request,
			HttpServletResponse response) throws  Exception {
		if(!imageFile.isEmpty()) {
			String filePath=request.getServletContext().getRealPath("/");
			String imageName=DateUtil.getCurrentDateStr()+"."+imageFile.getOriginalFilename().split("\\.")[1];
			imageFile.transferTo(new File(filePath+"static/userImages/"+imageName));
			blogger.setImageName(imageName);
		}
		
		int resultTotal=bloggerService.update(blogger);
		StringBuffer result=new StringBuffer();
		if(resultTotal>0) {
			result.append("<script language='javascript'>alert('修改成功！');</script>");
		}else {
			result.append("<script language='javascript'>alert('修改失败！');</script>");
		}
		
		ResponseUtil.write(response, result);
		return null;
	}
	
	//获取博主的JSON格式
	@RequestMapping({"/find"})
	public String find(HttpServletResponse response) throws Exception {
		Blogger blogger=(Blogger)SecurityUtils.getSubject().getSession().getAttribute(Const.CURRENT_USER);
		JSONObject jsonObject=JSONObject.fromObject(blogger);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	//用户退出
	@RequestMapping({"/logout"})
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.jsp";
	}
	
	//修改密码
	@RequestMapping({"/modifyPassword"})
	public String modifyPassword(@RequestParam("id")String id,@RequestParam("newPassword")String newPassword,HttpServletResponse response) throws Exception {
		Blogger blogger=new Blogger();
		blogger.setId(Integer.parseInt(id));
		blogger.setPassword(CryptographyUtil.md5(newPassword, "amos"));
		int resultTotal=bloggerService.update(blogger);
		JSONObject result=new JSONObject();
		if(resultTotal>0) {
			result.put("success", Boolean.valueOf(true));
		}else {
			result.put("success", Boolean.valueOf(false));
		}
		ResponseUtil.write(response, result);
		return null;
	}
}
