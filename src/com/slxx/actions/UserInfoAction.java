package com.slxx.actions;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Person;
import com.slxx.model.Rent;
import com.slxx.model.Role;
import com.slxx.model.User;
import com.slxx.service.PersonService;
import com.slxx.service.UserService;
import com.slxx.util.PageView;

/**
 * UserInfoAction �û���Ϣ
 * 
 * @author
 * 
 */
public class UserInfoAction {

	/**
	 * 对人员信息分配帐号的新增信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addUser() throws Exception {
		List<Object> params = new ArrayList<Object>();
		params.add(user.getUserName());
		params.add(user.getAccount());
		List<User> userList=userService.findByHql(" and o.userName=? or o.account=? ", params.toArray());	
		if(userList!=null&&userList.size()>0){
			message = " 此用户名或者帐号已经存在!";
		}else{
		   String time = df.format(new Date());
			user.setOperDateTime(time);
			User u = (User) ActionContext.getContext().getSession().get("user");
			user.setOperUserId(u.getUserId());
			user.setStatus(0);
			Person person = personService.findObject(personId);
			user.setPerson(person);
			user.setRent(person.getRent());
		/*	if (u!= null&& u.getUserPropertier() == 0) {//根据当前账户的属性来设置所添加的账户的属性，
			   user.setUserPropertier(1);//当当前用户为System时所添加的则为administrator
			} else {
				user.setUserPropertier(2);//否则则为nomol
			}*/
			user.setUserPropertier(2);//只针对人员信息分配帐号的新增，即是人员帐号，所添加的用户属性直接设置为1即是只nomal
			userService.saveObject(user);
			message = " add success!";
			}
		return getPageList();
	}

	/**
	 * �����޸�ҳ��
	 * 
	 * @return
	 * @throws Exception
	 */
	public String goUpdateUI() throws Exception {
		if (user != null) {
			user = userService.findObject(user.getUserId());
		} else {
			User u = (User) ActionContext.getContext().getSession().get("user");
			user = userService.findObject(u.getUserId());
		}
		ActionContext.getContext().getSession().put("user", user);
		return "update";
	}

	/**
	 * �޸��û���Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateUser() throws Exception {
		String time = df.format(new Date());
		user.setOperDateTime(time);
		userService.updateObject(user);
		message = " update success!";
		return getPageList();
	}

	/**
	 * ��ȡ�û���Ϣ���н��
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getPageList() throws Exception {
		PageView<User> pageView = new PageView<User>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("userId", "desc");
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
		pageView.setQueryResult(userService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(),sb.toString(),params.toArray(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String view() throws Exception {
		userService.findObject(user.getUserId());
		return "view";
	}

	/**
	 * ɾ���û���Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		// userService.deleteObject(user.getUserId());
		User u = userService.findObject(user.getUserId());
		u.setIsValid(false);
		userService.updateObject(u);
		message = " delete success!";
		return getPageList();
	}

	public String deleteAll() throws Exception {
		String ids = this.getCheckId();
		String[] arrayId = ids.split(", ");
		for (int i = 0; i < arrayId.length; i++) {
			User r = userService.findObject(Integer.parseInt(arrayId[i]));
			r.setIsValid(false);
			userService.updateObject(r);
		}
		message = " delete success!";
		return getPageList();
	}

	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	private UserService userService;
	private User user;
	private int page = 1;
	private int rentId;
	private int personId;
	private PersonService personService;

	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public int getPersonId() {
		return personId;
	}

	public void setPersonId(int personId) {
		this.personId = personId;
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

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private String checkId;

	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
