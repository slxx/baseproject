<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>修改</title>
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
	<script type="text/javascript" src="<%=path %>/js/pub.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function clickAddMenu(pid) 
{ 
	  $("#parentMenuId").val(pid) ; 
	 //$("#divAdd").css("display","block"); 
	  $("#divAdd").toggle();
   
} 

	function add(){
	  var parentMenuId=$("#parentMenuId").val();
	  alert(parentMenuId);
	  var form=document.forms[0];
		   form.action="<%=path%>/menu_addMenu.action?parentMenuId="+parentMenuId;
		  form.submit();
		return true;
	}
 
  </SCRIPT>
 
<!--左导航-->
</head>

<body>


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
        <h5>管理菜单</h5>
      </div>
      <div class="widget-content">
         
          <div class="tree_l">
            <menu id="nestable-menu">
              <button type="button" data-action="expand-all" class="bg_lb expand-all">展开菜单</button>
              <button type="button" data-action="collapse-all" class="bg_ly collapse-all">关闭菜单</button>
            </menu>
            <div class="cf nestable-lists">
              <div class="dd" id="nestable3">
                <ol class="dd-list">
                
                <c:forEach items="${pageView.records}" var="entry">
                  <li class="dd-item dd3-item" data-id="1">
                    <div class="dd-handle dd3-handle"></div>
                    <div class="dd3-content" onclick="clickAddMenu('${entry.menuId }')"> ${entry.menuName }</div>
                    <ol class="dd-list">
                    
                    <c:forEach items="${entry.childMenu}" var="childMenu">
                      <li class="dd-item dd3-item" data-id="2">
                        <div class="dd-handle dd3-handle"></div>
                        <div class="dd3-content" ><a href="#">${childMenu.menuName }</a></div>
                      </li>
                      </c:forEach>
                    </ol>
                  </li>
                  </c:forEach>
                 
                </ol>
              </div>
            </div>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> 
            <script src="<%=path %>/js/jquery.nestable.js"></script> 
            <script>

           



$(document).ready(function()
{
	

    var updateOutput = function(e)
    {
        var list   = e.length ? e : $(e.target),
            output = list.data('output');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            output.val('JSON browser support required for this demo.');
        }
    }; 
    // output initial serialised data  
    $('#nestable-menu').on('click', function(e)
    {
        var target = $(e.target),
            action = target.data('action');
        if (action === 'expand-all') {
            $('.dd').nestable('expandAll');
        }
        if (action === 'collapse-all') {
            $('.dd').nestable('collapseAll');
        }
    });
    $('#nestable3').nestable();
    
    
   
});
</script> 
          </div>
          <s:form action="menu_addMenu.action" method="post">
           <input type="hidden" name="parentMenuId" id="parentMenuId"/>
           <s:hidden name="menu.isValid" value="true"/>
          <div id="divAdd" class="tree_r" style="display:none">
            <menu id="nestable-menu">
              <button type="button" class="bg_lb expand-all" onclick="javascript:add();">新增</button>
              <button type="button" class="bg_ly collapse-all">取消</button>
            </menu>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
						<td class="td_r">菜单名称:</td>
							<td class="td_l"><s:textfield name="menu.menuName" cssClass="txt" />
						<tr>
						<td class="td_r">提示信息:</td>
							<td class="td_l"><s:textfield name="menu.tipInfo" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">目标路径:</td>
							<td class="td_l"><s:textfield name="menu.targetPath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">图标路径:</td>
							<td class="td_l"><s:textfield name="menu.iconPath" cssClass="txt"  /></td>
						</tr>
						<tr>
						<td class="td_r">图片路径:</td>
							<td class="td_l"><s:textfield name="menu.imagePath" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单权限码:</td>
							<td class="td_l"><s:textfield name="menu.menuPopedomCode" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单索引:</td>
							<td class="td_l"><s:textfield name="menu.menuIndex" cssClass="txt" /></td>
						</tr>
						<tr>
						<td class="td_r">菜单类别:</td>
							<td class="td_l"><s:radio name="menu.menuType"
									list='#{ 0:"系统菜单",1:"普通菜单"}' value="1" /></td>
						</tr>
						
						<%-- <tr>
						<td class="td_r">菜单拥有类型:</td>
							<td class="td_l"><checkbox name="menu.menuOwerType"
									list='#{ 0:"系统管理员",1:"租户",2"普通用户"}'/></td>
						</tr> --%>
						
						
						<tr>
						<td class="td_r">菜单拥有类型:</td>
							<td class="td_l">
							<input type="checkbox" name="menu.menuOwerType" value="0">系统管理员
							<input type="checkbox" name="menu.menuOwerType" value="1">租户
							<input type="checkbox" name="menu.menuOwerType" value="2">普通用户
						</tr>
						<tr>
						<td class="td_r">菜单备注:</td>
							<td class="td_l"><s:textarea name="menu.menuRemark" cssClass="txt_area" /></td>
						</tr>
					</table>
          </div>
          </s:form>
        </form>
      </div>
    </div>
  </div>
</div>

<!--end-main-container-part--> 

<!--Footer-part-->
<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Shenlu Admin.</div>
</div>


 
<!--end-Footer-part-->
</body>
</html>

