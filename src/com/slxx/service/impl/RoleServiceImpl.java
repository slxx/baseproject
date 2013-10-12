package com.slxx.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Query;

import com.slxx.dao.impl.DaoSupport;
import com.slxx.model.Role;

import com.slxx.service.RoleService;
import com.slxx.util.QueryResult;

public class RoleServiceImpl  extends DaoSupport<Role>  implements RoleService {

	
	/*public List findUerRoleByHql(int userId) {
		String hql = " from UserRole o where 1=1 and o.isValid=true and o.user.userId=?" ;
		
		Query query=getSession().createQuery(hql);	
		   query.setInteger(0, userId);
		return query.list();
			 
	}*/
	
	
}
