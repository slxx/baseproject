<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    
    <title>欢迎使用</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	
	
  </head>
   <frameset rows="77,*,6%" cols="*" id="topFrame" name="topFrame"  frameborder="no" border="0" framespacing="0"> 
	  <frame src="<%=path %>/top.jsp" id="topFrame" name="topFrame" scrolling="no" /> 
   <frameset cols="180,*" id="centerFrame" name="centerFrame" frameborder="NO" border="0" framespacing="0" > 
	  <frame src="<%=path %>/login_searchMenu.action" noresize name="menu" scrolling="no" /> 
<%-- 	 <frame src="<%=path %>/left.jsp" noresize name="menu" scrolling="no" />  --%>
	 <frame src="<%=path %>/user_getPageList.action" noresize name="main" />
   </frameset>
     <frame src="<%=path %>/buttom.jsp" id="topFrame" name="topFrame" scrolling="no" /> 
 </frameset> 
 
	<noframes>

	   您的浏览器不支持框架！
	
	</noframes> 
</html>
