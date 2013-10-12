<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>

<script language="javaScript" src="<%=path %>/js/MzTreeView12.js"></script>
<style>
body {font:normal 12px 宋体}
a.MzTreeview  { cursor: hand; color: #000080; margin-top: 5px; padding: 2 1 0 2; text-decoration: none; }
.MzTreeview a.select { color: highlighttext; background-color: highlight; }
#kkk input {
vertical-align:middle;
}
.MzTreeViewRow {border:none;width:300px;padding:0px;margin:0px;border-collapse:collapse}
.MzTreeViewCell0 {border-bottom:1px solid #CCCCCC;padding:0px;margin:0px;}
.MzTreeViewCell1 {border-bottom:1px solid #CCCCCC;border-left:1px solid #CCCCCC;width:120px;padding:0px;margin:0px;}
</style>
<script language="javaScript">
function closeBoxWindow(){
	 parent.document.getElementById("background1").style.display='none'; 
	 parent.document.getElementById("webox").style.display='none';
	 parent.document.getElementById("inside").style.display='none';
	 parent.document.getElementById("w_iframe").style.display='none';
}
</script>
</head>
<body>

<h3>选择菜单 </h3>


<table class='MzTreeViewRow' style="background:#EEEEEE;border-top:1px solid #CCCCCC;"><tr><th class='MzTreeViewCell0'>菜单名称</th></table>

<div id="kkk"></div>


	<script language="javascript" type="text/javascript">
	<!--
	var MzTreeViewTH="<table class='MzTreeViewRow'><tr><td class='MzTreeViewCell0'>";
	//var MzTreeViewTD="\"</td><td class='MzTreeViewCell1'>\"</td></tr></table>\"";
	var MzTreeViewTD="\"</td></tr></table>\"";
	window.tree = new MzTreeView("tree");
	tree.setIconPath("images/"); 
	<c:forEach items="${menuList}" var="entry" varStatus="varIndex">
	 tree.N["0_${entry.menuId}"] = "ctrl:sel0;<c:if test='${item.menu.menuId eq entry.menuId}'>checked:1;</c:if>T:${entry.menuName };"
		 <c:forEach items="${entry.childMenu }" var="child" >
		 tree.N["${entry.menuId}_${child.menuId}"] = "ctrl:sel; <c:forEach var="item" items="${roleMenuList}"><c:if test='${item.menu.menuId eq child.menuId}'>checked:1;</c:if></c:forEach>T:${child.menuName };"
		 </c:forEach>
    </c:forEach>
	
	
	tree.setURL("#");
	tree.wordLine = false;
	tree.setTarget("main");
	document.getElementById("kkk").innerHTML=tree.toString();
	tree.expandAll();
	
	//alert(document.getElementsByTagName("head")[0].innerHTML);
	//alert(document.getElementById("kkk").innerHTML);
	
	function toAssign()
	{
		var es=document.getElementsByName("sel");
		var childCheckId="";
		for(var i=0;i<es.length;i++)
		{
			if (es[i].checked) childCheckId+=es[i].value+",";
		}
		if(confirm("确认分配？")){
			  var form=document.forms[0];
			  form.action="<%=path%>/roleMenu_addAssignMenu.action?roleId=${roleId}&childCheckId="+childCheckId;
			  form.submit();
			
		}
	}
	//-->
	</script>
<p>
<s:form action="roleMenu_addAssignMenu.action?roleId=%{roleId}" method="post">
 <s:hidden name="page"></s:hidden>
<div class="black2">
<table width="100%" border="0" cellpadding="3" cellspacing="1" style="margin-bottom:8px;margin-top:8px;">
		 <tr> 
           
              <td width="100%" align="center">
             <button type="button" class="bg_lb expand-all"onclick="javascript:toAssign()">分配</button>
             <input type="button"   class="bg_ly collapse-all" onclick="javascript:closeBoxWindow()" value="取消"/> &nbsp;&nbsp;
          
            </td>
          </tr>
	</table> 
	
			</div>
       

</s:form>
</p>
</body>
</html>
