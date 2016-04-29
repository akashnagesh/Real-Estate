package com.me.pojo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Buyer {

	@Id @GeneratedValue
	private int id;
	
	@OneToOne
	private User user;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	private List<BuyerProperty> listOfBuyerProperty;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<BuyerProperty> getListOfBuyerProperty() {
		return listOfBuyerProperty;
	}

	public void setListOfBuyerProperty(List<BuyerProperty> listOfBuyerProperty) {
		this.listOfBuyerProperty = listOfBuyerProperty;
	}
	
	
	
}
