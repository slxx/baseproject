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
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<SCRIPT LANGUAGE="JavaScript">
  <!--
	function save(){
	  var form=document.forms[0];
		  form.action="<%=path%>/menu_updateMenu.action";
		  form.submit();
		return true;
	}
  //-->
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
        <li class="bg_lb"> <a href="javascript:save();"> <i class="icon-bc-sign"></i>保存</a> </li>
        <li class="bg_lg"> <a href="#"> <i class="icon-cz-sign"></i>重置</a> </li>
        <li class="bg_ly"> <a href="javascript:history.back();"  onclick=""> <i class="icon-fh-sign"></i>返回</a> </li>
      </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
      <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
        <h5>修改数据</h5>
      </div>
      <div class="widget-content">
 <s:form action="menu_updateMenu.action" method="post">
 <s:hidden name="menu.menuId"/>
   <s:hidden name="menu.isValid" value="true"/>
    <s:hidden name="parentMenuId"/>
					 <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						<td class="td_r">菜单名称:</td>
							<td class="td_l"><s:textfield name="menu.menuName" cssClass="txt" />
						<tr>
						<td class="td_r">提示信息:</td>
							<td class="td_l"><s:textfield name="menu.tipInfo" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">目标路径:</td>
							<td class="td_l"><s:textfield name="menu.targetPath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">图标路径:</td>
							<td class="td_l"><s:textfield name="menu.iconPath" cssClass="txt"  /></td>
						</tr>
						<tr>
						<td class="td_r">图片路径:</td>
							<td class="td_l"><s:textfield name="menu.imagePath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单权限码:</td>
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


