<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用</title>
    <sx:head extraLocales="UTF-8"/> 
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/js/lhgcore.js"></script>
	<script type="text/javascript" src="<%=path %>/js/lhgcalendar.js"></script>
	
<SCRIPT LANGUAGE="JavaScript">
  <!--
	function add(){
	  var personName=document.all("person.personName");
	  var birthday=document.all("person.birthday");
	  var rentId=document.all("rentId");
	  var address=document.all("person.address");
	  if(personName.value==""){
	  		alert("人员姓名不能为空!");
	  		return false;
	  	}
	  if(birthday.value==""){
	  	alert("出生日期不能为空!");
	  	return false;
	  }
	  if(rentId.value==""){
	  	alert("所属租户不能为空!");
	  	return false;
	  }
	  if(address.value==""){
	  	alert("居住地址不能为空!");
	  	return false;
	  }
	//  $('#calendar1').val();
	  var form=document.forms[0];
		  form.action="<%=path%>/person_addPerson.action";
		  form.submit();
		return true;
	}
  //-->
  </SCRIPT>
<script type="text/javascript">

		//<![CDATA[

			$(document).ready(function (){ 

				$("#birthday").calendar();

				
			});

		//]]>

		</script>

  </head>
  <body>
   <s:form action="person_addPerson.action" method="post">
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

   <s:hidden name="person.isValid" value="true"/>
		
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="td_r"><span style="color: red">*</span>人员姓名:</td>
							<td class="td_l"><s:textfield name="person.personName"
									cssClass="txt" /></td>
						<tr>
							<td class="td_r"><span style="color: red">*</span>出生年月:</td>
							<td class="td_l">
								<input type="text" name="person.birthday" id="c1" onclick="J.calendar.get();" class="txt" />
							</td>
						</tr>
						<tr>
							<td class="td_r"><span style="color: red">*</span>性 别 :</td>
							<td class="td_l"><s:radio name="person.sex"
									list='#{ 0:"男",1:"女"}' value="0"></s:radio></td>
						</tr>
						
						<tr>
				              <td class="td_r"><span style="color: red">*</span>所属租户：</td>
				              <td class="td_l">
				              <s:select name="rentId" list="rentList" listValue="rentName" listKey="rentId"/>
				              </td>
			            </tr>
						<tr>
							<td class="td_r">职位（行政）:</td>
							<td class="td_l"><s:textfield name="person.position"
									cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r"><span style="color: red">*</span>居住地址:</td>
							<td class="td_l"><s:textfield name="person.address"
									cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">联系电话:</td>
							<td class="td_l"><s:textfield name="person.tel"
									cssClass="txt" /></td>
						</tr>
						<tr>
							<td class="td_r">邮箱:</td>
							<td class="td_l"><s:textfield name="person.email"
									cssClass="txt" /></td>
						<tr>
							<td class="td_r">QQ :</td>
							<td class="td_l"><s:textfield name="person.qq"
									cssClass="txt" /></td>
						</tr>
					</table>
				  </div>
    </div>
  </div>
</div>
				
  </s:form>
  </body>
</html>
