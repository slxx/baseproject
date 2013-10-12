package com.slxx.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.slxx.model.Rent;
import com.slxx.model.Role;
import com.slxx.model.User;
import com.slxx.model.UserRole;
import com.slxx.service.RoleService;
import com.slxx.util.PageView;

/**
 * RoleInfoAction ��ɫ��Ϣ
 * 
 * @author
 * 
 */
public class RoleInfoAction {

	/**
	 * ��������ҳ��
	 * 
	 * @return
	 */
	public String goAddUI() {
		return "add";
	}

	/**
	 * ������ɫ��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addRole() throws Exception {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
		String time = df.format(new Date());
		role.setOperDateTime(time);
		User u=(User) ActionContext.getContext().getSession().get("user");
		role.setOperUserId(u.getUserId());
		roleService.saveObject(role);
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
		role = roleService.findObject(role.getRoleId());
		ActionContext.getContext().put("role", role);
		return "update";
	}

	/**
	 * �޸Ľ�ɫ��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateRole() throws Exception {
		roleService.updateObject(role);
		message=" update success!";
		return getPageList();
	}

	/**
	 * ��ȡ��ɫ��Ϣ���н��
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getPageList() throws Exception {
		PageView<Role> pageView = new PageView<Role>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("roleId", "desc");
		pageView.setQueryResult(roleService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String view() throws Exception {
		roleService.findObject(role.getRoleId());
		return "view";
	}

	/**
	 * ɾ���ɫ��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		//roleService.deleteObject(role.getRoleId());
		Role r=roleService.findObject(role.getRoleId());
		r.setIsValid(false);
		roleService.updateObject(r);
		message=" delete success!";
		return getPageList();
	}
	
	public String deleteAll() throws Exception {
		String ids = this.getCheckId();  
		String[] arrayId = ids.split(", ");  
		for(int i=0;i<arrayId.length;i++){
			Role r=roleService.findObject(Integer.parseInt(arrayId[i]));
			r.setIsValid(false);
			roleService.updateObject(r);
				}
		message=" delete success!";
		return getPageList();
	}

	private RoleService roleService;
	private Role role;
	private int page = 1;
	private String message;
	private int userId;
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
private String checkId;  
	
	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}


}
