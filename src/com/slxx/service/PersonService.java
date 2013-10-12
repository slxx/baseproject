package com.slxx.service;

import java.util.List;

import com.slxx.dao.DAO;
import com.slxx.model.Person;

public interface PersonService extends DAO<Person>{

	public List findRentByHql(int userPropertier, int rentId);



}
