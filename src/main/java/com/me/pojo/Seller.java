package com.me.pojo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity

public class Seller {
	
	@Id @GeneratedValue
	private int id;
	
	@OneToMany(cascade=CascadeType.ALL)
	private List<SellerProperty> listOfProperty;
	
	@OneToOne
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<SellerProperty> getListOfProperty() {
		return listOfProperty;
	}

	public void setListOfProperty(List<SellerProperty> listOfProperty) {
		this.listOfProperty = listOfProperty;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
