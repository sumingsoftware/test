package com.hsbc.hktools.contrller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsbc.hktools.service.AdminPassWordService;

@Controller
public class PasswordController {
	
	@Resource
	private AdminPassWordService adminPassWordServiceImpl;
	
	@RequestMapping(value="/password", produces = "text/html; charset=UTF-8")
	public String password(HttpServletRequest request)
	{
		return "system/password";
	}
	
	@RequestMapping(value="/updatePassword", produces = "text/html; charset=UTF-8")
	public String updatePassword(HttpServletRequest request)
	{
		String newPassword = request.getParameter("newPassword");
		adminPassWordServiceImpl.updateAdminPassWord(newPassword);
		return "system/password";
	}
}
