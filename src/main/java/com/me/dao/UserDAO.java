package com.me.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.pojo.Buyer;
import com.me.pojo.Messages;
import com.me.pojo.Property;
import com.me.pojo.Seller;
import com.me.pojo.User;

public class UserDAO extends DAO {

	public boolean createBuyer(User user) {

		try {
			begin();
			user.setStatus("active");
			getSession().save(user);
			Buyer buyer = new Buyer();
			buyer.setUser(user);
			getSession().save(buyer);
			commit();
			return true;
		} catch (Exception e) {
			rollback();
			System.out.println("Error saving the user :" + e.getMessage());
			return false;
		} finally {
			close();
		}

	}

	public boolean createSeller(User user) {

		try {
			begin();
			user.setStatus("deactive");
			getSession().save(user);
			Seller seller = new Seller();
			seller.setUser(user);
			getSession().save(seller);
			commit();
			return true;
		} catch (Exception e) {
			rollback();
			System.out.println("Error saving the user :" + e.getMessage());
			return false;
		} finally {
			close();
		}

	}

	public boolean createAdmin(User user) {

		try {
			begin();
			user.setStatus("Active");
			Serializable s = getSession().save(user);
			System.out.println(s);
			commit();
			return true;
		} catch (Exception e) {
			rollback();
			System.out.println("Error saving the user :" + e.getMessage());
			return false;
		} finally {
			close();
		}

	}

	public User loginUser(User user)

	{
		try {
			begin();
			Query q = getSession().createQuery("from User where email = :email and password = :password");
			q.setString("email", user.getEmail());
			q.setString("password", user.getPassword());
			User user1 = (User) q.uniqueResult();
			commit();
			return user1;
		} catch (HibernateException e) {
			rollback();
			System.out.println("Could not fetch record from db:" + e);
			return null;
		} finally {
			close();
		}

	}

	public List<User> getListOfUsers() {
		try {
			begin();
			Query q = getSession().createQuery("from User where role = :role");
			q.setString("role", "Seller");
			List<User> list = q.list();
			commit();

			return list;
		} catch (Exception e) {
			System.out.println("Could not fetch list of Users:" + e);
			return null;
		} finally {
			close();
		}
	}

	// function to activate or de-activate user
	public boolean activateUser(String email, String status) {

		System.out.println(email + ":" + status);
		int result = 0;
		try {
			begin();
			String hql = "UPDATE User set status = :status WHERE email = :email";
			Query q = getSession().createQuery(hql);
			q.setParameter("status", status);
			q.setParameter("email", email);
			result = q.executeUpdate();
			if (result > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.out.println("Exception in changing status:" + e);
			return false;
		} finally {
			close();
		}
	}




	public List<Property> viewProperties(String location) {
		try {
			begin();
			Query q = getSession().createQuery("from Property where address Like :address");
			q.setParameter("address", "%" + location + "%");
			List<Property> list = q.list();
			commit();

			return list;
		} catch (Exception e) {
			System.out.println("Could not fetch list of Users:" + e);
			return null;
		} finally {
			close();
		}
	}

	public int unreadMsgs(User user) {
		try {
			begin();
			Query q = getSession().createQuery("from Messages where toUser = :toUser and reply = null");
			q.setParameter("toUser", user);
			List<Messages> list = q.list();
			commit();
			return list.size();
		} catch (Exception e) {
			System.out.println("Could not fetch list of Users:" + e);
			return 0;
		} finally {
			close();
		}
	}
	
	public boolean checkMail(String email)
	{
		try {
			begin();
			Query q = getSession().createQuery("from User where email = :email");
			q.setParameter("email", email);
			User u = (User)q.uniqueResult();
			commit();
			if(null != u)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.out.println("Could not fetch list of Users:" + e);
			return false;
		} finally {
			close();
		}
	}

}
