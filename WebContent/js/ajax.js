var xmlHttp;
		
//创建XMLHttpRequest
function createXmlHttpRequest(){
	try {
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e) {
			try {
				xmlHttp = new XMLHttpRequest();
				if (xmlHttp.overrideMimeType) {
					xmlHttp.overrideMimeType("text/xml");
				}
			} catch (e) {
			}
		}
	}
}

//处理函数
function doAjax(url){
	//1.创建XMLHttpRequest请求
	createXmlHttpRequest();
//	
//	var username = document.loginForm.username.value;
//	var password = document.loginForm.password.value;
//	
	if(xmlHttp!=null){
		//var url ="chap12/AjaxLoginServlet?username="+username+"&password="+password;
		
		//2.打开与服务器的连接处理
		xmlHttp.open("get",url,false);
		//因为是POST方式提交，需要设置请求头部信息
		//xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");
		
		//3.设置回调函数
		xmlHttp.onreadystatechange=processRequest;
		
		//4.发送请求
		xmlHttp.send(null);
	}else{
		alert("不能创建XMLHttpRequest对象实例")
	}
}

//去除文本左右两端的空格
String.prototype.trim=function(){
	var m=this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
	return (m==null)?"":m[1];
}

