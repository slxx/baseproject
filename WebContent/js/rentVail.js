function checkForm(){
var userName=document.all("user.userName");
var passWord=document.all("user.passWord");
var account=document.all("user.account");
var rentName=document.all("rent.rentName");
var connecter=document.all("rent.connecter");

if(userName.value==""){
		alert("用户名不能为空!");
		return false;
	}
if(passWord.value==""){
	alert("密码不能为空!");
	return false;
}
if(account.value==""){
	alert("帐号不能为空!");
	return false;
}
if(rentName.value==""){
	alert("租户名称不能为空!");
	return false;
}
if(connecter.value==""){
	alert("联系人不能为空!");
	return false;
}

return true;
}
