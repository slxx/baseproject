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
<link href="<%=path %>/css/jquery-webox.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"  src="<%=path %>/js/jquery-webox.js"></script>

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

<script type="text/javascript">

 function showJobParamBox(path){
	$.webox({
		height:420,
		width:600,
		bgvisibel:true,
		title:'更新参数列表',
		iframe:path
	});
	 
	 
} 
</script>
  </head>

<body>

<s:form action="algorithm_getPageList.action" method="post">
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
    
    <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
          <h5>算法信息列表</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <tr>
                  <th><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th class="ui-state-default"><div class="">算法名称</div></th>
                  <th class="ui-state-default"><div class="">入口类</div></th>
                     <th class="ui-state-default"><div class="">算法说明</div></th>
                  <th class="ui-state-default"><div class="">输出路径</div></th>
                 <th class="ui-state-default"><div class="">操作</div></th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${pageView.records}" var="entry">
    <tr>
    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.algorithmId }"></span></div></td>
     <td >${entry.algorithmName}</td>
      <td >${entry.algorithmClass}</td>
      <td >${entry.algorithmExplain}</td>
      <td >${entry.algorithmOutPath}</td>
    <td > <a href="#" onClick="javascript:showJobParamBox('<%=path%>/algorithm_toJobStart.action?algorithm.algorithmId=${entry.algorithmId}')">启动</a>
    <a href="<%=path %>/algorithm_jobStart.action?algorithm.algorithmId=${entry.algorithmId}">启动</a></td>
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
    <a href="javascript:topage('./algorithm_getPageList.action','${pageView.currentpage-1}')" class="a03">上一页</a>
    </c:if>
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}"><b><font color="#6b7a92">第${wp}页</font></b></c:if>
		    <c:if test="${pageView.currentpage!=wp}">
			    <c:if test="${wp>(pageView.currentpage-5)&&wp<(pageView.currentpage+5)}">
			    <a href="javascript:topage('./algorithm_getPageList.action','${wp}')" class="a03">第${wp}页</a>
			    </c:if>
	</c:if>
</c:forEach>
    <c:if test="${pageView.currentpage<pageView.totalpage}">
    <a href="javascript:topage('./algorithm_getPageList.action','${pageView.currentpage+1}')" class="a03">下一页</a>
    </c:if>

			</td>
		</tr>
	</table> 
      </div>     
  </div>
</div>

<!--end-main-container-part--> 

<!--Footer-part-->

</s:form>
<!--end-Footer-part-->
</body>
</html>





