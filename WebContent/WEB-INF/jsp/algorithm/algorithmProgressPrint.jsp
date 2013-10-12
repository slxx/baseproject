<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

	<script type="text/javascript" src="<%=path%>/js/pub.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery-ui.css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
<script type="text/javascript">
var k=0;
if(k<5){
  setInterval("Push()",1000*1);
   //response.setHeader("refresh","1;URL=algorithm_getJobProgress.action"); 
   k++;
}else{
	// response.sendRedirect("<%=path%>/algorithm_getStatusPage.action") 
}

 function Push() {
	 $.ajax({
	 type: "POST",
	 url: encodeURI("algorithm_getJobProgress.action"),
	 success: function(data) {
	 $('#context11').text(data);
	 }
 });} 
 </script>
  
  <%
	/*  String mapPer=(String)request.getParameter("map");
	String redPer=(String)request.getParameter("reduce");
	double map,reduce;
	map=Double.parseDouble(mapPer);
	reduce=Double.parseDouble(redPer); 
	System.out.println(mapPer+"#########"+reduce); */
   %>
  
  
  <body>
  	 <h3>Map Reduce Progress</h3> <br>
    
   <%--  <table border="1">
    	<tr>
    		<th>Map Progress</th>
    		<td><%=map*100 %>%</td>
    	</tr>
    	<tr>
    		<th>Reduce Progress</th>
    		<td><%=reduce*100 %>%</td>
    	</tr>
    </table> --%>
   <label id="context11">
   <div id="map">Map Progress:${map*100}%</div><br/>
    <div id="Reduce">Reduce Progress:${reduce*100}%</div><br/>
   
    <%-- <table border="1">
    	<tr>
    		<th>Map Progress</th>
    		<td>${map*100}%</td>
    	</tr>
    	<tr>
    		<th>Reduce Progress</th>
    		<td>${reduce*100}%</td>
    	</tr>
    </table>  --%>
   </label> 
 <%--   
  <% // if(reduce<1.0){  // 没有完成任务则进行跳转
   // 跳转到servlet 获取map和reduce执行情况 
  	// response.setHeader("refresh","3;URL=algorithm_getJobProgress.action"); 
  //	}else{
   %>
   <h3> response.sendRedirect("<%=path%>/algorithm_getStatusPage.action") </h3>
   <%//} %>
    --%>
  <%--  <c:if test="${reduce<1.0}">
    response.setHeader("refresh","3;URL=algorithm_getJobProgress.action"); 
   </c:if>
    <c:if test="${reduce>1.0}">
    <h3> response.sendRedirect("<%=path%>/algorithm_getStatusPage.action") </h3>
    </c:if> --%>
  </body>
</html>
