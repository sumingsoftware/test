package com.hsbc.hktools.contrller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.Contacts;
import com.hsbc.hktools.service.ContactsService;

@Controller
public class CommunicationWarningController {

	@Resource
	private ContactsService contactsServiceImpl;
	
	@RequestMapping(value="/birthdayWarning", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getCommunicationWarning(HttpServletRequest request)
	{
		ModelAndView modelAndView = new ModelAndView("communication/birthdayWarning");
		List<Contacts> leftContactsList = contactsServiceImpl.getWarningContacts();
		modelAndView.addObject("leftContactsList", leftContactsList);
		return modelAndView;
	}
}
