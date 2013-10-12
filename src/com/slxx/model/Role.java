package com.slxx.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Set;


/**
 * The persistent class for the Sys_Role database table.
 * 
 */

public class Role implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8960560626959649359L;


	private int roleId;

	
	private boolean isValid;

	private String operDateTime;

	
	private int operUserId;

	private Set<Rent> rents;

	private String roleExplain;


	private String roleName;


	private int rolePropertier;

	public Role() {
	}

	public Role(int roleId) {
		super();
		this.roleId = roleId;
	}


	public Role( String roleName,boolean isValid) {
		super();
		this.isValid = isValid;
		this.roleName = roleName;
	}

	public Role(int roleId, boolean isValid, String operDateTime,
			int operUserId, Set<Rent> rents, String roleExplain,
			String roleName, int rolePropertier) {
		super();
		this.roleId = roleId;
		this.isValid = isValid;
		this.operDateTime = operDateTime;
		this.operUserId = operUserId;
		this.rents = rents;
		this.roleExplain = roleExplain;
		this.roleName = roleName;
		this.rolePropertier = rolePropertier;
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


	

	public int getRoleId() {
		return roleId;
	}



	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}



	public int getOperUserId() {
		return operUserId;
	}



	public void setOperUserId(int operUserId) {
		this.operUserId = operUserId;
	}



	
	public Set<Rent> getRents() {
		return rents;
	}



	public void setRents(Set<Rent> rents) {
		this.rents = rents;
	}



	public String getRoleExplain() {
		return this.roleExplain;
	}

	public void setRoleExplain(String roleExplain) {
		this.roleExplain = roleExplain;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public int getRolePropertier() {
		return this.rolePropertier;
	}

	public void setRolePropertier(int rolePropertier) {
		this.rolePropertier = rolePropertier;
	}

}