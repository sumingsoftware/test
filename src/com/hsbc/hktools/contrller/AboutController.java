package com.hsbc.hktools.contrller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.SystemInfo;
import com.hsbc.hktools.service.SystemInfoService;

@Controller
public class AboutController {
	
	@Resource
	SystemInfoService systemInfoServiceImpl;
	
	@RequestMapping(value="/about", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView about()
	{
		SystemInfo systemInfo = systemInfoServiceImpl.getSystemOneInfo();
		ModelAndView modelAndView = new ModelAndView("about/about");
		modelAndView.addObject("systemInfo", systemInfo);
		return modelAndView;
	}
}
