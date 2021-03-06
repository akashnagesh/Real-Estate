package com.me.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.Valid;

@Entity
public class BuyerProperty {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	
	@Valid
	@OneToOne(cascade = CascadeType.ALL)
	
	private Property property;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public Property getProperty() {
		return property;
	}
	public void setProperty(Property property) {
		this.property = property;
	}


}
