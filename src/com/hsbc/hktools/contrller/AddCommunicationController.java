package com.hsbc.hktools.contrller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.Contacts;
import com.hsbc.hktools.entity.GroupName;
import com.hsbc.hktools.service.ContactsService;
import com.hsbc.hktools.service.GroupNameService;

@Controller
public class AddCommunicationController {
	
	@Resource
	private GroupNameService groupNameServiceImpl;
	
	@Resource
	private ContactsService contactsServiceImpl;
	
	@RequestMapping(value="/addCommunication", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addCommunication()
    {
		ModelAndView modelAndView = new ModelAndView();
		List<GroupName> groupNameList = groupNameServiceImpl.getGroupNames();
		modelAndView.addObject("groupNameList", groupNameList);
		modelAndView.setViewName("communication/addCommunication");
    	return modelAndView;
    }
	
	@RequestMapping(value="/addContactSubmit", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addContactSubmit(HttpServletRequest request)
    {
		try 
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}
		
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		String telephone = (String)request.getParameter("telephone");
		String qq = (String)request.getParameter("qq");
		String email = (String)request.getParameter("email");
		String workplace = (String)request.getParameter("workPlace");
		String address = (String)request.getParameter("address");
		Contacts contact = new Contacts();
		contact.setName(name);
		contact.setSex(sex);
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month - 1, day);
		contact.setBirthday(calendar.getTime());
		contact.setGroupId(groupId);
		contact.setTelephone(telephone);
		contact.setQq(qq);
		contact.setEmail(email);
		contact.setWorkplace(workplace);
		contact.setAddress(address);
		contactsServiceImpl.insertContact(contact);
		
		ModelAndView modelAndView = new ModelAndView();
		List<GroupName> groupNameList = groupNameServiceImpl.getGroupNames();
		modelAndView.addObject("groupNameList", groupNameList);
		modelAndView.setViewName("communication/addCommunication");
    	return modelAndView;
    }
	
	@RequestMapping(value="/editContacts", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView editContactsById(HttpServletRequest request, @RequestParam("contactsId") String contactsId)
	{
		try 
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}
		
		ModelAndView modelAndView = new ModelAndView("communication/editCommunication");
		int contactsIdNum = Integer.parseInt(contactsId);
		Contacts contacts = contactsServiceImpl.getContactsById(contactsIdNum);
		
		Calendar calander = Calendar.getInstance();
		calander.setTime(contacts.getBirthday());
		int year = calander.get(Calendar.YEAR);
		int month = calander.get(Calendar.MONTH);
		int day = calander.get(Calendar.DATE);
		
		boolean isMan = contacts.getSex().equals("男");
		String groupName = contacts.getGroupName();
		
		List<GroupName> groupNameList = groupNameServiceImpl.getGroupNames();
		modelAndView.addObject("groupNameList", groupNameList);
		modelAndView.addObject("contacts", contacts);
		modelAndView.addObject("year", year);
		modelAndView.addObject("month", month);
		modelAndView.addObject("day", day);
		modelAndView.addObject("isMan", isMan);
		modelAndView.addObject("groupName", groupName);
		return modelAndView;
	}
	
	@RequestMapping(value="/updateContactSubmit", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateContactSubmit(HttpServletRequest request)
	{
		try 
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}
		
		int id = Integer.parseInt(request.getParameter("contactId"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int groupId = Integer.parseInt(request.getParameter("groupId"));
		String telephone = (String)request.getParameter("telephone");
		String qq = (String)request.getParameter("qq");
		String email = (String)request.getParameter("email");
		String workplace = (String)request.getParameter("workPlace");
		String address = (String)request.getParameter("address");
		Contacts contact = new Contacts();
		contact.setId(id);
		contact.setName(name);
		contact.setSex(sex);
		Calendar calendar = Calendar.getInstance() ;
		calendar.set(year, month - 1, day);
		contact.setBirthday(calendar.getTime());
		contact.setGroupId(groupId);
		contact.setTelephone(telephone);
		contact.setQq(qq);
		contact.setEmail(email);
		contact.setWorkplace(workplace);
		contact.setAddress(address);
		contactsServiceImpl.updateContact(contact);
		
		return this.editContactsById(request, String.valueOf(id));
	}
	
	@RequestMapping(value="/communicationList", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView addCommunication(HttpServletRequest request)
    {
		String pageSizeParam = request.getParameter("pageSize");
		int pageSize = 0;
		
		if(StringUtils.isNotEmpty(pageSizeParam))
		{
			pageSize = Integer.parseInt(pageSizeParam);
		}
		else
		{
			pageSize = 10;
		}
		
		String pageNumPara = request.getParameter("page");
		int intPage = -1;
		int dayschedulecount = contactsServiceImpl.getContactsCount();
		int pageCount = 0;
		
		if(0 == dayschedulecount % pageSize)
		{
			pageCount = dayschedulecount / pageSize;
		}
		else
		{
			pageCount = dayschedulecount / pageSize + 1;
		}
		
		if(StringUtils.isNotEmpty(pageNumPara))
		{
			intPage = Integer.parseInt(pageNumPara);
		}
		else
		{
			intPage = 1;
		}
		
		if(intPage > pageCount)
		{
			intPage = pageCount;
		}
		
		if(intPage <= 0)
		{
			intPage = 1;
		}
		
		int startPos = (intPage - 1) * pageSize + 1;
		
		ModelAndView modelAndView = new ModelAndView();
		List<GroupName> groupNameList = groupNameServiceImpl.getGroupNames();
		List<Contacts> contactsList = contactsServiceImpl.getContactsByLimit(startPos - 1, pageSize);
		modelAndView.addObject("groupNameList", groupNameList);
		modelAndView.addObject("contactsList", contactsList);
		modelAndView.addObject("intPage", intPage);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.setViewName("communication/communicationList");
    	return modelAndView;
    }
	
	@RequestMapping(value="/deleteContacts", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteContacts(HttpServletRequest request)
	{
		String contactIds = request.getParameter("contactIds");
		String[] contactIdsArr = contactIds.split(",");
		
		for(String str : contactIdsArr)
		{
			int contactId = Integer.parseInt(str);
			
			contactsServiceImpl.deleteContact(contactId);
		}
		
		return this.addCommunication(request);
	}
	
	@RequestMapping(value="/filterContactList", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView filterContactList(HttpServletRequest request)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = request.getParameter("name");
		String groupId = request.getParameter("groupId");
		List<Contacts> contactsList = new ArrayList<Contacts>(); 
				
		
		if(StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(groupId))
		{
			contactsList = contactsServiceImpl.getDayContactListByNameAndGroupId(name, Integer.parseInt(groupId));
		}
		else if(!StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(groupId))
		{
			contactsList = contactsServiceImpl.getDayContactListByGroupId(Integer.parseInt(groupId));
		}
		else if(StringUtils.isNotEmpty(name) && !StringUtils.isNotEmpty(groupId))
		{
			contactsList = contactsServiceImpl.getDayContactListByName(name);
		}

		
		int intPage = -1;
		int pageCount = 1;
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		List<GroupName> groupNameList = groupNameServiceImpl.getGroupNames();
		modelAndView.addObject("groupNameList", groupNameList);
		modelAndView.addObject("contactsList", contactsList);
		modelAndView.addObject("intPage", intPage);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.setViewName("communication/communicationList");
    	return modelAndView;
	}
}
