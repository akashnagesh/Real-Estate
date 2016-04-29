package com.me.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.dao.BuyerDAO;
import com.me.pojo.BuyerProperty;
import com.me.pojo.Messages;
import com.me.pojo.Property;
import com.me.pojo.User;

@Controller
public class BuyerController {
	
	
	@Autowired
	BuyerDAO buyerDAO;

	@RequestMapping(value = "/viewpropertydetailsbuyer.htm", method = RequestMethod.GET)
	public String buyerPropertyDetails(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("buyer")) {
			return "signinbuyer";
		}
		int id =Integer.parseInt(request.getParameter("id"));
		Property propertyFromDB = buyerDAO.viewProperty(id);
		if(null != propertyFromDB)
		{
			User user = (User) session.getAttribute("loggedInUser");
			request.setAttribute("selectedProperty", propertyFromDB);
			request.setAttribute("loggedInUser",user);
			List<Messages> messageList = buyerDAO.getMessages(user, id);
			if(null != messageList)
			{
				request.setAttribute("messageList", messageList);
			}
			
		}
		
		return "viewpropertydetailsbuyer";

	}
	@RequestMapping(value = "/addreview.htm", method = RequestMethod.POST)
	public String addReview(HttpServletRequest request,Model model)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		String review = request.getParameter("review");
		User user = (User)request.getSession().getAttribute("loggedInUser");
		buyerDAO.addReview(review, id, user);
		Property propertyFromDB = buyerDAO.viewProperty(id);
		if(null != propertyFromDB)
		{
			request.setAttribute("selectedProperty", propertyFromDB);
			request.setAttribute("loggedInUser",user);
			List<Messages> messageList = buyerDAO.getMessages(user, id);
			if(null != messageList)
			{
				request.setAttribute("messageList", messageList);
			}
		}
		return "viewpropertydetailsbuyer";
	}
	
	@RequestMapping(value = "/addtofav.htm", method = RequestMethod.GET)
	public void addToFav(HttpServletRequest request,HttpServletResponse response)
	{
		JSONObject obj = new JSONObject();
		PrintWriter out = null;
		HttpSession session = request.getSession();
		try {
		int id = Integer.parseInt(request.getParameter("propertyId"));	
		User buyer = (User)session.getAttribute("loggedInUser");
		boolean result = buyerDAO.addToFav(id, buyer);
		out=response.getWriter();
		if(result)
		obj.put("result", "success");
		out.println(obj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@RequestMapping(value = "/favproperties.htm", method = RequestMethod.GET)
	public ModelAndView viewFavProperties(ModelAndView mv,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		if (null == session.getAttribute("loggedInUser")
				|| !((User) session.getAttribute("loggedInUser")).getRole().equalsIgnoreCase("buyer")) {
			mv.setViewName("signin");
			return mv;
		}
		User user = (User) request.getSession().getAttribute("loggedInUser");
		List<BuyerProperty> buyerProperties = buyerDAO.myFavProperties(user);
		mv.addObject("buyerProperties", buyerProperties);
		mv.setViewName("viewbuyerfavproperties");
		return mv;
	}
	
	@RequestMapping(value = "/favproperties.htm", method = RequestMethod.POST)
	public void requestMoreInfo(HttpServletRequest request,HttpServletResponse response)
	{
		User buyer = (User) request.getSession().getAttribute("loggedInUser");
		String text = request.getParameter("comment");
		int propertyId = Integer.parseInt(request.getParameter("propertyId"));
		boolean result = buyerDAO.saveMessage(text, buyer, propertyId);
		if(result)
		try {
			PrintWriter out = response.getWriter();
			out.println("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
/*	@RequestMapping(value = "/sortProperty.htm", method = RequestMethod.POST)
	public ModelAndView sortProperty(ModelAndView mv,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String rooms = request.getParameter("propBedrooms");
		String baths = request.getParameter("propBaths");
		String propFor = request.getParameter("propFor");
		String location = request.getParameter("location");
		
		List<Property> buyerProperties = buyerDAO.sortProperty(baths, rooms, propFor,location);
		if(null != buyerProperties)
		System.out.println("total number of properties:" + buyerProperties.size());
		
		mv.addObject("listOfProperties", buyerProperties);
		mv.setViewName("viewallproperties");
		return mv;
	}*/
	


}
