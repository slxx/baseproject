package com.slxx.actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.slxx.model.Menu;
import com.slxx.model.Role;
import com.slxx.model.User;
import com.slxx.service.MenuService;
import com.slxx.util.PageView;

/**
 * MenuInfoAction 菜单信息管理
 * 
 * @author
 * 
 */
public class MenuInfoAction {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
	/**
	 * 新增页面跳转
	 * 
	 * @return
	 */
	public String goAddUI() {
		ActionContext.getContext().put("parentMenuId", parentMenuId);
		return "add";
	}
	/**
	 * 树形菜单新增页面跳转
	 * @return
	 */
	public String goAddTreeUI() {
		StringBuffer sb= new StringBuffer(" and o.parentMenu  is null");
		List<Menu> menuTreeList=menuService.findByHql(sb.toString(), null);
		ActionContext.getContext().put("menuTreeList", menuTreeList);
		return "addTree";
	}
	/**
	 * 进入下级菜单子页面
	 * @return
	 */
	public String goSubPage() {
		PageView<Menu> pageView = new PageView<Menu>(10, page);
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("menuId", "desc");
		List<Object> params = new ArrayList<Object>();
		params.add(parentMenuId);
		StringBuffer sb= new StringBuffer(" and o.parentMenu=? ");
		pageView.setQueryResult(menuService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(),sb.toString(),params.toArray(), orderby));
		ActionContext.getContext().put("pageView", pageView);
		ActionContext.getContext().put("parentMenuId", parentMenuId);
		return "list";
	}
	/**
	 * 新增信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addMenu() throws Exception {
		
		String time = df.format(new Date());
		menu.setOperDateTime(time);
		User u=(User) ActionContext.getContext().getSession().get("user");
		menu.setOperUserId(u.getUserId());
		if(this.parentMenuId!=null&&!this.parentMenuId.equals("")){
			Menu parentMenu=menuService.findObject(Integer.parseInt(parentMenuId));
			menu.setParentMenu(parentMenu);
			if(parentMenu.getMenuLevel()==1){//根据父菜单级别设置子菜单级别
				menu.setMenuLevel(2);
			}else {
				menu.setMenuLevel(1);
			}
		}
		menuService.saveObject(menu);
	    message=" add success!";
		
		return getPageList();
	}

	/**
	 * 修改页面跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	public String goUpdateUI() throws Exception {
		menu = menuService.findObject(menu.getMenuId());
		ActionContext.getContext().put("menu", menu);
		return "update";
	}

	/**
	 * 修改信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateMenu() throws Exception {
		menuService.updateObject(menu);
		message=" update success!";
		return getPageList();
	}

	/**
	 * 菜单信息列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getPageList() throws Exception {
		PageView<Menu> pageView = new PageView<Menu>(10, page);
		StringBuffer sb= new StringBuffer(" and o.parentMenu  is null");
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("menuIndex", "desc");
		pageView.setQueryResult(menuService.getScrollData(
				pageView.getFirstResult(), pageView.getMaxresult(), sb.toString(),null,orderby));
		ActionContext.getContext().put("pageView", pageView);
		return "list";
	}

	public String view() throws Exception {
		menuService.findObject(menu.getMenuId());
		return "view";
	}

	/**
	 * 逐条删除信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		//menuService.deleteObject(menu.getMenuId());
		Menu m=menuService.findObject(menu.getMenuId());
		m.setIsValid(false);
		menuService.updateObject(m);
		message=" delete success!";
		return getPageList();
	}
	/**
	 * checkbox多条删除信息
	 * @return
	 * @throws Exception
	 */
	public String deleteAll() throws Exception {
		String ids = this.getCheckId();  
		String[] arrayId = ids.split(", ");  
		for(int i=0;i<arrayId.length;i++){
			Menu r=menuService.findObject(Integer.parseInt(arrayId[i]));
			r.setIsValid(false);
			menuService.updateObject(r);
		}
		message=" delete success!";
		return getPageList();
	}
	private MenuService menuService;
	private Menu menu;
	private int page = 1;
    private String parentMenuId;
    private String message;
	public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}
	public String getParentMenuId() {
	return parentMenuId;
}
public void setParentMenuId(String parentMenuId) {
	this.parentMenuId = parentMenuId;
}
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
private String checkId;  
	
	public String getCheckId() {
		return checkId;
	}

	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}


}
