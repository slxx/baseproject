<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%-- <%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.tree.js"></script>
<!--左导航-->

<!-- <script type="text/javascript">
$(function(){
	$('#files').tree({
		expanded: 'li:first'
	});
});
</script> -->
</head>

<body>

<!--sidebar-menu-->
<div id="sidebar">
  <div id="firstpane" class="menu_list">
  <c:if test="${menuMap!=null }">
    <c:forEach items="${menuMap}" var="menuMap"  varStatus="varIndex">
    <p class="menu_head">
     <span>
      <font class="menu0${varIndex.index+1}">${menuMap.key}</font>
    </span></p>
    <div class="menu_body">
       <c:forEach items="${menuMap.value }" var="menu">
	    <a  href="<%=path %>${menu.targetPath }" target="main" title="${menu.menuName }"><em>-</em>${menu.menuName }</a> 
	    </c:forEach>
    </div>
    </c:forEach>
   </c:if>
  </div>
</div>
<!--sidebar-menu--> 


<!--sidebar-menu-->
<%-- <div id="sidebar">
  <div id="firstpane" class="menu_list">
  <c:if test="${menuMap!=null }">
    <c:forEach items="${menuMap}" var="menuMap"  varStatus="varIndex">
    <p class="menu0${varIndex.index+1}">${menuMap.key}</p>
    <div class="menu_body"> 
	     <c:forEach items="${menuMap.value }" var="menu">
	    <a class="current" href="<%=path %>${menu.targetPath }" target="main" title="${menu.menuName }">${menu.menuName }</a> 
	    </c:forEach>
    </div>
     </c:forEach>
   </c:if>
  </div>
</div> --%>
<!--sidebar-menu--> 

<%-- <body target="main">
<!--sidebar-menu-->
<div id="sidebar">
  <ul id="files">
   <c:forEach items="${menuMap}" var="menuMap"  varStatus="varIndex">
    <li class="list01 ico${varIndex.index+1}"><a href="javascript:void(0);">${menuMap.key}</a>
      <ul>
       <c:forEach items="${menuMap.value }" var="menu">
        <li><a class="current" href="<%=path %>${menu.targetPath }"  target="main" title="${menu.menuName }">${menu.menuName }</a></li>
        </c:forEach>
      </ul>
    </li>
    </c:forEach>
    
 
  </ul>
</div> --%>
<!--sidebar-menu--> 
</body>
</html>
