package com.slxx.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the PB_PERSON database table.
 * 
 */

public class Person implements Serializable {


	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5888248265367424347L;

	private int personId;

	private String address;


	private String birthday;

	private String email;


	private boolean isValid;

	private String operDateTime;


	private int operUserId;


	private String personName;

	
	private String position;

	private String qq;

	
	private int sex;

	private String tel;
	
	private User user;
	
	private Rent rent;

	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Person() {
	}

	public Person(int personId) {
		super();
		this.personId = personId;
	}

	public Person(  String personName,boolean isValid) {
		super();
		this.isValid = isValid;
		this.personName = personName;
	}

	public int getPersonId() {
		return this.personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getIsValid() {
		return this.isValid;
	}

	public void setIsValid(boolean isValid) {
		this.isValid = isValid;
	}

	public String getOperDateTime() {
		return this.operDateTime;
	}

	public void setOperDateTime(String operDateTime) {
		this.operDateTime = operDateTime;
	}

	public int getOperUserId() {
		return this.operUserId;
	}

	public void setOperUserId(int operUserId) {
		this.operUserId = operUserId;
	}

	public String getPersonName() {
		return this.personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public int getSex() {
		return this.sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}