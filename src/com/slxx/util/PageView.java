package com.slxx.util;

import java.util.ArrayList;
import java.util.List;

public class PageView<T> {
	
	/** ��ҳ��� **/
	private List<T> records;
	/** ҳ�뿪ʼ����ͽ������� **/
	private PageIndex pageindex;
	/** ��ҳ�� **/
	private long totalpage = 1;
	/** ÿҳ��ʾ��¼�� **/
	private int maxresult = 10;
	/** ��ǰҳ **/
	private int currentpage = 1;
	/** �ܼ�¼�� **/
	private long totalrecord;
	/** ҳ������ **/
	private int pagecode = 10;
	/** Ҫ��ȡ��¼�Ŀ�ʼ���� **/
	public int getFirstResult() {
		return (this.currentpage-1)*this.maxresult;
	}
	public int getPagecode() {
		return pagecode;
	}

	public void setPagecode(int pagecode) {
		this.pagecode = pagecode;
	}

	public PageView(int maxresult, int currentpage) {
		this.maxresult = maxresult;
		this.currentpage = currentpage;
	}
	
	public void setQueryResult(QueryResult<T> qr){
		setTotalrecord(qr.getTotalrecord());
		setRecords(qr.getResultlist());
	}
	
	public void setQueryResult(ArrayList<T> records){
		setTotalrecord(records.size());
		ArrayList<T> temRecords=new ArrayList<T>();
		int begin=(this.currentpage-1)*this.maxresult;
		int end=(this.currentpage)*this.maxresult;
		if(end>records.size())end=records.size();
		for(int i=begin;i<end;i++){
			temRecords.add(records.get(i));
		}
		setRecords(temRecords);
	}
	
	public long getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(long totalrecord) {
		this.totalrecord = totalrecord;
		setTotalpage(this.totalrecord%this.maxresult==0? this.totalrecord/this.maxresult : this.totalrecord/this.maxresult+1);
	}
	public List<T> getRecords() {
		return records;
	}
	public void setRecords(List<T> records) {
		this.records = records;
	}
	public PageIndex getPageindex() {
		return pageindex;
	}
	public long getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(long totalpage) {
		this.totalpage = totalpage;
		this.pageindex = PageIndex.getPageIndex(pagecode, currentpage, totalpage);
	}
	public int getMaxresult() {
		return maxresult;
	}
	public int getCurrentpage() {
		return currentpage;
	}
}
