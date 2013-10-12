package com.slxx.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Mapping_RoleMenu database table.
 * 
 */

public class RoleMenu implements Serializable {



	/**
	 * 
	 */
	private static final long serialVersionUID = -4945284133398342310L;

	private int id;

	private boolean isValid;

	private Menu menu;


	private String operDateTime;

	private int operUserId;

	private Rent rent;
	
	private Role role;
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public RoleMenu() {
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

	

}