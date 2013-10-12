<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
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
  <body>
 <s:form action="userRole_getUserPageList.action" method="post">
 <s:hidden name="page"></s:hidden>
 <table width="89%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="<%=path %>/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'><span>用户信息列表</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
 
 
 <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
   
    <tr bgcolor="#EEF4EA">
      <td > <div align="center">用户名称</div></td>
      <td > <div align="center">帐号</div></td>
        <td > <div align="center">用户属性</div></td>
      <td > <div align="center">操作</div></td>
    </tr>
    
<c:forEach items="${pageView.records}" var="entry">
    <tr>
     <td ><div align="center">${entry.userName}</div></td>
    <td ><div align="center">${entry.account}</div></td>
      <td ><div align="center"><c:if test="${entry.userPropertier==0}">System</c:if>
      <c:if test="${entry.userPropertier==1}">Administrator</c:if>
      <c:if test="${entry.userPropertier==2}">Normal</c:if></div></td>
     <td > <div align="center"><a href="userRole_goAssignRolePage.action?userId=${entry.userId}">角色分配</a>
     <a href="userRole_deleteAllRoleByUserId.action?userId=${entry.userId}">删除所拥有角色</a></div> </td></tr>
   </c:forEach>
  
     
	 <!----------------------LOOP END------------------------------->
   </table>

</td>
  </tr>
</table>

  
<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin-bottom:8px;margin-top:8px;">
		<tr>
			<td align="right">
				<font >
    当前页:第${pageView.currentpage}页 | 总记录数:${pageView.totalrecord}条 | 每页显示:${pageView.maxresult}条 | 总页数:${pageView.totalpage}页</font>　
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}"><b><font color="#FFFFFF">第${wp}页</font></b></c:if>
    <c:if test="${pageView.currentpage!=wp}"><a href="javascript:topage('./userRole_getUserPageList.action','${wp}')" class="a03">第${wp}页</a></c:if>
</c:forEach>
			</td>
		</tr>
	</table> 
	
  </s:form>
   </body>
</html>
