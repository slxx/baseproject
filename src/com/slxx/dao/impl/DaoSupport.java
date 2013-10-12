package com.slxx.dao.impl;


import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.slxx.dao.DAO;
import com.slxx.util.GenericsUtils;
import com.slxx.util.QueryResult;

public abstract class DaoSupport<T> implements DAO<T>{
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void clear(){
		getSession().clear();
	}

	public void deleteObject(Serializable ... entityids) {
		for(Object id : entityids){
			getSession().delete(getSession().get(this.entityClass, (Serializable) id));
		}
	}
	

	public void saveObject(T entity) {
		getSession().persist(entity);
	}
	

	
	
	public void updateObject(T entity) {
		getSession().merge(entity);
	}
	
	
	
	public Long getCount() {
		return (Long) getSession().createQuery("select count(o) from "+ getEntityName(this.entityClass)+ " o").uniqueResult();
		
	}
	
	public T findObject(Serializable entityId) {
		if(entityId==null) throw new RuntimeException(this.entityClass.getName()+ ":传入的实体id不能为空");
		return (T) getSession().get(this.entityClass, entityId);
	}
	public List<T> findByHql( String wherejpql, Object[] queryParams) {
		String entityname = getEntityName(this.entityClass);
	//	String sBuffer="select o from "+ entityname+ " o "+(wherejpql==null || "".equals(wherejpql.trim())? "": "where 1=1 "+ wherejpql);
		String sBuffer="select o from "+ entityname+ " o  where 1=1 and  o.isValid=true "+(wherejpql==null || "".equals(wherejpql.trim())? " ":  wherejpql);
		System.out.print(sBuffer);
		Query query = getSession().createQuery("select o from "+ entityname+ " o   where 1=1 and  o.isValid=true "+(wherejpql==null || "".equals(wherejpql.trim())? "":  wherejpql));
		setQueryParams(query, queryParams);
	    return query.list();
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult, LinkedHashMap<String, String> orderby) {
		return getScrollData(firstindex,maxresult,null,null,orderby);
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams) {
		return getScrollData(firstindex,maxresult,wherejpql,queryParams,null);
	}

	public QueryResult<T> getScrollData(int firstindex, int maxresult) {
		return getScrollData(firstindex,maxresult,null,null,null);
	}
	

	public QueryResult<T> getScrollData() {
		return getScrollData(-1, -1);
	}


	public QueryResult<T> getScrollData( int firstindex, int maxresult,String wherejpql, Object[] queryParams,LinkedHashMap<String, String> orderby) {
		QueryResult qr = new QueryResult<T>();
		String entityname = getEntityName(this.entityClass);
		Query query = getSession().createQuery("select o from "+ entityname+ " o  where 1=1 and  o.isValid=true "+(wherejpql==null || "".equals(wherejpql.trim())? "":wherejpql)+ buildOrderby(orderby));
		setQueryParams(query, queryParams);
		if(firstindex!=-1 && maxresult!=-1) 
	    query.setFirstResult(firstindex);
		query.setMaxResults(maxresult); 
		qr.setResultlist(query.list());
		query = getSession().createQuery("select count(o) from "+ entityname+ " o  where 1=1 and  o.isValid=true "+(wherejpql==null || "".equals(wherejpql.trim())? "":  wherejpql));
		setQueryParams(query, queryParams);
		qr.setTotalrecord((Long)query.uniqueResult());
		return qr;
	}


	

	protected static void setQueryParams(Query query, Object[] queryParams){
		if(queryParams!=null && queryParams.length>0){
			for(int i=0; i<queryParams.length; i++){
				org.hibernate.type.Type[] types = typesFactory(queryParams);
				query.setParameters(queryParams, types);
			}
		}
	}
	
	private static  org.hibernate.type.Type[] typesFactory(Object[] queryParams) 
	{
		int count = queryParams.length;
		org.hibernate.type.Type[] types = new org.hibernate.type.Type[count];
		for (int i = 0; i < count; i++) 
		{
			if (queryParams[i].getClass().getName().endsWith("String"))
				types[i] = new org.hibernate.type.StringType();
			else if (queryParams[i].getClass().getName().endsWith("Integer"))
				types[i] = new org.hibernate.type.IntegerType();
			else if (queryParams[i].getClass().getName().endsWith("Float"))
				types[i] = new org.hibernate.type.FloatType();
			else if (queryParams[i].getClass().getName().endsWith("Date"))
				types[i] = new org.hibernate.type.DateType();
		}
		return types;
	}
	
	/**
	 * 获取实体的名称
	 * @param <E>
	 * @param clazz 实体类
	 * @return
	 */
	protected static <E> String getEntityName(Class<E> clazz){
		return clazz.getSimpleName();
	}

	
	/**
	 * 组装order by语句
	 * @param orderby
	 * @return
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby){
		StringBuffer orderbyql = new StringBuffer("");
		if(orderby!=null && orderby.size()>0){
			orderbyql.append(" order by ");
			for(String key : orderby.keySet()){
				orderbyql.append("o.").append(key).append(" ").append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length()-1);
		}
		return orderbyql.toString();
	}
	 public Session getSession() {
	        //事务必须是开启的(Required)，否则获取不到
	        return sessionFactory.getCurrentSession();
	    }
	 
	 

}
