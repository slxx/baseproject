package com.slxx.actions;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;


import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Menu;
import com.slxx.model.Rent;
import com.slxx.model.Role;
import com.slxx.model.RoleMenu;
import com.slxx.model.User;
import com.slxx.model.UserRole;
import com.slxx.service.MenuService;
import com.slxx.service.RoleMenuService;
import com.slxx.service.RoleService;
import com.slxx.service.UserService;
import com.slxx.util.PageView;

/**
 * RoleMenuAction �û���Ϣ
 * 
 * @author 
 * 
 */
  public class RoleMenuAction {
	  
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	  public String deleteAllMenuByRoleId() throws Exception {
		  roleMenuService.deleteAllMenuByRoleId(roleId);
		  message=" add success!";
			return getRolePageList();
		}

	
	
	public String getRolePageList() throws Exception {
		PageView<Role> pageView = new PageView<Role>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("roleId", "desc");
		pageView.setQueryResult(roleService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}
	public String 	goAssignMenuPage()  throws Exception {
		PageView<RoleMenu> pageView = new PageView<RoleMenu>(10, page);
		List<Object> params = new ArrayList<Object>();
		params.add(roleId);
     List  menuList=menuService.findByHql(" and o.parentMenu  is null",null);
     List<RoleMenu> roleMenuList   =roleMenuService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult()," and o.role.roleId=? ",params.toArray()).getResultlist();
     ActionContext.getContext().put("roleMenuList", roleMenuList);
    ActionContext.getContext().put("menuList", menuList);
		return "assignMenuList";
	}
	 
	public String addAssignMenu() throws Exception {
		String[] arrayRoleId = childCheckId.split(",");  
		 roleMenuService.deleteAllMenuByRoleId(roleId);
		for(int i=0;i<arrayRoleId.length;i++){
			roleMenu=new RoleMenu();
			roleMenu.setRole(new Role(roleId));
			roleMenu.setMenu(new Menu(Integer.parseInt(arrayRoleId[i])));
			String time = df.format(new Date());
			User u=(User) ActionContext.getContext().getSession().get("user");
			roleMenu.setOperDateTime(time);
			roleMenu.setOperUserId(u.getUserId());
			roleMenu.setIsValid(true);
			roleMenuService.saveObject(roleMenu);
			
		}
		message=" add success!";
		return "pub_message";
	}
  
	
	
	private RoleMenuService roleMenuService;
	private RoleMenu roleMenu;
    private int page=1;
     private int roleId;
     private String childCheckId;
     private RoleService roleService;
     private String message;
 	public String getMessage() {
 	return message;
 }

 public void setMessage(String message) {
 	this.message = message;
 }
     public RoleMenuService getRoleMenuService() {
		return roleMenuService;
	}



	public void setRoleMenuService(RoleMenuService roleMenuService) {
		this.roleMenuService = roleMenuService;
	}



	public RoleMenu getRoleMenu() {
		return roleMenu;
	}



	public void setRoleMenu(RoleMenu roleMenu) {
		this.roleMenu = roleMenu;
	}



	public int getRoleId() {
		return roleId;
	}



	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}



	


	public String getChildCheckId() {
		return childCheckId;
	}



	public void setChildCheckId(String childCheckId) {
		this.childCheckId = childCheckId;
	}



	public RoleService getRoleService() {
		return roleService;
	}



	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}



	public MenuService getMenuService() {
		return menuService;
	}



	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	private MenuService menuService;
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
