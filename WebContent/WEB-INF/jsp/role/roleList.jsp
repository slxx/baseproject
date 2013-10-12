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
	<script type="text/javascript" src="<%=path %>/js/pub.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery-ui.css" />
  <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
  
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
		height:520,
		width:300,
		bgvisibel:true,
		title:'菜单信息列表',
		iframe:path
	});
	
} 
</script>
  </head>
<body>
<s:form action="role_getPageList.action" method="post">
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
       <li class="btn_plus"><input name="" type="button" title="添加" onclick="javascript:window.location.href='<s:url action="role_goAddUI.action"/>'"/></li>
        <li class="btn_remove"><input name="" type="button" title="删除" onclick="javascript:toDel('<%=path%>/role_deleteAll.action')"/></li>
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
                  <th class="ui-state-default"><div class="">角色名称</div></th>
                  <th class="ui-state-default"><div class="">角色说明</div></th>
                  <th class="ui-state-default"><div class="">角色属性</div></th>
                  <th class="ui-state-default"><div class="">操作</div></th>
                </tr>
                
               
              </thead>
              <tbody>
 <c:forEach items="${pageView.records}" var="entry">
    <tr>
    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.roleId }"></span></div></td>
     <td >${entry.roleName}</td>
     <td >${entry.roleExplain}</td>
      <td ><c:if test="${entry.rolePropertier==0}">系统角色</c:if>
      <c:if test="${entry.rolePropertier==1}">普通角色</c:if>
     </td>
      <td style="width:100px;">
      <a href="#" onclick="javascript:showBox('roleMenu_goAssignMenuPage.action?roleId=${entry.roleId}');" class="icon-allot" title="角色授权" ></a> 
    
    <%--<a href="#" onclick="javascript:openWin('roleMenu_goAssignMenuPage.action?roleId=${entry.roleId}','roleMenu',200,600,1);" class="icon-allot" title="角色授权" ></a> --%>
     <a href="role_goUpdateUI.action?role.roleId=${entry.roleId}"  class="icon-edit" title="修改"></a>
      <a href="role_delete.action?role.roleId=${entry.roleId}" class="icon-remove" title="删除"></a></td>
      </tr>
   </c:forEach>
               
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
    <c:if test="${pageView.currentpage!=wp}"><a href="javascript:topage('./role_getPageList.action','${wp}')" class="a03">第${wp}页</a></c:if>
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
</div>
 --%>
</body>
</html>















