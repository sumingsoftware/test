package com.hsbc.hktools.contrller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DeskController {
	
	@RequestMapping(value="/desk", method={RequestMethod.GET, RequestMethod.POST})
	public String desk()
	{
		return "desk";
	}
}
