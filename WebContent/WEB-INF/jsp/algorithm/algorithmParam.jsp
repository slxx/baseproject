<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用</title>
   <%--  <sx:head extraLocales="UTF-8"/>  --%>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<SCRIPT LANGUAGE="JavaScript">
 
	function toStart(){
	  var form=document.forms[0];
		  form.action="<%=path%>/algorithm_jobStart.action";
		  form.submit();
		return true;
	}

	function closeBoxWindow(){
		 parent.document.getElementById("background1").style.display='none'; 
		 parent.document.getElementById("webox").style.display='none';
		 parent.document.getElementById("inside").style.display='none';
		 parent.document.getElementById("w_iframe").style.display='none';
	}

  </SCRIPT>



  </head>
  <body>
   <s:form action="algorithm_jobStart.action" method="post" enctype="multipart/form-data">
      <s:hidden name="algorithm.algorithmId"/>
      <s:hidden name="algorithm.algorithmClass"/>
	  <s:hidden name="algorithm.jarPath"/>
      <s:hidden name="algorithm.dataPath"/>
      <s:hidden name="algorithm.algorithmOutPath"/>
     <%--  <s:hidden name="algorithm.isValid"/>
      <s:hidden name="algorithm.algorithmName"/>
      <s:hidden name="algorithm.algorithmExplain"/>
	  <s:hidden name="algorithm.operDateTime"/>
	  <s:hidden name="algorithm.operUserId"/> --%>
    <!--main-container-part-->
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
        <h5>算法参数</h5>
      </div>
      <div class="widget-content">
					<table width="80%" height="62%" border="0" cellspacing="0" cellpadding="0">
						
                         <tr>
							<td class="min_td_r">新输入文件:</td>
							<td class="min_td_l"><input type="file" name="data"
							class="txt" /></td>
                         </tr>
                         
                         <tr>
							<td class="min_td_r">新输出路径:</td>
							<td class="min_td_l"><s:textfield name="outPath"
							cssClass="txt" />
							</td>
                         </tr>
						
					</table>
				  </div>
    </div>
    <div class="black2">
<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin-bottom:8px;margin-top:8px;">
		 <tr> 
           
              <td width="100%" align="center">
             <button type="button" class="bg_lb expand-all" onClick="javascript:toStart()" >确认</button>
             <input type="button"   class="bg_ly collapse-all" onclick="javascript:closeBoxWindow()" value="取消"/> &nbsp;&nbsp;
          
            </td>
          </tr>
	</table> 
	
			</div>
  </div>
</div>
		
  </s:form>
  </body>
</html>
