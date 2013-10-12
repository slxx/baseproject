package com.slxx.model;

import java.io.Serializable;
import java.util.Set;


/**
 * The persistent class for the Sys_Menu database table.
 * 
 */

public class Menu implements Serializable {

	/**
	 * 菜单信息
	 */
	private static final long serialVersionUID = 6495671474269044901L;
	//id主键	
	private int menuId;

	//按钮图片路径
	private String iconPath;

	//图片路径
	private String imagePath;

	//是否有效
	private boolean isValid;

	//菜单索引
	private int menuIndex;

	//菜单级别
	private int menuLevel;

	//菜单名称
	private String menuName;

	//菜单权限码
	private String menuPopedomCode;

	//菜单备注
	private String menuRemark;

	//菜单类别
	private int menuType;

	//操作时间
	private String operDateTime;

	//操作员
	private int operUserId;
	//父菜单编号
	private Menu parentMenu;

	//目标路径
	private String targetPath;

	//提示信息
	private String tipInfo;
	//菜单拥有者类型0对应用户sys，1对应租户，2，对于普通人员
	private String menuOwerType;
 
	public String getMenuOwerType() {
		return menuOwerType;
	}



	public void setMenuOwerType(String menuOwerType) {
		this.menuOwerType = menuOwerType;
	}

	private Set<Menu> childMenu;
	
	
	public Menu() {
	}

	

	public Menu(int menuId) {
		super();
		this.menuId = menuId;
	}



	public Set<Menu> getChildMenu() {
		return childMenu;
	}


	public void setChildMenu(Set<Menu> childMenu) {
		this.childMenu = childMenu;
	}







	public String getIconPath() {
		return this.iconPath;
	}

	public void setIconPath(String iconPath) {
		this.iconPath = iconPath;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public boolean getIsValid() {
		return this.isValid;
	}

	public void setIsValid(boolean isValid) {
		this.isValid = isValid;
	}

	public int getMenuIndex() {
		return this.menuIndex;
	}

	public void setMenuIndex(int menuIndex) {
		this.menuIndex = menuIndex;
	}

	public int getMenuLevel() {
		return this.menuLevel;
	}

	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuName() {
		return this.menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuPopedomCode() {
		return this.menuPopedomCode;
	}

	public void setMenuPopedomCode(String menuPopedomCode) {
		this.menuPopedomCode = menuPopedomCode;
	}

	public String getMenuRemark() {
		return this.menuRemark;
	}

	public void setMenuRemark(String menuRemark) {
		this.menuRemark = menuRemark;
	}

	public int getMenuType() {
		return this.menuType;
	}

	public void setMenuType(int menuType) {
		this.menuType = menuType;
	}

	public String getOperDateTime() {
		return this.operDateTime;
	}

	public void setOperDateTime(String operDateTime) {
		this.operDateTime = operDateTime;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getOperUserId() {
		return operUserId;
	}

	public void setOperUserId(int operUserId) {
		this.operUserId = operUserId;
	}

   public Menu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}

	public String getTargetPath() {
		return this.targetPath;
	}

	public void setTargetPath(String targetPath) {
		this.targetPath = targetPath;
	}

	public String getTipInfo() {
		return this.tipInfo;
	}

	public void setTipInfo(String tipInfo) {
		this.tipInfo = tipInfo;
	}

}