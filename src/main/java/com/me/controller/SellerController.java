package com.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.me.dao.SellerDAO;
import com.me.helper.AddImages;
import com.me.pojo.Messages;
import com.me.pojo.Property;
import com.me.pojo.SellerProperty;
import com.me.pojo.User;

@Controller
public class SellerController {

	@Autowired
	SellerDAO sellerDAO;

	@RequestMapping(value = "/addProperty.htm", method = RequestMethod.GET)
	public String sellerHome(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("seller")) {
			return "signin";
		}

		return "addProperty";
	}

	@RequestMapping(value = "/postProperty.htm", method = RequestMethod.POST)
	public String postProperty(@Valid @ModelAttribute("sellerProperty") SellerProperty sellerProperty,
			BindingResult bindingResult, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("seller")) {
			return "signin";
		}
		if (bindingResult.hasErrors()) {
			return "addProperty";
		}
		User seller = (User) request.getSession().getAttribute("loggedInUser");
		sellerProperty.getProperty().setSeller(seller);
		String fileNameWithExtension = AddImages.savePhoto(sellerProperty.getProperty().getPhoto());
		if (null != fileNameWithExtension) {
			sellerProperty.getProperty().setPhotoname(fileNameWithExtension);
		}

		boolean result = sellerDAO.addPropertyToDataBase(sellerProperty);
		if (result)
			model.addAttribute("result", "success");
		else
			model.addAttribute("result", "failure");
		return "addProperty";
	}

	@RequestMapping(value = "/viewSellerProperties.htm", method = RequestMethod.GET)
	public ModelAndView sellerProperties(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("seller")) {
			mv.setViewName("signin");
			return mv;
		}
		User user = (User) request.getSession().getAttribute("loggedInUser");
		List<Property> propertyList = sellerDAO.getMyListOfProperties(user, 0);
		mv.addObject("myProperties", propertyList);
		mv.setViewName("viewSellerProperties");
		return mv;
	}

	@RequestMapping(value = "/viewSellerPropertiesajx.htm", method = RequestMethod.GET)
	public void sellerPropertiesAjax(HttpServletRequest request, HttpServletResponse response) {
		int count;
		if (null == request.getParameter("count"))
			count = 0;
		else
			count = Integer.parseInt(request.getParameter("count"));
		User user = (User) request.getSession().getAttribute("loggedInUser");
		List<Property> propertyList = sellerDAO.getMyListOfProperties(user, count);
		JSONObject object = new JSONObject();
		object.put("jsonData", propertyList);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("Unable to get writer in AJAX call:" + e);
		}

		out.println(object);
	}

	@RequestMapping(value = "/viewpropertydetails.htm", method = RequestMethod.GET)
	public String viewPropertyDetails(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("seller")) {
			return "signin";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Property propertyFromDB = sellerDAO.viewProperty(id);
		if (null != propertyFromDB) {
			request.setAttribute("selectedProperty", propertyFromDB);
		}

		return "viewpropertydetailsseller";
	}

	@RequestMapping(value = "/sellerMessages.htm", method = RequestMethod.GET)
	public ModelAndView viewSellerMessages(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("seller")) {
			mv.setViewName("signin");
			return mv;
		}

		User seller = (User) request.getSession().getAttribute("loggedInUser");
		List<Messages> listOfMessages = sellerDAO.viewMessages(seller);
		mv.addObject("listOfMessages", listOfMessages);
		mv.setViewName("viewsellermessages");
		return mv;
	}

	// reply to messages

	@RequestMapping(value = "/reply.htm", method = RequestMethod.POST)
	public void reply(HttpServletRequest request) {

		PrintWriter out = null;
		int msgId = Integer.parseInt(request.getParameter("msgId"));
		String reply = request.getParameter("actualMsg");
		sellerDAO.reply(msgId, reply);

	}
}
