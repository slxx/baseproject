<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   
    
    <title>欢迎使用</title>
    
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<script type="text/javascript" src="<%=path %>/js/pub.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery-ui.css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
  <script  type="text/javascript"src="<%=path %>/js/jquery-ui.js"></script>
<link href="<%=path %>/css/jquery-webox.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"  src="<%=path %>/js/jquery-webox.js"></script>



<c:if test="${message!=null }">
  <script>
   alert("${message}");
  </script>
</c:if>



<script type="text/javascript">

 function showBox(path){
	$.webox({
		height:420,
		width:600,
		bgvisibel:true,
		title:'角色信息列表',
		iframe:path
	});
	 
	 
	 
} 
</script>
 </head>
<body>
<s:form action="user_getPageList.action" method="post">
 <s:hidden name="page"></s:hidden>
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
       <%--  <li class="bg_lb"> <a onClick="javascript:window.location.href='<s:url action="user_goAddUI.action"/>'"> <i class="icon-plus-sign"></i>添加</a> </li> --%>
        
        <li class="btn_remove"><input name="" type="button" title="删除" onclick="javascript:toDel('<%=path%>/user_deleteAll.action')"/></li>
        </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
          <h5>用户数据列表</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <tr>
                  <th><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th class="ui-state-default"><div class="">用户名称</div></th>
                  <th class="ui-state-default"><div class="">帐号</div></th>
                  <th class="ui-state-default"><div class="">所属租户</div></th>
                  <th class="ui-state-default"><div class="">用户属性</div></th>
                  <th class="ui-state-default"><div class="">操作</div></th>
                </tr>
              </thead>
              <tbody>
   <c:if test="${pageView.records!=null }">
		   <c:forEach items="${pageView.records}" var="entry">
		    <tr>
		    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.userId }"></span></div></td>
		     <td >${entry.userName}</td>
		    <td >${entry.account}</td>
		     <td >${entry.rent.rentName}</td>
		      <td ><c:if test="${entry.userPropertier==0}">System</c:if>
		      <c:if test="${entry.userPropertier==1}">Administrator</c:if>
		      <c:if test="${entry.userPropertier==2}">Normal</c:if></td>
		     <td style="width:100px;">
		     <%-- <a href="user_goApproveUI.action?user.userId=${entry.userId}">账户审批</a> --%>
		    <%--  <a href="#" onclick="javascript:openWin('userRole_goAssignRolePage.action?userId=${entry.userId}','userRole',600,200,1);">角色授权</a> 
		     --%>  
		     <a  href="javascript:showBox('userRole_goAssignRolePage.action?userId=${entry.userId}')" class="icon-allot" title="角色分配" ></a>  
		     <a href="user_goUpdateUI.action?user.userId=${entry.userId}"  class="icon-edit" title="修改"></a>
		    <%--   <a href="#" onclick="javascript:todel('<%=path%>/user_delete.action?user.userId=${entry.userId}');" class="icon-remove" title="删除"></a></td>
		    --%>   </tr>
		   </c:forEach>
       </c:if>    
       <c:if test="${pageView.records==null }">
                             暂无数据
       </c:if>    
              </tbody>
            </table>
        </div>
      </div>
			<div class="black2">
<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin-bottom:8px;margin-top:8px;">
		<tr>
			<td align="right">
				<font >
    当前页:第${pageView.currentpage}页 | 总记录数:${pageView.totalrecord}条 | 每页显示:${pageView.maxresult}条 | 总页数:${pageView.totalpage}页</font>　
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}"><b><font color="#6b7a92">第${wp}页</font></b></c:if>
    <c:if test="${pageView.currentpage!=wp}"><a href="javascript:topage('./user_getPageList.action','${wp}')" class="a03">第${wp}页</a></c:if>
</c:forEach>
			</td>
		</tr>
	</table> 
	
	
			</div>
		</div>
</div>
</s:form>

<!--end-main-container-part--> 
<%-- <div id="dialog-message" title="提示信息">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;text-align: center" ></span>
 ${message}
  </p>
</div> --%>

</body>
</html>

