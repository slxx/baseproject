package com.slxx.actions;




import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Role;
import com.slxx.model.User;
import com.slxx.model.UserRole;
import com.slxx.service.RoleService;
import com.slxx.service.UserRoleService;
import com.slxx.service.UserService;
import com.slxx.util.PageView;
import com.slxx.util.QueryResult;

/**
 * UserAction �û���Ϣ
 * 
 * @author 20130423
 * 
 */
  public class UserRoleAction {
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	  public String deleteAllRoleByUserId() throws Exception {
		    userRoleService.deleteAllRoleByUserId(userId);
		    message=" add success!";
			return getUserPageList();
		}

	
	
	public String getUserPageList() throws Exception {
		PageView<User> pageView = new PageView<User>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("userId", "desc");
		pageView.setQueryResult(userService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}
	public String 	goAssignRolePage()  throws Exception {
		PageView<UserRole> pageView = new PageView<UserRole>(10, page);
		
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
       List  roleList=roleService.findByHql(null,null);
      // List userRoleList   =userRoleService.findByHql(" and o.user.userId=? ",params.toArray());
       List<UserRole> userRoleList   =userRoleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult()," and o.user.userId=? ",params.toArray()).getResultlist();
       ActionContext.getContext().put("userRoleList", userRoleList);
      ActionContext.getContext().put("roleList", roleList);
		return "assignRoleList";
	}
	 
	public String addAssignRole() throws Exception {
		String ids = this.getCheckId().trim();  
		String[] arrayRoleId = ids.split(",");  
		userRoleService.deleteAllRoleByUserId(userId);
		for(int i=0;i<arrayRoleId.length;i++){
			userRole=new UserRole();
			userRole.setUser(new User(userId));
			userRole.setRole(new Role(Integer.parseInt(arrayRoleId[i])));
			String time = df.format(new Date());
			User u=(User) ActionContext.getContext().getSession().get("user");
			userRole.setOperDateTime(time);
			userRole.setIsValid(true);
			userRole.setOperUserId(u.getUserId());
			userRoleService.saveObject(userRole);
			
		}
		
		message=" add success!";
		return "pub_message";
	}
	
	private UserRoleService userRoleService;
	private RoleService roleService;
	private int userId;
	private String message;
	public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}


	private UserService userService;
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	private UserRole userRole;
    private int page=1;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}


	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}


	public UserRole getUserRole() {
		return userRole;
	}


	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	private String checkId;  
	
	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}

}
