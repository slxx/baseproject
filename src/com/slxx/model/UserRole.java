package com.slxx.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Mapping_UserRole database table.
 * 
 */

public class UserRole implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 4366934628418654116L;


	private int id;


	private boolean isValid;


	private String operDateTime;


	private int operUserId;

	private Role role;

	private User user;

	public UserRole() {
	}

	public UserRole(int id) {
		super();
		this.id = id;
	}

	public UserRole(Role role) {
		super();
		this.role = role;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}