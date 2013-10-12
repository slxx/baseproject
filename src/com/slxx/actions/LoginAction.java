package com.slxx.actions;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Rent;
import com.slxx.model.User;
import com.slxx.service.UserService;
import com.slxx.util.PageView;

/**
 * LoginAction 
 * 
 * @author
 * 
 */
public class LoginAction {
	
	public String login() {
		List<Object> params = new ArrayList<Object>();
			params.add(user.getUserName());
			params.add(user.getPassWord());
			List<User> list=userService.findByHql(" and o.userName=? and o.passWord=? ",params.toArray());
          
       if (list!=null&&list.size()>0) {
    	  // Map<String,List> menuMap =   userService.searchMenuByUserId(user.getUserPropertier(),user.getUserId());
          //if(!menuMap.isEmpty()){
    	  // ActionContext.getContext().put("menuMap", menuMap);
            ActionContext.getContext().getSession().put("user", list.get(0));
            message="欢迎登录权限管理后台系统！";
            return "success";
         // }else{
        //	  message="该账户尚未分配角色，您暂时没有操作权限！";
          //    return "login";
          //}
			
		} else {
			message="用户名或者密码输入有误！";
					
			return "login";
		}
	}
	

	
	//登录时形成菜单
	public String searchMenu() {
		  User user=  (User) ActionContext.getContext().getSession().get("user");
		  if(user!=null){
		  Map<String,List> menuMap =   userService.searchMenuByUserId(user.getUserPropertier(),user.getUserId());
           ActionContext.getContext().put("menuMap", menuMap);
		  }
       	return "menu";
	}

	
	
	
	private UserService userService;
	private User user;
    private String message;
	public UserService getUserService() {
		return userService;
	}

	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
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
  
}
