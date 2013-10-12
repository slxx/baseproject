<%@ page language="java" pageEncoding="UTF-8"%>
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
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css" />
  
  </head>
	<body leftmargin="8" topmargin='8'>
<table width="98%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td>
		<div style='float: left'><img height="14"
			src="<%=path %>/images/frame/book1.gif" width="20" />&nbsp;欢迎使用商业管理系统,易用方便的首选
		</div>
		<div style='float: right; padding-right: 8px;'><!--  //保留接口  -->
		</div>
		</td>
	</tr>
	<tr>
		<td height="1" background="<%=path %>/images/frame/sp_bg.gif"
			style='padding: 0px'></td>
	</tr>
</table>
</body>
</html>
