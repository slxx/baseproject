package com.slxx.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Query;

import com.slxx.dao.impl.DaoSupport;
import com.slxx.model.RoleMenu;
import com.slxx.model.User;
import com.slxx.model.UserRole;

import com.slxx.service.RoleMenuService;
import com.slxx.service.UserRoleService;
import com.slxx.service.UserService;
import com.slxx.util.QueryResult;

public class RoleMenuServiceImpl  extends DaoSupport<RoleMenu>  implements RoleMenuService {
	public   void deleteAllMenuByRoleId(int roleId){
		Query query=getSession().createQuery("delete  from RoleMenu  o where 1=1   and o.role.roleId=? ");
	    query.setInteger(0, roleId);
	      query.executeUpdate();
	}
	
}
