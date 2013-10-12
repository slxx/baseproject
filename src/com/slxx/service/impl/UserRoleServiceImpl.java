package com.slxx.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.slxx.dao.impl.DaoSupport;
import com.slxx.model.Menu;
import com.slxx.model.RoleMenu;
import com.slxx.model.User;
import com.slxx.model.UserRole;

import com.slxx.service.UserRoleService;
import com.slxx.service.UserService;
import com.slxx.util.QueryResult;

public class UserRoleServiceImpl  extends DaoSupport<UserRole>  implements UserRoleService {

	@Override
	public List findAssignRoleByHql(String string, int userId) {
		//select o.*,t.RoleID from sys_role o left join ( select * from Mapping_UserRole  b where b.userid=1) as t on o.RoleID=t.RoleID
	//select A,B from Sjkt A left join A.id.stgl B where A.id.sjtx.sjtxzj=?
		//Query query=getSession().createQuery("select r  from Role r left join ( select  ur   from UserRole  ur where ur.userId=1) as t on r.roleID=t.roleID");
		Query query=getSession().createQuery("select r  from Role r left join  UserRole   t on r.roleId=t.roleId");
		
		//query.setInteger(0, userId);
		return query.list();
	}

	@Override
	public void deleteAllRoleByUserId(int userId) {
	Query query=getSession().createQuery("delete  from UserRole  o where 1=1   and o.user.userId=? ");
	    query.setInteger(0, userId);
	      query.executeUpdate();
	}
	
	
	
	
		

	
}
