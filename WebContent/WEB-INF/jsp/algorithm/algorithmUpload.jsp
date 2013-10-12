<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%-- <%@ taglib prefix="sx" uri="/struts-dojo-tags" %> --%>
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
 
	function add(){
	   var algorithmName=document.all("algorithm.algorithmName");
	  var algorithmOutPath=document.all("algorithm.algorithmOutPath");
	  var jar=document.all("jar");
	  var algorithmExplain=document.all("algorithm.algorithmExplain");
	  if(algorithmName.value==""){
	  		alert("算法名称不能为空!");
	  		return false;
	  	}
	
	  if(algorithmOutPath.value==""){
	  	alert("输出路径不能为空!");
	  	return false;
	  }else {
		  var fdStart = algorithmOutPath.value.indexOf("/");
		  if(fdStart != 0){
			  alert("输出路径格式不正确,应以/开头,如/user/hadopp/");
			  return false;
		  }
	  }
	  if(jar.value==""){
	  	alert("没有选择上传的算法!");
	  	return false;
	  }
	  if(algorithmExplain.value==""){
	  	alert("算法说明不能为空!");
	  	return false;
	  } 
	 
	  var form=document.forms[0];
		  form.action="<%=path%>/algorithm_uploadAlgorithm.action";
		  form.submit();
		return true;
	}

  </SCRIPT>



  </head>
  <body>
   <s:form action="algorithm_uploadAlgorithm.action" method="post" enctype="multipart/form-data">
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
      
      <li class="btn_bc"><input name="" type="button" title="保存" onclick="javascript:add();"></li>
        <li class="btn_cz"><input name="" type="button" title="重置" onclick="javascript:document.forms[0].reset();"></li>
        <li class="btn_fh"><input name="" type="button" title="返回" onClick="javascript:history.back();"></li>
      
          </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
      <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
        <h5>算法上传</h5>
      </div>
      <div class="widget-content">

   <s:hidden name="algorithm.isValid" value="true"/>

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="td_r"><span style="color: red">*</span>算法名称:</td>
							<td class="td_l"><s:textfield name="algorithm.algorithmName"
									cssClass="txt" /></td>
						
                         </tr>
                         <tr>
							<td class="td_r"><span style="color: red">*</span>算法描述:</td>
							<td class="td_l"><s:textfield name="algorithm.algorithmExplain" 
								cssClass="txt"	/></td>
						
                         </tr>
                        
                          <tr>
							<td class="td_r"><span style="color: red">*</span>算法jar包:</td>
							<td class="td_l"> <input type="file" name="jar"
									class="txt1" /></td>
						
                         </tr>
                         <tr>
							<td class="td_r"><span style="color: red">*</span>入口类包名类名:</td>
							<td class="td_l"><s:textfield name="algorithm.algorithmClass"
									cssClass="txt" /></td>
						
                         </tr>
                         
                           <tr>
							<td class="td_r"><span style="color: red">*</span>输入文件:</td>
							<td class="td_l"><input type="file" name="data"
									class="txt1" /></td>
						
                         </tr>
                         
                         <tr>
							<td class="td_r">输出路径:</td>
							<td class="td_l"><s:textfield name="algorithm.algorithmOutPath"
									cssClass="txt" />
									</td>
						
                         </tr>
                         
					</table>
				  </div>
    </div>
  </div>
</div>
		
  </s:form>
  </body>
</html>
