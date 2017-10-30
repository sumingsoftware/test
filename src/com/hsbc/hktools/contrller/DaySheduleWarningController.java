package com.hsbc.hktools.contrller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.DaySchedule;
import com.hsbc.hktools.service.DayScheduleService;

@Controller
public class DaySheduleWarningController {
	
	@Resource
	private DayScheduleService dayScheduleServiceImpl;
	
	@RequestMapping(value="/getDaySheduleWarning", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getDaySheduleWarning()
	{
		ModelAndView view = new ModelAndView("dayShedule/daySheduleWarning");
		List<DaySchedule> dayScheduleList = dayScheduleServiceImpl.getAllDayScheduleList();
		List<DaySchedule> leftDayScheduleList = new ArrayList<DaySchedule>();
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		long nowTime = date.getTime();
		
		for(DaySchedule daySchedule : dayScheduleList)
		{
			try {
				int year = Integer.parseInt(daySchedule.getYear());
				int month = Integer.parseInt(daySchedule.getMonth())  - 1; 
				int day = Integer.parseInt(daySchedule.getDay());
				Calendar tempCalendar = Calendar.getInstance();
				tempCalendar.set(year, month, day);
				Date oldDate = tempCalendar.getTime();
				long dayScheduleTime = oldDate.getTime();
				
				if(nowTime > dayScheduleTime)
				{
					int leftDay = (int) ((nowTime - dayScheduleTime) / (1000 * 24 * 60 * 60));
					
					if(leftDay <= 5)
					{
						daySchedule.setLeftDays(leftDay);
						leftDayScheduleList.add(daySchedule);
					}
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		view.addObject("leftDayScheduleList", leftDayScheduleList);
		return view;
	}
}
