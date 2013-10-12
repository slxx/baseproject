package com.slxx.service;

import java.util.List;

import com.slxx.dao.DAO;
import com.slxx.model.UserRole;

public interface UserRoleService extends DAO<UserRole>{

	public 	List  findAssignRoleByHql(String string, int userId);

	public   void deleteAllRoleByUserId(int userId);



	

}
