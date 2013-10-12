package com.slxx.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.slxx.dao.impl.DaoSupport;
import com.slxx.model.Menu;
import com.slxx.model.User;

import com.slxx.service.RoleService;
import com.slxx.service.UserService;
import com.slxx.util.QueryResult;

public class UserServiceImpl  extends DaoSupport<User>  implements UserService {
	
	/*public boolean checkUser(String username, String password){
		Query query=getSession().createQuery("from User u where u.userName=? and u.passWord=? and u.isValid=true ");
		query.setString(0, username);
		query.setString(1, password);
		User user = (User) query.uniqueResult();
		 if(user!=null){
			 return true;
		 }else{
			 return false;
		 }
	}
	
	*/

	
	//查找用户拥有读取权限的菜单列表（用于登陆，形成菜单导航栏）
			public Map<String,List>  searchMenuByUserId(int userPropertier, int userId) {
			//	String hql = "select m from Menu m where 1=1   and m.parentMenu  is null  order by m.menuIndex desc" ;
			String hql = "select m from RoleMenu rm ,Menu m,UserRole ur where 1=1 " +
					" and rm.role.roleId=ur.role.roleId  and rm.menu.menuId=m.menuId and  ur.user.userId=?   order by m.menuIndex desc";
			//String hql= "select m from RoleMenu rm ,(select m from Menu m where 1=1   and m.parentMenu  is null ) as 0,UserRole ur where 1=1 " +
			//			" and rm.role.roleId=ur.role.roleId  and rm.menu.menuId=0.menuId and  ur.user.userId=?  order by 0.menuIndex desc";
			Query query=getSession().createQuery(hql);	
			   query.setInteger(0, userId);
			List menuList = query.list();
				 
		Map<String, List> map = new HashMap<String, List>();
		for (Iterator it = menuList.iterator(); it.hasNext();) {
			Menu menu = (Menu) it.next();
			if(menu.getMenuOwerType().contains(String.valueOf(userPropertier))){
				if (map.containsKey(menu.getParentMenu().getMenuName())) {
					List tempList = map.get(menu.getParentMenu().getMenuName());
					tempList.add(menu);
				} else {
					List tempList = new ArrayList();
					tempList.add(menu);
					map.put(menu.getParentMenu().getMenuName(), tempList);
				}
			}
		  }

				return map;
			}
}
