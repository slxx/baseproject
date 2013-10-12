package com.slxx.util;

import java.util.List;

/**
 * 封装分页数据(当前页结果集、总记录数)
 * @author Administrator
 */
public class PagerModel {
	/** 当前页结果集 */

	private List datas;
	/** 总记录数 */
	private int total;
	
	
	public List getDatas() {
		return datas;
	}
	
	public void setDatas(List datas) {
		this.datas = datas;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
