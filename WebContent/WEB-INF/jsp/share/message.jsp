<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/jsp/share/taglib.jsp" %>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" href="/css/vip.css" type="text/css">
<script src="<%=path %>/js/jquery-1.8.3.js"></script>
<script src="<%=path %>/js/jquery-ui-1.9.2.custom.js"></script>

<script>

  $(function() {

    $( "#dialog-message" ).dialog({

      modal: true,

      buttons: {

        Ok: function() {

          $( this ).dialog( "close" );

        }

      }

    });

  });

  
  

  </script>


<body>



<div id="dialog-message" title="Download complete">

  <p>

    <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>

      ${message}

  </p>


</div>


</body>
</html>
