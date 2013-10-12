<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
	<script type="text/javascript" src="<%=path%>/js/pub.js"></script>
<link rel="stylesheet" href="<%=path %>/css/jquery-ui.css" />
<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>

 <c:if test="${message!=null }">
<script>

alert("${message}");

  /*  $(function() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      }
    });
  }); */
  </script>
</c:if>

  </head>

<body>

<s:form action="person_getPageList.action" method="post">
 <s:hidden name="page"></s:hidden>
<!--main-container-part-->
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
       <li class="btn_plus"><input name="" type="button" title="添加" onclick="javascript:window.location.href='<s:url action="person_goAddUI.action"/>'"/></li>
        <li class="btn_remove"><input name="" type="button" title="删除" onclick="javascript:toDel('<%=path%>/person_deleteAll.action')"/></li>
      </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
          <h5>角色信息列表</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <tr>
                  <th><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th class="ui-state-default"><div class="">用户姓名</div></th>
                  <th class="ui-state-default"><div class="">出生年月</div></th>
                   <th class="ui-state-default"><div class="">所属租户</div></th>
                  <th class="ui-state-default"><div class="">性别</div></th>
                  <th class="ui-state-default"><div class=""> 职位（行政）</div></th>
                     <th class="ui-state-default"><div class=""> 联系电话</div></th>
                  <th class="ui-state-default"><div class="">操作</div></th>
                 
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${pageView.records}" var="entry">
    <tr>
    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.personId }"></span></div></td>
     <td >${entry.personName}</td>
    <td >${entry.birthday}</td>
      <td >${entry.rent.rentName}</td>
      <td ><c:if test="${entry.sex==0}">男</c:if>
      <c:if test="${entry.sex==1}">女</c:if></td>
        <td >${entry.position}</td>
          <td > ${entry.tel}</td>
     <td style="width:100px;">
	      <c:if test="${entry.user==null}">
	        <a href="person_goUserAddUI.action?person.personId=${entry.personId}" class="icon-allot" title="开通账户" ></a>
	     </c:if>
     <a href="person_goUpdateUI.action?person.personId=${entry.personId}" class="icon-edit" title="修改"></a>
      <a href="#" onclick="javascript:todel('<%=path%>/person_delete.action?person.personId=${entry.personId}');" class="icon-remove" title="删除"></a></td>
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
     <c:if test="${pageView.totalpage>1&&pageView.currentpage!=1}">
    <a href="javascript:topage('./person_getPageList.action','${pageView.currentpage-1}')" class="a03">上一页</a>
    </c:if>
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}"><b><font color="#6b7a92">第${wp}页</font></b></c:if>
		    <c:if test="${pageView.currentpage!=wp}">
			    <c:if test="${wp>(pageView.currentpage-5)&&wp<(pageView.currentpage+5)}">
			    <a href="javascript:topage('./person_getPageList.action','${wp}')" class="a03">第${wp}页</a>
			    </c:if>
	</c:if>
</c:forEach>
    <c:if test="${pageView.currentpage<pageView.totalpage}">
    <a href="javascript:topage('./person_getPageList.action','${pageView.currentpage+1}')" class="a03">下一页</a>
    </c:if>

			</td>
		</tr>
	</table> 
      </div>     
  </div>
</div>

<!--end-main-container-part--> 

<!--Footer-part-->
<%-- <div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Shenlu Admin.</div>
</div>
<div id="dialog-message" title="提示信息">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;text-align: center" ></span>
 ${message}
  </p>
</div> --%>
</s:form>
<!--end-Footer-part-->
</body>
</html>





