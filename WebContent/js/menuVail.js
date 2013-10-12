function checkForm(){
var menuName=document.all("menu.menuName");
var targetPath=document.all("menu.targetPath");
var iconPath=document.all("menu.iconPath");
var menuPopedomCode=document.all("menu.menuPopedomCode");
if(menuName.value==""){
		alert("菜单名称不能为空!");
		return false;
	}
if(targetPath.value==""){
	alert("目标路径不能为空!");
	return false;
}
if(iconPath.value==""){
	alert("图标路径不能为空!");
	return false;
}
if(menuPopedomCode.value==""){
	alert("菜单权限码不能为空!");
	return false;
}

return true;
}

