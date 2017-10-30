package com.hsbc.hktools.contrller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hsbc.hktools.entity.User;
import com.hsbc.hktools.service.UserService;

@Controller
public class CheckLoginController {
	
	@Resource
	private UserService userServiceImpl;
	
	@RequestMapping(value="/checkLogin", method={RequestMethod.GET, RequestMethod.POST})
	public String checkLogin(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getParameter("username");
		
		User user = userServiceImpl.getUser(userName);
		
		
		if(null == user)
		{
			return "redirect:/index.jsp";
		}
		else
		{
			request.getSession().setAttribute("adminName", userName);
			DateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			String dateStr = dateFormat.format(new Date());
			request.setAttribute("dateStr", dateStr);
			return "main";
		}
	}
}
