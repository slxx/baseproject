<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>

<script type="text/javascript" src="<%=path %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"  src="<%=path %>/js/jquery-webox.js"></script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>消息提示信息</title>
		<script type="text/javascript">
			/* function closewindow(){
				if(window.opener){
					window.opener.location.reload(true);
					window.close();
				}
			} */
			
			function closeBoxWindow(){
				 parent.document.getElementById("background1").style.display='none'; 
				 parent.document.getElementById("webox").style.display='none';
				 parent.document.getElementById("inside").style.display='none';
				 parent.document.getElementById("w_iframe").style.display='none';
			}
			function clock(){
				i = i -1;
				if(document.getElementById("info")){
					document.getElementById("info").innerHTML = "本窗口将在"+i+"秒后自动关闭";
				}
				if(i > 0)
					setTimeout("clock();",1000);
				else
					closeBoxWindow();
			}
			var i = 4;
			clock();
			

		</script>
	</head>
	
	<body>
		<br/>
		<center>
			${message}<p>
			<div id="info">本窗口将在3秒后自动关闭</div>
			<input type="button" value="关闭窗口" onclick="javascript:closeBoxWindow();">
					</center>
	</body>
	
</html>