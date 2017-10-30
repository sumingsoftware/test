package com.hsbc.hktools.contrller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.DaySchedule;
import com.hsbc.hktools.service.DayScheduleService;

@Controller
public class AddDaySheduleController {
	
	@Resource
	private DayScheduleService dayScheduleServiceImpl;
	
	@RequestMapping(value="/addDayShedule", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addDayShedule(HttpServletRequest request)
	{
		ModelAndView view = new ModelAndView("dayShedule/addDayShedule");
		return view;
	}
	
	@RequestMapping(value="/addDaySheduleSubmit", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addDaySheduleSubmit(HttpServletRequest request, HttpServletResponse response)
	{
		try 
		{
			request.setCharacterEncoding("UTF-8");
		} 
		catch (UnsupportedEncodingException e) 
		{
			e.printStackTrace();
		}
		
		String title = request.getParameter("title");
		String place = request.getParameter("place");
		String content = request.getParameter("content");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		DaySchedule daySchedule = new DaySchedule();
		daySchedule.setTitle(title);
		daySchedule.setPlace(place);
		daySchedule.setContent(content);
		daySchedule.setYear(year);
		daySchedule.setMonth(month);
		daySchedule.setDay(day);
		dayScheduleServiceImpl.insertDaySchedule(daySchedule);
		
		ModelAndView view = new ModelAndView("dayShedule/addDayShedule");
		return view;
	}
}
