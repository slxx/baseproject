package com.slxx.actions;

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
import com.slxx.service.RentService;
import com.slxx.service.UserService;
import com.slxx.util.PageView;

/**
 * RentInfoAction �⻧��Ϣ
 * 
 * @author
 * 
 */
public class RentInfoAction {
	/**
	 * ��������ҳ��
	 * 
	 * @return
	 */
	public String goAddUI() {
		return "add";
	}

	/**
	 * �����⻧��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addRent() throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
		String time = df.format(new Date());
		rent.setOperDateTime(time);
		User u=(User) ActionContext.getContext().getSession().get("user");
		rent.setOperUserId(u.getUserId());
		rentService.saveObject(rent);
		user.setOperDateTime(time);
		user.setOperUserId(u.getUserId());
		user.setRent(rent);
		user.setStatus(0);
		/*	if (u!= null&& u.getUserPropertier() == 0) {//根据当前账户的属性来设置所添加的账户的属性，
		   user.setUserPropertier(1);//当当前用户为System时所添加的则为administrator
		} else {
			user.setUserPropertier(2);//否则则为nomol
		}*/
		user.setUserPropertier(1);//由于是租户帐号，则直接设置为1表示administrator
		userService.saveObject(user);
		message=" add success!";
		return getPageList();
	}

	/**
	 * �����޸�ҳ��
	 * 
	 * @return
	 * @throws Exception
	 */
	public String goUpdateUI() throws Exception {
		rent = rentService.findObject(rent.getRentId());
		ActionContext.getContext().put("rent", rent);
		return "update";
	}

	/**
	 * �޸��⻧��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateRent() throws Exception {
		rentService.updateObject(rent);
		message=" update success!";
		return getPageList();
	}

	/**
	 * ��ȡ�⻧��Ϣ���н��
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getPageList() throws Exception {
		PageView<Rent> pageView = new PageView<Rent>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("rentId", "desc");
		StringBuffer sb= new StringBuffer(" and o.parentMenu  is null");
		pageView.setQueryResult(rentService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String view() throws Exception {
		rentService.findObject(rent.getRentId());
		return "view";
	}

	/**
	 * ɾ���⻧��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		//rentService.deleteObject(rent.getRentId());
		Rent r=rentService.findObject(rent.getRentId());
		r.setIsValid(false);
		rentService.updateObject(r);
		message=" delete success!";
		return getPageList();
	}
	public String deleteAll() throws Exception {
		String ids = this.getCheckId();  
		String[] arrayId = ids.split(", ");  
		for(int i=0;i<arrayId.length;i++){
			Rent r=rentService.findObject(Integer.parseInt(arrayId[i]));
			r.setIsValid(false);
			rentService.updateObject(r);
		}
		message=" delete success!";
		return getPageList();
	}
	private RentService rentService;
	private Rent rent;
	private int page = 1;
    private User user;
    private UserService userService;
    private String message;
	public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}
	public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}
public UserService getUserService() {
	return userService;
}

public void setUserService(UserService userService) {
	this.userService = userService;
}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public RentService getRentService() {
		return rentService;
	}

	public void setRentService(RentService rentService) {
		this.rentService = rentService;
	}

	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}
private String checkId;  
	
	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

}
