function checkForm(){
var personName=document.all("person.personName");
var birthday=document.all("person.birthday");
var rentId=document.all("person.rentId");
var address=document.all("person.address");
if(personName.value==""){
		alert("人员姓名不能为空!");
		return false;
	}
if(birthday.value==""){
	alert("出生日期不能为空!");
	return false;
}
if(rentId.value==""){
	alert("所属租户不能为空!");
	return false;
}
if(address.value==""){
	alert("居住地址不能为空!");
	return false;
}

return true;
}
