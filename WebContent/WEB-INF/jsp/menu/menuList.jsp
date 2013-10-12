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
  
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
	<script type="text/javascript" src="<%=path %>/js/pub.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery-ui.css" />
<script src="<%=path %>/js/jquery-1.9.1.js"></script>
  <script src="<%=path %>/js/jquery-ui.js"></script>

 <c:if test="${message!=null }">
<script>
alert("${message}");
  </script>
</c:if>

  </head>
<body>
<s:form action="menu_getPageList.action" method="post">
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
       <li class="btn_plus"><input name="" type="button" title="添加" onclick="javascript:window.location.href='<s:url action="menu_goAddTreeUI.action"/>'"/></li>
        <li class="btn_remove"><input name="" type="button" title="删除" onclick="javascript:toDel('<%=path%>/menu_deleteAll.action')"/></li>
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
                  <th class="ui-state-default"><div class="">菜单名称</div></th>
                      <th class="ui-state-default"><div class="">提示信息</div></th>
                  <th class="ui-state-default"><div class="">菜单权限码</div></th>
                  <th class="ui-state-default"><div class="">菜单级别</div></th>
                  <th class="ui-state-default"><div class="">菜单索引</div></th>
                 <th class="ui-state-default"><div class="">菜单类别</div></th>
                  <th class="ui-state-default"><div class="">操作</div></th>
                </tr>
              </thead>
              <tbody>
  <c:forEach items="${pageView.records}" var="entry">
    <tr>
    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.menuId }"></span></div></td>
     <td >${entry.menuName}</td>
    <td >${entry.tipInfo}</td>
     <td >${entry.menuPopedomCode}</td>
     <td ><c:if test="${entry.menuLevel==0}">一级</c:if>
      <c:if test="${entry.menuLevel==1}">二级</c:if> 
      <c:if test="${entry.menuLevel==2}">三级</c:if></td>
     <td >${entry.menuIndex}</div></td>
      <td ><c:if test="${entry.menuType==0}">系统菜单</c:if>
      <c:if test="${entry.menuType==1}">普通菜单</c:if></td>
     <td style="width:20%;"> 
      <c:if test="${entry.menuLevel!=2}"><a href="menu_goSubPage.action?parentMenuId=${entry.menuId}">下级菜单</a></c:if>
     <a href="menu_goUpdateUI.action?menu.menuId=${entry.menuId}" class="icon-edit" title="修改"></a>
      <a href="#" onclick="javascript:todel('<%=path%>/menu_delete.action?menu.menuId=${entry.menuId}');"  class="icon-remove" title="删除"></a></td>
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
    <c:if test="${pageView.currentpage!=wp}"><a href="javascript:topage('./menu_getPageList.action','${wp}')" class="a03">第${wp}页</a></c:if>
</c:forEach>
			</td>
		</tr>
	</table> 
	
			
		</div>
</div>
</s:form>

<!--end-main-container-part--> 
<%-- <div id="dialog-message" title="提示信息">
  <p>
    <span class="ui-state-default" style="float: left; margin: 0 7px 50px 0;text-align: center" ></span>
 ${message}
  </p>
</div> --%>
</body>
</html>









