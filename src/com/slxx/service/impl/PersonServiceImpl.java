package com.slxx.service.impl;

import java.util.LinkedHashMap;
import java.util.List;

import org.hibernate.Query;

import com.slxx.dao.impl.DaoSupport;
import com.slxx.model.Person;

import com.slxx.service.PersonService;
import com.slxx.util.QueryResult;

public class PersonServiceImpl  extends DaoSupport<Person>  implements PersonService {

	@Override
	public List findRentByHql(int userPropertier, int rentId) {
		Query query=null;
		if(userPropertier==0){
	    query=getSession().createQuery("from Rent u where 1=1 and u.isValid=true ");
	    }else{
	     query=getSession().createQuery("from Rent u where u.rentId=? and u.isValid=true ");	
	     query.setInteger(0, rentId);
	    }
		return query.list();
	}
	
	
	
}
