0<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css" />
  
  </head>
 <SCRIPT language=JavaScript src="<%=path %>/js/pub.js"></SCRIPT>
 <script type="text/javascript">
 
 function toAssign(){
		var temp=document.getElementsByName("checkId");
		for (i=0;i<temp.length;i++){ 
		  //遍历Radio 
		    if(temp[i].checked){     	
		    	 break;
		    }
		} 
		if(i==temp.length){
			alert("没有选择信息！");
			return false;
		}
		if(confirm("确认分配？")){
			var form = document.forms[0].submit();
			
		}
	}
 
 </script>
 
 
  <body>
 <s:form action="userRole_addAssignRole.action?userId=%{userId}" method="post">
 <s:hidden name="page"></s:hidden>
 <table width="89%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="<%=path %>/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'><span>角色信息列表</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
 
 
 <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
  
    <tr bgcolor="#EEF4EA">
     <td > <div align="center"> 全选<input type="checkbox" id="delpk" onClick="return selAll();"></div></td>
      <td > <div align="center">角色名称</div></td>
        <td > <div align="center">角色说明</div></td>
      <td > <div align="center">角色属性</div></td>
     
    </tr>
    
<c:forEach items="${roleList}" var="entry">
    <tr>
    <td><div align="center">
    <input type="checkbox" name="checkId" value="${entry.roleId }" 
    <c:forEach var="item" items="${userRoleList}">   
<c:if test="${item.role.roleId eq entry.roleId}">     
 checked="checked"
 </c:if> 
</c:forEach> 
   />
    </div></td>
     <td ><div align="center">${entry.roleName}</div></td>
     <td ><div align="center">${entry.roleExplain}</div></td>
      <td ><div align="center"><c:if test="${entry.rolePropertier==0}">系统角色</c:if>
      <c:if test="${entry.rolePropertier==1}">普通角色</c:if>
     </div></td>
    </tr>
   </c:forEach>
  
     
	 <!----------------------LOOP END------------------------------->
   </table>

</td>
  </tr>
</table>
<table width="89%" border="0" cellspacing="1" cellpadding="3" style="margin-bottom:8px;margin-top:8px;">
          <tr> 
           
              <td width="100%" align="center">
             
              <input type="button" size="5"  class="btn"  onClick="javascript:toAssign()" value="分配"> &nbsp;&nbsp;
           	  <input type="button" class="btn"   onclick="javascript:history.back()" value="返回"> &nbsp;&nbsp;
    
            </td>
          </tr>
        </table>
  

	
  </s:form>
   </body>
</html>
