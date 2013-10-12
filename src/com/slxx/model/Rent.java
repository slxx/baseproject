package com.slxx.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;


/**
 * The persistent class for the Sys_Rent database table.
 * 
 */

public class Rent implements Serializable {


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3982944024557401183L;

	private int rentId;

	private String connecter;

	
	private String createTime;

	private String email;

	private int isPay;

	private boolean isValid;

	
	private String operDateTime;

	private int operUserId;

	private String qq;


	private String rentName;

	private int rentProperties;

	
	private String tel;
	private Set<User> users;


	public Set<User> getUsers() {
		return users;
	}


	public void setUsers(Set<User> users) {
		this.users = users;
	}


	public Rent() {
	}

	
	public Rent(int rentId) {
		super();
		this.rentId = rentId;
	}


	public Rent(int rentId, String connecter, String createTime, String email,
			int isPay, boolean isValid, String operDateTime, int operUserId,
			String qq, String rentName, int rentProperties, String tel) {
		super();
		this.rentId = rentId;
		this.connecter = connecter;
		this.createTime = createTime;
		this.email = email;
		this.isPay = isPay;
		this.isValid = isValid;
		this.operDateTime = operDateTime;
		this.operUserId = operUserId;
		this.qq = qq;
		this.rentName = rentName;
		this.rentProperties = rentProperties;
		this.tel = tel;
	}


	public String getConnecter() {
		return this.connecter;
	}

	public void setConnecter(String connecter) {
		this.connecter = connecter;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIsPay() {
		return this.isPay;
	}

	public void setIsPay(int isPay) {
		this.isPay = isPay;
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

	

	public int getRentId() {
		return rentId;
	}


	public void setRentId(int rentId) {
		this.rentId = rentId;
	}


	public int getOperUserId() {
		return operUserId;
	}


	public void setOperUserId(int operUserId) {
		this.operUserId = operUserId;
	}


	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getRentName() {
		return this.rentName;
	}

	public void setRentName(String rentName) {
		this.rentName = rentName;
	}

	public int getRentProperties() {
		return this.rentProperties;
	}

	public void setRentProperties(int rentProperties) {
		this.rentProperties = rentProperties;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}