package com.hsbc.hktools.contrller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExitController {
	@RequestMapping(value = "/exit", method = { RequestMethod.GET, RequestMethod.POST })
	public String exitSystem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getSession().setAttribute("username", "");
		//request.getRequestDispatcher("index.jsp").forward(request, response);
		return "redirect:/index.jsp";
	}
}
