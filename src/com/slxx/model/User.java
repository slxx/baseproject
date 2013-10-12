package com.slxx.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the PB_User database table.
 * 
 */

public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4505525466005182232L;


	private int userId;

	
	private String account;

	
	private boolean isValid;

	
	private String operDateTime;

	
	private int operUserId;


	private String passWord;
/**
 *状态0 未审批 1 审批通过 2审批退回
 */
	private int status;

	
	private Rent rent;

	
	private String userName;

	
	private int userPropertier;
	
	private Person person;

	public Person getPerson() {
		return person;
	}



	public void setPerson(Person person) {
		this.person = person;
	}



	public User() {
	}

	
	
	public User(int userId) {
		super();
		this.userId = userId;
	}



	public User(String passWord, String userName,boolean isValid) {
		super();
		this.passWord = passWord;
		this.userName = userName;
		this.isValid = isValid;
	}



	public User(int userId, String account, boolean isValid,
			String operDateTime, int operUserId, String passWord, Rent rent,
			String userName, int userPropertier) {
		super();
		this.userId = userId;
		this.account = account;
		this.isValid = isValid;
		this.operDateTime = operDateTime;
		this.operUserId = operUserId;
		this.passWord = passWord;
		this.rent = rent;
		this.userName = userName;
		this.userPropertier = userPropertier;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public boolean getIsValid() {
		return this.isValid;
	}

	public void setIsValid(boolean isValid) {
		this.isValid = isValid;
	}
	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public void setValid(boolean isValid) {
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
		this.operUserId= operUserId;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserPropertier() {
		return this.userPropertier;
	}

	public void setUserPropertier(int userPropertier) {
		this.userPropertier = userPropertier;
	}

}