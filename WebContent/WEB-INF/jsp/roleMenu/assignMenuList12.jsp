<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		var temp=document.getElementsByName("childCheckId");
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
 
	function selAll(){ 
		var o=document.getElementsByName("checkId"); 
		var co=document.getElementsByName("childCheckId"); 
		for(i=0;i<o.length;i++) {
			if(!o[i].disabled){
			    o[i].checked=event.srcElement.checked; 
			}
		}
		for(i=0;i<co.length;i++) {
			if(!co[i].disabled){
			    co[i].checked=event.srcElement.checked; 
			}
		}
	}
	
	function selChildAll(index){ 
		var o=document.getElementsByName("checkId"); 
		var co=document.all("childCheckId"+index); 
		for(i=0;i<o.length;i++) {
			if(!o[i].disabled){
				for(j=0;j<co.length;j++) {
			     co[j].checked=event.srcElement.checked; 
				}
				co.checked=event.srcElement.checked; 
			}
		}
		alert(co);
	}
 
 </script>
 
 
  <body>
 <s:form action="roleMenu_addAssignMenu.action?roleId=%{roleId}" method="post">
 <s:hidden name="page"></s:hidden>
 <table width="89%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td background="<%=path %>/images/frame/wbg.gif" bgcolor="#EEF4EA" class='title'><span>角色信息列表</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>
 
 
 <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center">
      
     <tr bgcolor="#EEF4EA" >
      <td > <div align="center"> 全选<input type="checkbox" id="delpk" onClick="return selAll();"></div></td>
     <td><div align="center">一级菜单</div></td>
      <td><div align="center">菜单类别</div></td>
       <td><div align="center">二级级别</div></td>
    
    
    </tr>
    
<c:forEach items="${menuList}" var="entry" varStatus="varIndex">
    <tr>
    <td><div align="center">
    <input type="checkbox" name="checkId" value="${entry.menuId }"  onclick="return selChildAll(${varIndex.index});"
    <c:forEach var="item" items="${roleMenuList}">   
 <c:if test="${item.menu.menuId eq entry.menuId}">     
 checked="checked"
 </c:if> 
 
</c:forEach> />
    </div></td>
     <td ><div align="center">${entry.menuName}</div></td>
      <td ><div align="center"><c:if test="${entry.menuType==0}">系统菜单</c:if>
      <c:if test="${entry.menuType==1}">普通菜单</c:if></div></td>
      
    </tr>
     <c:forEach items="${entry.childMenu }" var="child" >
     <tr>
 <td></td>
 <td></td>
 <td></td>
      <td ><div align="left">
                <input type="checkbox" name="childCheckId" id="childCheckId${varIndex.index}" value="${child.menuId }"
                 <c:forEach var="item" items="${roleMenuList}">   
 <c:if test="${item.menu.menuId eq child.menuId}">     
 checked="checked"
 </c:if> 
 
</c:forEach> /> ${child.menuName}
                  </div>
            </td>
     
     
     
      </tr>
      </c:forEach>
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
