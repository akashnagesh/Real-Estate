package com.me.dao;

import java.util.List;

import org.hibernate.Query;

import com.me.pojo.Messages;
import com.me.pojo.Property;
import com.me.pojo.SellerProperty;
import com.me.pojo.User;

public class SellerDAO extends DAO {
	
	public boolean addPropertyToDataBase(SellerProperty sellerProperty)
	{
		try {
			begin();
			getSession().save(sellerProperty);
			commit();
			return true;
		} catch (Exception e) {
			rollback();
			System.out.println("Error saving the seller property inside SellerDAO , method addPropertyToDataBase :" + e.getMessage());
			return false;
		} finally {
			close();
		}

	}
	
	public List<Property> getMyListOfProperties(User user,int offset)
	{
		try {
			begin();
			Query q = getSession().createQuery("from Property where seller_userId ="+user.getUserId());
			q.setFirstResult(offset);
			q.setMaxResults(6);
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
	
	public Property viewProperty(int id)
	{
		try{
			begin();
			Query q = getSession().createQuery("from Property where id = :id");
			
			q.setParameter("id", id);
			Property property = (Property)q.uniqueResult();
			commit();		
			return property;
		}catch(Exception e)
		{
			System.out.println("Exception fetching the property from the database :"+e);
			return null;
		}
		finally{
			close();
		}
	}

	public List<Messages> viewMessages(User seller)
	{
		try{
			begin();
			Query q = getSession().createQuery("from Messages where toUser = :toUser");
			
			q.setParameter("toUser", seller);
			List<Messages> listOfMessages = q.list();
			commit();		
			return listOfMessages;
		}catch(Exception e)
		{
			System.out.println("Exception fetching the property from the database :"+e);
			return null;
		}
		finally{
			close();
		}
	}
	
	public boolean reply(int msgId,String reply)
	{
		try{
			begin();
			Query q = getSession().createQuery("from Messages where id = :id");
			
			q.setParameter("id", msgId);
			Messages msg = (Messages)q.uniqueResult();
			msg.setReply(reply);
			getSession().saveOrUpdate(msg);
			commit();		
			return true;
		}catch(Exception e)
		{
			System.out.println("Exception fetching the property from the database :"+e);
			return false;
		}
		finally{
			close();
		}
	}

}
