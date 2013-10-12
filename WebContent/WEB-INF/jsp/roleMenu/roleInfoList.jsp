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
 <s:form action="roleMenu_getRolePageList.action" method="post">
 <s:hidden name="page"></s:hidden>
 <table width="89%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="<%=path %>/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'><span>用户信息列表</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
 
 
<table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
   
    <tr bgcolor="#EEF4EA">
      <td > <div align="center">角色名称</div></td>
        <td > <div align="center">角色说明</div></td>
      <td > <div align="center">角色属性</div></td>
      <td > <div align="center">操作</div></td>
    </tr>
    
<c:forEach items="${pageView.records}" var="entry">
    <tr>
     <td ><div align="center">${entry.roleName}</div></td>
     <td ><div align="center">${entry.roleExplain}</div></td>
      <td ><div align="center"><c:if test="${entry.rolePropertier==0}">系统角色</c:if>
      <c:if test="${entry.rolePropertier==1}">普通角色</c:if>
     </div></td>
    
     <td > 
     <div align="center"><a href="roleMenu_goAssignMenuPage.action?roleId=${entry.roleId}">资源分配</a>
     <a href="roleMenu_deleteAllMenuByRoleId.action?roleId=${entry.roleId}">删除所拥有资源</a></div> 
     </td></tr>
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
    <c:if test="${pageView.currentpage!=wp}"><a href="javascript:topage('./roleMenu_getRolePageList.action','${wp}')" class="a03">第${wp}页</a></c:if>
</c:forEach>
			</td>
		</tr>
	</table> 
	
  </s:form>
   </body>
</html>
