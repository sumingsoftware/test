package com.hsbc.hktools.contrller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.SystemInfo;
import com.hsbc.hktools.service.SystemInfoService;

@Controller
public class SystemInfoController {
	
	@Resource
	private SystemInfoService systemInfoServiceImpl;
	
	@RequestMapping(value="/getSystemInfo")
	public ModelAndView getSystemInfo(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView();
		//String newPassword = request.getParameter("newPassword");
		int id = 1;
		SystemInfo systemInfo = systemInfoServiceImpl.getSystemInfo(id);
		view.addObject("systemInfo", systemInfo);
		view.setViewName("system/para");
		return view;
	}
	
	@RequestMapping(value="/updateSystemInfo")
	public ModelAndView updateSystemInfo(HttpServletRequest request)
	{
		try 
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}
		
		ModelAndView view = new ModelAndView();
		//int id = 1;
		SystemInfo systemInfo = new SystemInfo();
		int id = Integer.parseInt(request.getParameter("systemInfoId"));
		String systemName =  request.getParameter("systemName");
		String author =  request.getParameter("author");
		String qq =  request.getParameter("qq");
		String telephoneNumber =  request.getParameter("telephoneNumber");
		String email =  request.getParameter("email");
		String webAddress =  request.getParameter("webAddress");
		String webName =  request.getParameter("webName");
		String nick = request.getParameter("nick");
		
		systemInfo.setId(id);
		systemInfo.setAuthor(author);
		systemInfo.setNick(nick);
		systemInfo.setSystemName(systemName);
		systemInfo.setQq(qq);
		systemInfo.setTelephoneNumber(telephoneNumber);
		systemInfo.setEmail(email);
		systemInfo.setWebAddress(webAddress);
		systemInfo.setWebName(webName);
		systemInfoServiceImpl.updateSystemInfo(systemInfo);
		view.addObject("systemInfo", systemInfo);
		view.setViewName("system/para");
		return view;
	}
}
