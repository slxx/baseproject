package com.slxx.model;

import java.io.Serializable;
import java.util.Set;


/**
 * The persistent class for the Sys_Menu database table.
 * 
 */

public class Menu implements Serializable {

	/**
	 * �˵���Ϣ
	 */
	private static final long serialVersionUID = 6495671474269044901L;
	//id����	
	private int menuId;

	//��ťͼƬ·��
	private String iconPath;

	//ͼƬ·��
	private String imagePath;

	//�Ƿ���Ч
	private boolean isValid;

	//�˵�����
	private int menuIndex;

	//�˵�����
	private int menuLevel;

	//�˵�����
	private String menuName;

	//�˵�Ȩ����
	private String menuPopedomCode;

	//�˵���ע
	private String menuRemark;

	//�˵����
	private int menuType;

	//����ʱ��
	private String operDateTime;

	//����Ա
	private int operUserId;
	//���˵����
	private Menu parentMenu;

	//Ŀ��·��
	private String targetPath;

	//��ʾ��Ϣ
	private String tipInfo;
	//�˵�ӵ��������0��Ӧ�û�sys��1��Ӧ�⻧��2��������ͨ��Ա
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