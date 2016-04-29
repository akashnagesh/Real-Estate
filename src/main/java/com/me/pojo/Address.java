package com.me.pojo;

import javax.persistence.Embeddable;

import org.hibernate.validator.constraints.NotEmpty;

@Embeddable
public class Address {
	
	@NotEmpty(message="This field cannot be empty")
	private String street;
	@NotEmpty(message="This field cannot be empty")
	private String city;
	@NotEmpty(message="This field cannot be empty")
	private String state;
	@NotEmpty(message="This field cannot be empty")
	private String zip;
	
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String country) {
		this.state = country;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	

}
