<%@ page language="java" import="java.util.*,com.slxx.util.*,org.apache.hadoop.mapred.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

PageView pageView=(PageView)request.getAttribute("pageView");
ArrayList jobStatusAll=null;
if(pageView!=null){
	jobStatusAll=(ArrayList)pageView.getRecords();
}
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
          <h5>算法信息列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <a  href="http://192.168.1.123:50070" target="_blank">50070</a>&nbsp;&nbsp;&nbsp;&nbsp;
             <a href="http://192.168.1.123:50030" target="_blank">50030</a>&nbsp;&nbsp;&nbsp;&nbsp;
             
           </h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <tr>
                  <th><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th class="ui-state-default"><div class="">Jobid</div></th>
                  <th class="ui-state-default"><div class="">User</div></th>
                    <th class="ui-state-default"><div class="">JobState</div></th>
                     <th class="ui-state-default"><div class="">StartTime</div></th>
                      <th class="ui-state-default"><div class="">mapProgress</div></th>
                       <th class="ui-state-default"><div class="">reduceProgress</div></th>
                      <th class="ui-state-default"><div class="">Job Scheduling Information</div></th>
                     <th class="ui-state-default"><div class="">Priority</div></th>
                
                </tr>
              </thead>
              <tbody>
              <%if(jobStatusAll!=null&&jobStatusAll.size()>0){
              for (int i=0;i<jobStatusAll.size();i++){ 
            	  JobStatus jobStatus=(JobStatus)jobStatusAll.get(i);%>
              
	    		<tr>
			    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="<%=jobStatus.getJobID() %>"></span></div></td>
			     <td ><%=jobStatus.getJobID() %></td>
			     <td ><%=jobStatus.getUsername() %></td>
			     
			       <td ><%if(jobStatus.getRunState()==jobStatus.RUNNING){%>RUNNING
			         <%}else if(jobStatus.getRunState()==jobStatus.SUCCEEDED){%>SUCCEEDED
			          <%}else if(jobStatus.getRunState()==jobStatus.FAILED){%>FAILED
			           <%}else if(jobStatus.getRunState()==jobStatus.PREP){%>PREP
			            <%}else if(jobStatus.getRunState()==jobStatus.KILLED){%>KILLED
			            <%} %>
			         </td>
			        <td ><%=WebUtil.longToStrngDateTime(String.valueOf(jobStatus.getStartTime()))%></td>
			         <td ><%=jobStatus.mapProgress()*100%>%</td>
			          <td ><%=jobStatus.reduceProgress()*100%>%</td>
			         <td ><%=jobStatus.getSchedulingInfo()%></td>
			      <td ><%=jobStatus.getJobPriority() %></td>
			 
	          <%}} %>
              
              
              <%--  <c:forEach items="${jobStatusAll}" var="entry">
    <tr>
    <td style="width:20px;"><div class="checker"><span><input type="checkbox" name="checkId" value="${entry.jobID }"></span></div></td>
     <td ><%=jobStatus.getRunState() %></td>
      <td >success</td>
   
   </c:forEach> --%>
              
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
    <a href="javascript:topage('./algorithm_getStatusPage.action','${pageView.currentpage-1}')" class="a03">上一页</a>
    </c:if>
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}"><b><font color="#FFFFFF">第${wp}页</font></b></c:if>
		    <c:if test="${pageView.currentpage!=wp}">
			    <c:if test="${wp>(pageView.currentpage-5)&&wp<(pageView.currentpage+5)}">
			    <a href="javascript:topage('./algorithm_getStatusPage.action','${wp}')" class="a03">第${wp}页</a>
			    </c:if>
	</c:if>
</c:forEach>
    <c:if test="${pageView.currentpage<pageView.totalpage}">
    <a href="javascript:topage('./algorithm_getStatusPage.action','${pageView.currentpage+1}')" class="a03">下一页</a>
    </c:if>

			</td>
		</tr>
	</table> 
      </div>     
  </div>
</div>

<!--end-main-container-part--> 

<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Shenlu Admin.</div>
</div>
<div id="dialog-message" title="提示信息">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;text-align: center" ></span>
 ${message}
  </p>
</div>
</s:form>
<!--end-Footer-part-->
</body>
</html>





