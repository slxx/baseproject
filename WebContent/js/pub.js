/*
 * 打开新窗口
 * f:链接地址
 * n:窗口的名称
 * w:窗口的宽度
 * h:窗口的高度
 * s:窗口是否有滚动条，1：有滚动条；0：没有滚动条
 */
function openWin(f,n,w,h,s){
	sb = s == "1" ? "1" : "0";
	l = (screen.width - w)/2;
	t = (screen.height - h)/2;
	sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w
			+ ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0";
	openwin = window.open(f , n , sFeatures );
	if (!openwin.opener)
		openwin.opener = self;
	openwin.focus();
	return openwin;
}

function toDel(path){
	var temp=document.getElementsByName("checkId");
	for (i=0;i<temp.length;i++){ 
	  //遍历Radio 
	    if(temp[i].checked){     	
	    	 break;
	    }
	} 
	if(i==temp.length){
		alert("没有选择信息！");
		return false;
	}
	if(confirm("确认删除？")){
		var form = document.forms[0];
		form.action=path;
	 	form.method="post";
	 	form.submit();
	}
}	
function todel(path){
	if(confirm("确认删除？")){
		var form = document.forms[0];
		form.action=path;
	 	form.method="post";
	 	form.submit();
	}
}	

function topage(path,page){
	 if(parseInt(page)<=0 ){
		alert("页数超出范围!");
	}else{
		window.location.href=path+"?page="+page;
	}
}
	
	function selAll(){ 
		var o=document.getElementsByName("checkId"); 
		for(i=0;i<o.length;i++) {
			if(!o[i].disabled){
			    o[i].checked=event.srcElement.checked; 
			}
		}
	}
	
	//验证邮件
	function verifyEmailAddress(strEmail){
	  var myReg = /^[_a-zA-Z0-9_-_._-]+@([_a-zA-Z0-9_-]+\.)+[a-zA-Z]{2,3}$/;
	  return myReg.test(strEmail);
	}
	
	
	//校验普通电话、传真号码：可以“+”开头，除数字外，可含有“-”
    function isTel(object)
     {
     //国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"

      var s =document.getElementById(object.id).value; 
      var pattern =/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
      //var pattern =/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/; 
         if(s!="")
          {
              if(!pattern.exec(s))
              {
               alert('请输入正确的电话号码:电话号码格式为国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"');
               object.value="";
               object.focus();
              }
          }
     }
    
    
  //校验日期
    function isdate(object)
     {
      var s =document.getElementById(object.id).value; 
      var pattern =/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/;
          if(s!="")
          {
              if(!pattern.exec(s))
              {
               alert('请输入正确的日期');
               object.value="";
               object.focus();
              }
          }         
     }
    
    
  //校验(国内)邮政编码
    function isPostalCode(object)
     {
      var s =document.getElementById(object.id).value; 
      var pattern =/^[0-9]{6}$/;
          if(s!="")
          {
              if(!pattern.exec(s))
              {
               alert('请输入正确的邮政编码');
               object.value="";
               object.focus();
              }
          }
     }
    
    /*****************************************************************
    ****                 数字输入控制处理     (LHM)              *****
    *****************************************************************/
    function InputIntNumberCheck(){
    	//为支持IE 或 Netscape
    	var theEvent=window.event || arguments.callee.caller.arguments[0]; 
    	var elm ;
    	var ver = navigator.appVersion;
    	if (ver.indexOf("MSIE") != -1){  // IE
    		if ( !((theEvent.keyCode >=48)&&(theEvent.keyCode<=57))){
    			theEvent.keyCode=0;
    		}
    	}else{ // Netscape
    		if ( !((theEvent.which >=48)&&(theEvent.which<=57))){
    			theEvent.stopPropagation();
    			theEvent.preventDefault();
    		}
    	}
    	//
    }
    
    /**
    * 检查输入是否中文
    */
    function ck_chinese(value_) {
      return escape(value_).indexOf("%u")!=-1 
    }
