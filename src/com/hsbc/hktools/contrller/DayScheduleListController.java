package com.hsbc.hktools.contrller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hsbc.hktools.entity.DaySchedule;
import com.hsbc.hktools.service.DayScheduleService;

@Controller
public class DayScheduleListController {

	@Resource
	private DayScheduleService dayScheduleServiceImpl;

	@RequestMapping(value = "/getDaySheduleList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getDayScheduleListByLimit(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("dayShedule/daySheduleList");
		String pageSizeParam = request.getParameter("pageSize");
		int pageSize = 0;

		if (StringUtils.isNotEmpty(pageSizeParam)) {
			pageSize = Integer.parseInt(pageSizeParam);
		} else {
			pageSize = 10;
		}

		String pageNumPara = request.getParameter("page");
		int intPage = -1;
		int dayschedulecount = dayScheduleServiceImpl.getDayScheduleCount();
		int pageCount = 0;

		if (0 == dayschedulecount % pageSize) {
			pageCount = dayschedulecount / pageSize;
		} else {
			pageCount = dayschedulecount / pageSize + 1;
		}

		if (StringUtils.isNotEmpty(pageNumPara)) {
			intPage = Integer.parseInt(pageNumPara);
		} else {
			intPage = 1;
		}

		if (intPage > pageCount) {
			intPage = pageCount;
		}

		if (intPage <= 0) {
			intPage = 1;
		}

		int startPos = (intPage - 1) * pageSize + 1;

		List<DaySchedule> dayScheduleList = (List<DaySchedule>) dayScheduleServiceImpl.getDayScheduleList(startPos - 1,
				pageSize);
		view.addObject("intPage", intPage);
		view.addObject("pageCount", pageCount);
		view.addObject("dayScheduleList", dayScheduleList);
		return view;
	}

	@RequestMapping(value = "/editDaySchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView editDaySheduleById(HttpServletRequest request,
			@RequestParam("dayScheduleId") String dayScheduleId) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ModelAndView view = new ModelAndView("dayShedule/editDayShedule");
		int dayScheduleIdNum = Integer.parseInt(dayScheduleId);
		DaySchedule daySchedule = dayScheduleServiceImpl.getDayScheduleById(dayScheduleIdNum);
		daySchedule.setDayScheduleId(Integer.parseInt(dayScheduleId));
		view.addObject("daySchedule", daySchedule);
		return view;
	}

	@RequestMapping(value = "/editDayScheduleSubmit", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView editDayScheduleSubmit(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String dayScheduleId = request.getParameter("dayScheduleId");
		int dayScheduleIdNum = Integer.parseInt(dayScheduleId);
		DaySchedule daySchedule = new DaySchedule();

		String title = request.getParameter("title");
		String place = request.getParameter("place");
		String content = request.getParameter("content");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		daySchedule.setDayScheduleId(dayScheduleIdNum);
		daySchedule.setTitle(title);
		daySchedule.setPlace(place);
		daySchedule.setContent(content);
		daySchedule.setYear(year);
		daySchedule.setMonth(month);
		daySchedule.setDay(day);
		dayScheduleServiceImpl.updateDaySchedule(daySchedule);
		return this.editDaySheduleById(request, dayScheduleId);
	}

	@RequestMapping(value = "/deleteDaySchedule", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteDaySchedule(HttpServletRequest request) {
		String dayScheduleIds = request.getParameter("dayScheduleIds");
		String[] dayScheduleIdArr = dayScheduleIds.split(",");

		for (String dayScheduleId : dayScheduleIdArr) {
			int dayScheduleIdNum = Integer.parseInt(dayScheduleId);
			dayScheduleServiceImpl.deleteDaySchedule(dayScheduleIdNum);
		}

		return this.getDayScheduleListByLimit(request);
	}

	@RequestMapping(value = "/filterDaySheduleList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView filterDaySheduleList(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String title = request.getParameter("title");
		List<DaySchedule> dayScheduleList = dayScheduleServiceImpl.getDayScheduleListByTitle(title);

		ModelAndView view = new ModelAndView("dayShedule/daySheduleList");
		String pageNumPara = request.getParameter("page");
		int intPage = -1;
		int pageCount = 1;

		if (StringUtils.isNotEmpty(pageNumPara)) {
			intPage = Integer.parseInt(pageNumPara);
		} else {
			intPage = 1;
		}

		if (intPage > pageCount) {
			intPage = pageCount;
		}

		if (intPage <= 0) {
			intPage = 1;
		}

		view.addObject("intPage", intPage);
		view.addObject("pageCount", pageCount);
		view.addObject("dayScheduleList", dayScheduleList);
		return view;
	}
}
