<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<script type="text/javascript" src="<%=path%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-focus.js"></script>

<script type="text/javascript" src="<%=path%>/js/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="<%=path%>/js/login.js"></script>
<link rel="stylesheet" href="<%=path%>/css/login.css" />
<SCRIPT LANGUAGE="JavaScript">
  <!--
	function checkForm(){
	 
		var userName = document.getElementsByName("user.userName")[0];
		var passWord=document.getElementsByName("user.passWord")[0];
		if(userName.value=="" || userName.value.length<3){
			alert("请输入长度3位以上的用户名");
			return false;
		}
		if(passWord.value=="" || passWord.value.length<3){
			alert("请输入长度3位以上的密码");
			return false;
		}
		var form=document.forms[0];
		  form.action="<%=path%>/login_login.action";
		  form.submit();
		return true;
	}
  //-->
  </SCRIPT>
  <script language="javascript" type="text/javascript">
function glb_searchTextOnfocus(obj) {
	if (obj.value == '请输入关键词...')
		obj.value = '';
	obj.style.color = '#888';
}
function glb_searchTextOnBlur(obj) {
	if (obj.value == '') {
		obj.value = '请输入关键词...';
		obj.style.color = '#888';
	} else {
		obj.style.color = '#888';
	}
}
</script>
  
   <c:if test="${message!=null }">
<script>
alert("${message}");
  </script>
</c:if>
</head>
<body>
<!--头部-->
<div id="top">
  <div class="main">
    <div class="logo"></div>
    <ul class="nav">
      <li><a href="#">关于我们</a></li>
      <li><a href="#">产品概况</a></li>
      <li><a href="#">技术实力</a></li>
      <li><a href="#">成功案例</a></li>
    </ul>
    <form id="loginform"  action="login_login" method="post" onsubmit="return checkForm();">
     <div id="login"> <a href="#" id="link" class="signin"></a>
      <div class="drop">
        <label for="name">用户名:</label>
        <s:textfield name="user.userName"  cssClass="input01"/>
        <label for="password">密&nbsp;&nbsp;码:</label>
         <s:password name="user.passWord"  cssClass="input01"/>
        <p class="remember">
          <input type="checkbox" class="checkbox"/>
          记住密码</p>
        <input type="submit" class="submit" value="登录"/>
        <!-- <p><a href="index.html" class="tooltip">忘记密码?重新找回……</a></p> -->
      </div>
    </div>
    </form>
  </div>
</div>
<!--焦点图-->
<div id="Slidebox"> 
  <!--flash begin-->
  <div id="flashBg">
    <div id="flashLine">
      <div id="flash"> <a name="#0080b4" style="display:block;" id="flash1" target="_blank" href="#"><img src="<%=path%>/images/img01.jpg" width="1000" height="388"></a> <a name="#0080b4" style="display:block" id="flash2" target="_blank" href="#"><img src="<%=path%>/images/img02.jpg" width="1000" height="388"></a> <a name="#0080b4" id="flash3" target="_blank" href="#"><img src="<%=path%>/images/img03.jpg" width="1000" height="388"></a>
        <div class="flash_bar">
          <div class="dq"  id="f1" onclick="changeflash(1)"></div>
          <div class="no"  id="f2" onclick="changeflash(2)"></div>
          <div class="no"  id="f3" onclick="changeflash(3)"></div>
        </div>
      </div>
    </div>
  </div>
  <!--flash end--> 
</div>
<!--搜索-->
<div id="search">
  <div class="main">
    <div class="tip"><font class="red">公告：</font>神路统计数据服务最新发布</div>
    <div class="box">
      <input class="searchkey" name=""  type="text" value="请输入关键词..." onfocus="glb_searchTextOnfocus(this);"  onblur="glb_searchTextOnBlur(this);" maxlength="70" >
      <input type="submit" class="searchbut" value=""  onClick=""/>
    </div>
  </div>
</div>
<!--介绍-->
<div class="main">
	<div id="content">
    <div class="con">
      <div class="con_l"><img src="<%=path%>/images/pic01.png" width="100" height="100"></div>
      <div class="con_r">
        <div class="tit"><img src="<%=path%>/images/tit01.png" width="114" height="16"></div>
        <div class="txt">支持各类数据库及多种文件格式的数据采集，提供多种形式的数据发布服务。</div>
        <div class="link"><a href="#">了解更多>></a></div></div>
    </div>
    <div class="con">
      <div class="con_l"><img src="<%=path%>/images/pic02.png" width="100" height="100"></div>
      <div class="con_r">
        <div class="tit"><img src="<%=path%>/images/tit02.png" width="114" height="16"></div>
        <div class="txt">内置常用数据分析算法，支持自定义算法的加载，实时监控算法的运行状态与结果。</div>
        <div class="link"><a href="#">了解更多>></a></div></div>
    </div>
    <div class="con2">
      <div class="con_l"><img src="<%=path%>/images/pic03.png" width="100" height="100"></div>
      <div class="con_r">
        <div class="tit"><img src="<%=path%>/images/tit03.png" width="114" height="16"></div>
        <div class="txt">支持各种结果格式和数据库的存储，提供各类数据的知识化展示服务。</div>
        <div class="link"><a href="#">了解更多>></a></div></div>
      </div>
    </div>
   </div>
</div>
<!--底部-->
<div id="foot">
  <div class="main"><p>Copyright&copy;2013 神路信息咨询有限公司 版权所有</p></div>
</div>
</body>
</html>

