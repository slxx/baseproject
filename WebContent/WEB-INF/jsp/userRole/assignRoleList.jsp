<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<script type="text/javascript">
 
 function toAssign(userId){
	 var checkId="";
		var temp=document.getElementsByName("checkId");
		for (i=0;i<temp.length;i++){ 
		  //遍历Radio 
		    if(temp[i].checked){  
		    	checkId+=temp[i].value+",";
		    	 break;
		    }
		} 
		if(i==temp.length){
			alert("没有选择信息！");
			return false;
		}
		
		if(confirm("确认分配？")){
			var form=document.forms[0];
		<%--  form.action="<%=path%>/userRole_addAssignRole.action?userId="+userId+"&checkId="+checkId; --%>
		// form.action="<%=path%>/userRole_addAssignRole.action?userId="+userId;	 
		 form.submit();
		
		
		}
	}
function closeBoxWindow(){
	 parent.document.getElementById("background1").style.display='none'; 
	 parent.document.getElementById("webox").style.display='none';
	 parent.document.getElementById("inside").style.display='none';
	 parent.document.getElementById("w_iframe").style.display='none';
}



 </script>

  </head>
<body>
<s:form action="userRole_addAssignRole.action?userId=%{userId}" name="form1" id="form1" method="post">
 <s:hidden name="page"></s:hidden>
 <c:forEach var="item" items="${userRoleList}"> 
</c:forEach> 
<div id="min_content"> 
  <!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首页</a> <a href="#" class="current last-child">系统菜单管理</a> </div>
  </div>
  <!--End-breadcrumbs--> 
  <!--Action boxes-->
  <div class="container-fluid">
   
    <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
          <h5>用户数据列表</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <tr>
                  <th><div class="checker"><span></span></div></th>
                  <th class="ui-state-default"><div class="">角色名称</div></th>
                  <th class="ui-state-default"><div class="">角色说明</div></th>
                 
                 
                </tr>
              </thead>
              <tbody>
  <c:forEach items="${roleList}" var="entry">
    <tr>
    <td><div align="center">
    <input type="radio" name="checkId" value="${entry.roleId }" 
    <c:forEach var="item" items="${userRoleList}">   
<c:if test="${item.role.roleId eq entry.roleId}">     
 checked="checked"
 </c:if> 
</c:forEach> 
   />
    </div></td>
     <td ><div align="center">${entry.roleName}</div></td>
     <td ><div align="center">${entry.roleExplain}</div></td>
    </tr>
   </c:forEach>
  
               
              </tbody>
            </table>
        </div>
      </div>
			<div class="black2">
<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin-bottom:8px;margin-top:8px;">
		 <tr> 
           
              <td width="100%" align="center">
             <button type="button" class="bg_lb expand-all" onClick="javascript:toAssign('${userId}')" >分配</button>
             <input type="button"   class="bg_ly collapse-all" onclick="javascript:closeBoxWindow()" value="取消"/> &nbsp;&nbsp;
          
            </td>
          </tr>
	</table> 
	
			</div>
		</div>
</div>

</s:form>

<!--end-main-container-part--> 
</body>
</html>



