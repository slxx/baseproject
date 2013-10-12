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
<SCRIPT LANGUAGE="JavaScript">
  
	function add(){
	  var userName=document.all("user.userName");
	  var passWord=document.all("user.passWord");
	  var account=document.all("user.account");
	  var rentName=document.all("rent.rentName");
	  var connecter=document.all("rent.connecter");

	  if(userName.value==""){
	  		alert("用户名不能为空!");
	  		return false;
	  	}
	  if(passWord.value==""){
	  	alert("密码不能为空!");
	  	return false;
	  }
	  if(account.value==""){
	  	alert("帐号不能为空!");
	  	return false;
	  }
	  if(rentName.value==""){
	  	alert("租户名称不能为空!");
	  	return false;
	  }
	  if(connecter.value==""){
			alert("联系人不能为空!");
			return false;
		}
	  var form=document.forms[0];
		  form.action="<%=path%>/rent_addRent.action";
		  form.submit();
		return true;
	}
  
  
  function checkPassWord(pass1){
		 var pass=document.all("user.passWord");
		 if(pass.value!=pass1.value){
			 alert("两次密码不一致,请重新输入！");
				return false;
			 
		 }
		  
	  }
  </SCRIPT>

  </head>
  <body>
  <s:form action="rent_addRent.action" method="post">
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
    <s:hidden name="user.IsValid" value="true"/>
   <s:hidden name="rent.IsValid" value="true"/>
  
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
                    <tr>
						<td class="td_r"><span style="color: red">*</span>用户名:</td>
						
							<td class="td_l"><s:textfield name="user.userName"   cssClass="txt" /></td>
							</tr>
						<tr>
							<td class="td_r"><span style="color: red">*</span>帐    号:</td>
							<td class="td_l"><s:textfield name="user.account"   cssClass="txt" />
						</td>
						</tr>
						<tr>
						
							<td class="td_r"><span style="color: red">*</span>密    码:</td>
							<td class="td_l"><s:password name="user.passWord"   cssClass="txt" /></td>
						</tr>
						<tr>
						
							<td class="td_r"><span style="color: red">*</span>确认密 码:</td>
							<td class="td_l"><input type="password" name="passWord1" id="passWord1"  class="txt" onblur="checkPassWord(this)" /></td>
						</tr>
						
						<tr>
							<td class="td_r"><span style="color: red">*</span>租户名称:</td><td class="td_l"><s:textfield name="rent.rentName"  cssClass="txt" /></td>
						<tr>
							<td class="td_r"><span style="color: red">*</span>联 系 人 :</td><td class="td_l"><s:textfield name="rent.connecter"  cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">联系电话:</td><td class="td_l"><s:textfield name="rent.tel"  cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">q  q:</td><td class="td_l"><s:textfield name="rent.qq" cssClass="txt"  /></td>
						</tr>
						<tr>
							<td class="td_r"> email :</td><td class="td_l"><s:textfield name="rent.email" cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">租户性质:</td><td class="td_l"><s:radio name="rent.rentProperties"
									list='#{ 0:"个人",1:"企业", 2:"机关", 3:"社会团体",4:"其他" }' value="0"></s:radio>

							</td >
						</tr>
					</table>
			 </div>
      </div>
     <%--  <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
        <h5>租户帐号分配</h5>
      </div>
      <div class="widget-content">

   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <s:hidden name="user.IsValid" value="true"/>
                    <tr>
						<td class="td_r">用户名:</td>
							<td class="td_l"><s:textfield name="user.userName"   cssClass="txt" /></td>
							</tr>
						<tr>
							<td class="td_r">密    码:</td>
							<td class="td_l"><s:textfield name="user.passWord"   cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">帐    号:</td>
							<td class="td_l"><s:password name="user.account"   cssClass="txt" />
							</td>
						</tr></table>
						
      </div> 
    </div>--%>
      </div>
    </div>
      
  </s:form>
  </body>
</html>
