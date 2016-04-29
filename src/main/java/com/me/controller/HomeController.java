package com.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.dao.UserDAO;
import com.me.pojo.Property;
import com.me.pojo.User;

/**
 * Handles requests for the application home page.
 */
@Controller

public class HomeController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	ServletContext servletContext;

	@Autowired
	MailMail mailMail;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		return "home";
	}

	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String login() {

		return "signin";
	}

	@RequestMapping(value = "/signup.htm", method = RequestMethod.GET)
	public String signup() {

		return "signup";
	}

	@RequestMapping(value = "/registerUser.htm", method = RequestMethod.POST)
	public ModelAndView signup(@Valid @ModelAttribute("user") User user, BindingResult result, ModelAndView mv) {

		if (result.hasErrors()) {
			mv.setViewName("signup");
			return mv;
		}
		boolean status = false;
		if (user.getRole().equalsIgnoreCase("buyer")) {
			status = userDAO.createBuyer(user);
			if (status)
				try {
					mailMail.sendMail("akashnagesh25@gmail.com", user.getEmail(), "User account has been created!",
							"Hello, \n\n Your user account has been created. Please "
									+ "login to continue browsing.\n\n Regards,\n Team Perfect Property");
				} catch (Exception e) {
					System.out.println("Error sending email:" + e);
				}
		} else {
			status = userDAO.createSeller(user);
			if (status)
				try {
					mailMail.sendMail("akashnagesh25@gmail.com", user.getEmail(), "User account has been created!",
							"Hello, \n\n Your user account has been created and you will "
									+ "be able to login once the account is activated by the admin.\n\n Regards,\n Team Perfect Property");
				} catch (Exception e) {
					System.out.println("Error sending email:" + e);
				}
		}
		if (status == true) {
			mv.addObject("msg", "success");

		} else {
			mv.addObject("msg", "failure");
		}
		mv.setViewName("signup");
		return mv;
	}

	// sign up controller admin
	@RequestMapping(value = "/signupadmin.htm", method = RequestMethod.POST)
	public String signupadmin(@ModelAttribute("user") User user) {

		user.setRole("admin");
		userDAO.createAdmin(user);
		return "signup";
	}

	// All users login handler method
	@RequestMapping(value = "/userlogin.htm", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user") User user, Model mv, HttpServletRequest request) {
		User userFromDB = userDAO.loginUser(user);
		if (null != userFromDB) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedInUser", userFromDB);
			mv.addAttribute("loginMessage", "success");
			// for admin login
			if (userFromDB.getRole().equalsIgnoreCase("admin")) {

				List<User> list = userDAO.getListOfUsers();
				mv.addAttribute("listOfSellers", list);
				return "adminPage";
			}
			// for seller login
			else if (userFromDB.getRole().equalsIgnoreCase("Seller")) {

				if (userFromDB.getStatus().equalsIgnoreCase("active")) {
					int number = userDAO.unreadMsgs(userFromDB);
					request.getSession().setAttribute("unReadMsgs", number);
					return "addProperty";
				} else
					return ("accountnotactive");
			}
			// for buyer login
			else if (userFromDB.getRole().equalsIgnoreCase("Buyer")) {

				return "home";
			}
		} else {
			mv.addAttribute("loginMessage", "failure");
			return ("signin");
		}
		return "home";
	}

	@RequestMapping(value = "/logout.htm")
	public String logoutn(@ModelAttribute("user") User user, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		request.getSession().invalidate();
		return "home";

	}

	// for admin to activate or deactivate the seller
	@RequestMapping(value = "/changestatus.htm", method = RequestMethod.GET)
	@ResponseBody
	public void changeStatus(HttpServletRequest request, HttpServletResponse response) {

		JSONObject obj = new JSONObject();
		PrintWriter out = null;
		boolean result = false;
		try {
			String email = request.getParameter("emailId");
			String status = request.getParameter("status");
			out = response.getWriter();
			result = userDAO.activateUser(email, status);
			if (result)
				obj.put("status", "changed");
			else
				obj.put("status", "unchanged");
			out.println(obj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			obj.put("status", "unchanged");
			out.println(obj);
		}

	}

	@RequestMapping(value = "/viewallproperties.htm", method = RequestMethod.GET)
	public ModelAndView viewAllProperties(HttpServletRequest request, ModelAndView mv) {

		String location = request.getParameter("location");
		List<Property> prop = userDAO.viewProperties(location);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loggedInUser");
		if (null != user && user.getRole().equalsIgnoreCase("buyer"))
			mv.setViewName("viewbuyerproperties");
		else
			mv.setViewName("viewallproperties");
		mv.addObject("listOfProperties", prop);
		mv.addObject("location", location);
		return mv;
	}

	@RequestMapping(value = "/signinbuyer.htm", method = RequestMethod.GET)
	public String forcefulSignIn() {

		return "signinbuyer";
	}

	@RequestMapping(value = "/checkemail.htm", method = RequestMethod.POST)
	public void checkEmail(HttpServletRequest request, HttpServletResponse response) {

		String email = request.getParameter("email");
		try {
			PrintWriter out = response.getWriter();
			boolean result = userDAO.checkMail(email);
			JSONObject obj = new JSONObject();
			if (result) {

				obj.put("status", "exists");
				out.println(obj);

			} else {
				obj.put("status", "notexists");
				out.println(obj);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
