package com.me.pojo;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Property", uniqueConstraints = @UniqueConstraint(columnNames = { "address" }))
public class Property {
	@Id
	@GeneratedValue
	private int id;
	private String propertyType;
	private String propertyFor;
	@NotEmpty(message = "Please specify the number of baths")
	private String noOfBath;
	@NotEmpty(message = "Please specify the number of bedrooms")
	private String noOfBedrooms;
	@NotEmpty(message = "Please specify the area in sq ft")
	private String area;
	private int noOfViews;
	@OneToOne
	private User seller;
	@NotEmpty(message = "Please enter a price")
	private String price;
	@OneToMany(fetch = FetchType.EAGER)
	private List<Review> listOfReviews;
	@NotEmpty(message = "Address is mandatory")
	private String address;
	@NotEmpty(message = "Zip code is mandatory")
	private String zipcode;

	private String photoname;

	@Transient
	private MultipartFile photo;

	public String getPhotoname() {
		return photoname;
	}

	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public List<Review> getListOfReviews() {
		return listOfReviews;
	}

	public void setListOfReviews(List<Review> listOfReviews) {
		this.listOfReviews = listOfReviews;
	}

	public String getPropertyType() {
		return propertyType;
	}

	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}

	public String getNoOfBath() {
		return noOfBath;
	}

	public void setNoOfBath(String noOfBath) {
		this.noOfBath = noOfBath;
	}

	public String getNoOfBedrooms() {
		return noOfBedrooms;
	}

	public void setNoOfBedrooms(String noOfBedrooms) {
		this.noOfBedrooms = noOfBedrooms;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public User getSeller() {
		return seller;
	}

	public void setSeller(User seller) {
		this.seller = seller;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getNoOfViews() {
		return noOfViews;
	}

	public void setNoOfViews(int noOfViews) {
		this.noOfViews = noOfViews;
	}

	public String getPropertyFor() {
		return propertyFor;
	}

	public void setPropertyFor(String propertyFor) {
		this.propertyFor = propertyFor;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
