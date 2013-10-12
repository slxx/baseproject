package com.slxx.dao;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import com.slxx.util.QueryResult;



public interface DAO<T> {

	/**
	 * 获取记录总数
	 * @param entityClass 实体类
	 * @return
	 */
	public Long getCount();
	/**
	 * 清除一级缓存的数据
	 */
	public void clear();
	/**
	 * 保存实体
	 * @param entity 实体id
	 */
	public void saveObject(T entity);
	/**
	 * 更新实体
	 * @param entity 实体id
	 */
	public void updateObject(T entity);
	/**
	 * 删除实体
	 * @param entityClass 实体类
	 * @param entityids 实体id数组
	 */
	public void deleteObject(Serializable ... entityids);
	/**
	 * 获取实体
	 * @param <T>
	 * @param entityClass 实体类
	 * @param entityId 实体id
	 * @return
	 */
	public T findObject(Serializable entityId);
	/**
	 * 获取分页数据
	 * @param <T>
	 * @param entityClass 实体类
	 * @param firstindex 开始索引
	 * @param maxresult 需要获取的记录数
	 * @return
	 */

	
	public List<T> findByHql( String wherejpql, Object[] queryParams);
	
   public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams,LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult, LinkedHashMap<String, String> orderby);
	
	public QueryResult<T> getScrollData(int firstindex, int maxresult);
	
	public QueryResult<T> getScrollData();
}
