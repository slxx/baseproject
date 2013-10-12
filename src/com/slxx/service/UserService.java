package com.slxx.service;

import java.util.List;
import java.util.Map;

import com.slxx.dao.DAO;
import com.slxx.model.User;

public interface UserService extends DAO<User>{

	//public boolean checkUser(String userName, String password);
	public Map<String,List>  searchMenuByUserId(int userPropertier, int userId);

}
