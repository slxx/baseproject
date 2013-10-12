<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>欢迎使用</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>

<script src="<%=path %>/js/core.js" type="text/javascript"></script>
	<script src="<%=path %>/js/form.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript">
  <!--
	function add(){
	  var roleName=document.all("role.roleName");
	  if(roleName.value==""){
			alert("用户名不能为空!");
			return false;
		}
	  var form=document.forms[0];
		  form.action="<%=path%>/role_addRole.action";
		  form.submit();
		return true;
	}
  //-->
  </SCRIPT>

  </head>
  <body>
  <s:form action="role_addRole.action" method="post" id="form1">
 
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
   <s:hidden name="role.isValid" value="true"/>
  
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="td_r"><span style="color: red">*</span>角色名称:</td><td class="td_l"><s:textfield name="role.roleName"  cssClass="txt"/>
						<tr>
							<td class="td_r">角色说明 :</td><td class="td_l"><s:textfield name="role.roleExplain" cssClass="txt"/></td>
						</tr>
						<tr>
							<td class="td_r">角色属性:</td><td class="td_l"><s:radio name="person.rolePropertier"
									list='#{ 0:"系统角色",1:"普通角色"}' value="0"></s:radio>
							</td>
						</tr>
					</table>
 </div>
    </div>
  </div>
</div>

  </s:form>
  </body>
</html>
