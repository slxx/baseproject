package com.slxx.service;

import java.util.List;

import com.slxx.dao.DAO;
import com.slxx.model.RoleMenu;
import com.slxx.model.User;

public interface RoleMenuService extends DAO<RoleMenu>{
	public   void  deleteAllMenuByRoleId(int roleId);

}
