<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>" />
    
    <title>欢迎使用</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>

<SCRIPT LANGUAGE="JavaScript">
  
	function add(){
		var menuName=document.all("menu.menuName");
		var targetPath=document.all("menu.targetPath");
		var iconPath=document.all("menu.iconPath");
		var menuPopedomCode=document.all("menu.menuPopedomCode");
		var menuOwerType=document.all("menu.menuOwerType");
		if(menuName.value==""){
				alert("菜单名称不能为空!");
				return false;
			}
		if(targetPath.value==""){
			alert("目标路径不能为空!");
			return false;
		}
		if(iconPath.value==""){
			alert("图标路径不能为空!");
			return false;
		}
		if(menuPopedomCode.value==""){
			alert("菜单权限码不能为空!");
			return false;
		}
		if(menuOwerType.value==""){
			alert("菜单拥有者不能为空!");
			return false;
		}
		
	   var form=document.forms[0];
		  form.action="<%=path%>/menu_addMenu.action";
		  form.submit();
		return true;
	}
 
  </SCRIPT>

  </head>
  <body>
 
    <!--main-container-part-->
<div id="content"> 
  <!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="current last-child">系统菜单管理</a> </div>
  </div>
  <!--End-breadcrumbs--> 
  <!--Action boxes-->
  <div class="container-fluid">
  	<div class="quick-actions_homepage">
      <ul class="quick-actions">
         <li class="btn_bc"><input name="" type="button" title="保存" onclick="javascript:add();"></li>
        <li class="btn_cz"><input name="" type="button" title="重置" onclick="javascript:document.forms[0].reset();"></li>
        <li class="btn_fh"><input name="" type="button" title="返回" onClick="javascript:history.back();"></li>
      </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
      <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
        <h5>新增数据</h5>
      </div>
      <div class="widget-content">
 <s:form action="menu_addMenu.action" method="post">
   <s:hidden name="menu.isValid" value="true"/>
    <s:hidden name="parentMenuId"/>
					 <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						<td class="td_r"><span style="color: red">*</span>菜单名称:</td>
							<td class="td_l"><s:textfield name="menu.menuName" cssClass="txt" />
						<tr>
						<td class="td_r">提示信息:</td>
							<td class="td_l"><s:textfield name="menu.tipInfo" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r"><span style="color: red">*</span>目标路径:</td>
							<td class="td_l"><s:textfield name="menu.targetPath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r"><span style="color: red">*</span>图标路径:</td>
							<td class="td_l"><s:textfield name="menu.iconPath" cssClass="txt"  /></td>
						</tr>
						<tr>
						<td class="td_r">图片路径:</td>
							<td class="td_l"><s:textfield name="menu.imagePath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r"><span style="color: red">*</span>菜单权限码:</td>
							<td class="td_l"><s:textfield name="menu.menuPopedomCode" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单索引:</td>
							<td class="td_l"><s:textfield name="menu.menuIndex" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单类别:</td>
							<td class="td_l"><s:radio name="menu.menuType"
									list='#{ 0:"系统菜单",1:"普通菜单"}' value="1" /></td>
						</tr>
						
						
						
						<tr>
						<td class="td_r"><span style="color: red">*</span>菜单拥有者:</td>
							<td class="td_l">
							<input type="checkbox" name="menu.menuOwerType" value="0">系统管理员
							<input type="checkbox" name="menu.menuOwerType" value="1">租户
							<input type="checkbox" name="menu.menuOwerType" value="2">普通用户
						</tr>
						<tr>
						<td class="td_r">菜单备注:</td>
							<td class="td_l"><s:textarea name="menu.menuRemark" cssClass="txt_area" /></td>
						</tr>
					</table>
</s:form>
			</div>
      
    </div>
  </div>
</div>

<!--end-main-container-part--> 
    
  
  </body>
</html>
