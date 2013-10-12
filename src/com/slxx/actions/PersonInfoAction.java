package com.slxx.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Menu;
import com.slxx.model.Person;
import com.slxx.model.Rent;
import com.slxx.model.Role;
import com.slxx.model.User;
import com.slxx.service.PersonService;
import com.slxx.util.PageView;

/**
 * PersonInfoAction ��Ա��Ϣ
 * 
 * @author
 * 
 */
public class PersonInfoAction {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	/**
	 *新增页面跳转
	 * 
	 * @return
	 */
	public String goAddUI() {
		User u=(User) ActionContext.getContext().getSession().get("user");
	  List rentList=personService.findRentByHql(u.getUserPropertier(),u.getRent().getRentId());
	  ActionContext.getContext().put("rentList", rentList);
		return "add";
	}

	/**
	 * 新增信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addPerson() throws Exception {
		String time = df.format(new Date());
		person.setOperDateTime(time);
		User u=(User) ActionContext.getContext().getSession().get("user");
		person.setOperUserId(u.getUserId());
		person.setRent(new Rent(rentId));
		personService.saveObject(person);
		message=" add success!";
		return getPageList();
	}
	/**
	 * 分配账户跳转
	 * 
	 * @return
	 */
	public String goUserAddUI() {
		ActionContext.getContext().put("personId",person.getPersonId());
		return "addUser";
	}

	

	/**
	 *修改页面跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	public String goUpdateUI() throws Exception {
		person = personService.findObject(person.getPersonId());
		ActionContext.getContext().put("person", person);
		return "update";
	}

	/**
	 * 修改信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updatePerson() throws Exception {
		personService.updateObject(person);
		message=" update success!";
		return getPageList();
	}

	/**
	 * 分页列表显示信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getPageList() throws Exception {
		PageView<Person> pageView = new PageView<Person>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("personId", "desc");
		User u = (User) ActionContext.getContext().getSession().get("user");
		StringBuffer sb=new StringBuffer();
		List<Object> params=new ArrayList<Object>();
		if(u.getUserPropertier()==2){//当当前用户为nomal时，即为人员帐号时
			sb.append(" and o.rent.rentId=?  ");
			params.add(u.getRent().getRentId());
		}else if(u.getUserPropertier()==1){//当当前用户为administrator时，即为租户帐号时
			sb.append(" and o.rent.rentId=?  ");
			params.add(u.getRent().getRentId());
		}
		pageView.setQueryResult(personService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(),sb.toString(),params.toArray(),  orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String view() throws Exception {
		personService.findObject(person.getPersonId());
		return "view";
	}

	/**
	 * 逐条删除信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
	//	personService.deleteObject(person.getPersonId());
		Person p=personService.findObject(person.getPersonId());
		p.setIsValid(false);
		personService.updateObject(p);
		message=" delete success!";
		return getPageList();
	}
	/**
	 * chackBox 多条删除信息
	 * @return
	 * @throws Exception
	 */
	public String deleteAll() throws Exception {
		String ids = this.getCheckId();  
		String[] arrayId = ids.split(", ");  
		for(int i=0;i<arrayId.length;i++){
			Person r=personService.findObject(Integer.parseInt(arrayId[i]));
			r.setIsValid(false);
			personService.updateObject(r);
		}
		message=" delete success!";
		return getPageList();
	}
	private PersonService personService;
	private Person person;
	private int page = 1;
	private int rentId;
private String message;
	public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

	public int getRentId() {
		return rentId;
	}

	public void setRentId(int rentId) {
		this.rentId = rentId;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
private String checkId;  
	
	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

}
