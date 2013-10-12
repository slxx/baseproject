<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>" />
    
    <title>欢迎使用</title>
    
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<script>
		function logout(){
			var f = confirm('确定要注销登录?');
			if(!f)
				return false;
			top.location.href = '<%=path%>/logout.jsp';
		}
	</script>

<!--左导航-->
</head>



<!--Header-part-->
<div id="header">
  <span class="logo"></span>
  <!--top-Header-menu-->
  <div id="user-nav">
    <ul class="nav">
      <li class="active"><a title="" href="#"><i class="icon icon-user"></i>欢迎您！${user.userName}</a> </li>
      <li class=""><a title="" target="_parent" href="#" onclick="logout();" ><i class="icon icon-quit"></i>退出</a></li>
    </ul>
  </div>
	<!--close-top-Header-menu-->
</div>
<!--close-Header-part--> 


</html>


