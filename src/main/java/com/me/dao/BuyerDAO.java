package com.me.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.me.pojo.Buyer;
import com.me.pojo.BuyerProperty;
import com.me.pojo.Messages;
import com.me.pojo.Property;
import com.me.pojo.Review;
import com.me.pojo.User;

public class BuyerDAO extends DAO {

	public Property viewProperty(int id) {
		try {
			begin();
			Query q = getSession().createQuery("from Property where id = :id");

			q.setParameter("id", id);
			Property property = (Property) q.uniqueResult();
			commit();
			return property;
		} catch (Exception e) {
			System.out.println("Exception fetching the property from the database :" + e);
			return null;
		} finally {
			close();
		}
	}

	public boolean addReview(String review, int id, User user) {
		try {
			begin();
			Query q = getSession().createQuery("from Property where id = :id");
			q.setParameter("id", id);
			Property property = (Property) q.uniqueResult();
			Review review1 = new Review();
			review1.setReview(review);
			review1.setUser(user);
			getSession().save(review1);
			property.getListOfReviews().add(review1);
			getSession().saveOrUpdate(property);
			commit();
			return true;
		} catch (Exception e) {
			System.out.println("Error saving review :" + e);
			return false;
		} finally {
			close();
		}
	}

	public boolean addToFav(int id, User user) {
		try {
			begin();
			Query q = getSession().createQuery("from Buyer where user = :user");
			q.setParameter("user", user);
			Buyer buyer = (Buyer) q.uniqueResult();
			Query q1 = getSession().createQuery("from Property where id = :id");
			q1.setParameter("id", id);
			// creating buyer property
			Property property = (Property) q1.uniqueResult();
			Query q3 = getSession().createQuery("from BuyerProperty where property = :property");
			q3.setParameter("property", property);
			BuyerProperty alreadyInDb = (BuyerProperty) q3.uniqueResult();
			if (null == alreadyInDb) {
				BuyerProperty buyerProperty = new BuyerProperty();
				buyerProperty.setProperty(property);
				getSession().save(buyerProperty);
				buyer.getListOfBuyerProperty().add(buyerProperty);
				getSession().saveOrUpdate(buyer);
			}
			commit();

			return true;

		} catch (Exception e) {
			System.out.println("Exception in adding to fav :" + e);
			return false;

		} finally {
			close();
		}

	}

	public List<BuyerProperty> myFavProperties(User user) {
		try {
			begin();
			Query q = getSession().createQuery("from Buyer where user = :user");
			q.setParameter("user", user);
			Buyer buyer = (Buyer) q.uniqueResult();

			List<BuyerProperty> buyerProperties = buyer.getListOfBuyerProperty();

			commit();
			return buyerProperties;
		} catch (Exception e) {
			System.out.println("Exception fetching the property from the database :" + e);
			return null;
		} finally {
			close();
		}
	}
	
	public boolean saveMessage(String text, User buyer, int propertyId)
	{
		try {
			begin();
			Messages newMessage = new Messages();
			newMessage.setMessage(text);
			newMessage.setFromUser(buyer);
			Query q = getSession().createQuery("from Property where id = :id");
			q.setParameter("id", propertyId);
			Property property = (Property) q.uniqueResult();
			User owner = property.getSeller();
			newMessage.setToUser(owner);
			newMessage.setProperty(property);
			getSession().save(newMessage);
			commit();
			return true;
		} catch (Exception e) {
			System.out.println("Exception saving message :" + e);
			return false;
		} finally {
			close();
		}
	}
	
	public List<Messages> getMessages(User buyer, int propertyId)
	{
		try {
			begin();
			Query q = getSession().createQuery("from Property where id = :id");
			q.setParameter("id", propertyId);
			Property property = (Property) q.uniqueResult();
			Query q1 = getSession().createQuery("from Messages where property = :property and fromUser = :fromUser or toUser = :toUser");
			q1.setParameter("property", property);
			q1.setParameter("toUser", buyer);
			q1.setParameter("fromUser", buyer);
			List<Messages> messageList = q1.list();
			commit();
			return messageList;
		} catch (Exception e) {
			System.out.println("Exception saving message :" + e);
			return null;
		} finally {
			close();
		}
	}
	
	/*public List<Property> sortProperty(String baths,String rooms,String propFor,String location)
	{
		try {
			begin();
			Criteria c = getSession().createCriteria(Property.class)
			       .add(Restrictions.eq("propertyFor", propFor));
			  /*.add(Restrictions.eq("noOfBath", baths))
			  .add(Restrictions.eq("noOfBedrooms", rooms))
			  .add(Restrictions.like("address", location, MatchMode.ANYWHERE));
			List<Property> listOfProperties = c.list();
			commit();
			return listOfProperties;
		} catch (Exception e) {
			System.out.println("Exception saving message :" + e);
			return null;
		} finally {
			close();
		}*/
		
	//}

}
