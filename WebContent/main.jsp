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
	<link rel="stylesheet" href="<%=path %>/css/index.css" />
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.tree.js"></script>


  </head>

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
        <li class="bg_lb"> <a href="#"> <i class="icon-plus-sign"></i>添加</a> </li>
        <li class="bg_lg"> <a href="#"> <i class="icon-remove-sign"></i>删除</a> </li>
        <li class="bg_ly"> <a href="edit.html"> <i class="icon-edit-sign"></i>修改</a> </li>
      </ul>
      <div style="clear:both; float:none;"></div>
    </div>
    <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
          <h5>用户数据列表</h5>
        </div>
        <div class="widget-content nopadding">
            <table class="table_data">
              <thead>
                <!--<tr>
                  <th style="width:30px;"><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th style="width: 123.2px;" class="ui-state-default"><div class="">用户编号</div></th>
                  <th style="width: 107.2px;" class="ui-state-default"><div class="">用户名</div></th>
                  <th style="width: 374.2px;" class="ui-state-default"><div class="">帐号</div></th>
                  <th style="width: 348.2px;" class="ui-state-default"><div class="">所属租户</div></th>
                  <th style="width: 123.2px;" class="ui-state-default"><div class="">用户属性</div></th>
                </tr>-->
                <tr>
                  <th><div class="checker"><span><input type="checkbox"></span></div></th>
                  <th class="ui-state-default"><div class="">用户编号</div></th>
                  <th class="ui-state-default"><div class="">用户名</div></th>
                  <th class="ui-state-default"><div class="">帐号</div></th>
                  <th class="ui-state-default"><div class="">所属租户</div></th>
                  <th class="ui-state-default"><div class="">用户属性</div></th>
                  <th class="ui-state-default"><div class="">操作</div></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="width:20px;"><div class="checker"><span><input type="checkbox"></span></div></td>
                  <td>1</td>
                  <td>Trident</td>
                  <td>Internet</td>
                  <td>Win 95+</td>
                  <td>4</td>
                  <td style="width:50px;"><a href="#" class="icon-edit" title="修改"></a><a href="#" class="icon-remove" title="删除"></a></td>
                </tr>
                <tr>
                  <td style="width:20px;"><div class="checker"><span><input type="checkbox"></span></div></td>
                  <td>2</td>
                  <td>Trident</td>
                  <td>Internet Explorer 5.0</td>
                  <td>Win 95+</td>
                  <td>5</td>
                  <td style="width:50px;"><a href="#" class="icon-edit" title="修改"></a><a href="#" class="icon-remove" title="删除"></a></td>
                </tr>
               
              </tbody>
            </table>
        </div>
      </div>
     </div>
</div>

<!--end-main-container-part--> 

</html>
