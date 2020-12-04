<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="elements/index_head.jsp"></jsp:include>

<script type="text/javascript" src="js/ajax.js"></script>


<script type="text/javascript">
	//全部输入项非空检查
	function isUserNameEmpty(){
		var userName = document.getElementById("userName").value;
		var spanUserName = document.getElementById("spanUserName");
		
		//spanUserName.innerHTML = "";
		
		//判断是否为空
		if(userName == null || userName == ""){
			spanUserName.innerHTML = "<font color=\"red\">用户名不能为空！</font>"
			return false;
		}
		return true;
	}
	//检查用户名是否为空和是否存在
	function isUserNameValid(){
		if(!isUserNameEmpty()){
			return false;
		}
		
		//使用Ajax检查用户是否存在		
		isUserExsit();
		//return true;
	}
	//检查密码内容位数
	function isPasswordValid(){
		var password = document.getElementById("password").value;
		var spanPassword = document.getElementById("spanPassword");
		
		spanPassword.innerHTML = ""
		
		if(password == null || password == ""){
			spanPassword.innerHTML = "<font color=\"red\">密码不能为空！</font>"
			return false;
		}else if(password.length < 8){
			spanPassword.innerHTML = "<font color=\"red\">密码长度小于8位！！</font>"
			document.getElementById("password").focus();
			document.getElementById("password").select();
			return false;
		}
		return true;
	}
	//检查密码是否一致
	function isConfirmPasswordValid(){
		var confirmPassword = document.getElementById("confirmPassword").value;
		var password = document.getElementById("password").value;
		var spanConfirmPassword = document.getElementById("spanConfirmPassword");
		
		spanConfirmPassword.innerHTML = ""
		
		if(confirmPassword == null || confirmPassword == ""){
			spanConfirmPassword.innerHTML = "<font color=\"red\">确认密码不能为空！</font>"
			return false;
		}
		if(confirmPassword != password){
			spanConfirmPassword.innerHTML = "<font color=\"red\">两次密码输入不一致！</font>"
			document.getElementById("confirmPassword").focus();
			document.getElementById("confirmPassword").select();
			return false;
		}
		
		return true;
	}
	//检查邮箱格式是否正确
	function isEmailValid(){
		var email = document.getElementById("email").value;
		var spanEmail = document.getElementById("spanEmail");
		
		spanEmail.innerHTML = ""
		
		var regEx = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z_-]+)+$/;
		
		if(email == null || email == ""){
			spanEmail.innerHTML = "<font color=\"red\">邮箱不能为空！</font>"
			return false;
		}else if(!regEx.test(email)){
			spanEmail.innerHTML = "<font color=\"red\">邮箱格式不正确！</font>"
			document.getElementById("email").focus();
			document.getElementById("email").select();
			return false;
		}
		
		return true;
	}
	
	function check(){
		//验证用户名是否为空
		var spanUserName = document.getElementById("spanUserName");
		if(!isUserNameEmpty()){
			return false;
		}
		
		//验证用户名是否存在
		//isUserExist();
		if(spanUserName.innerHTML!="<font color=\"blue\">可以注册，赶快注册吧！</font>"){
			return false;
		}
		
		if(!isPasswordValid()){
			return false;
		}
		
		if(!isConfirmPasswordValid()){
			return false;
		}
		
		if(!isEmailValid()){
			return false;
		}
		
		return true;		
	}
	 
	//Ajax查看用户是否已经被注册
	function isUserExsit(){
		var userName = document.getElementById("userName").value;
		var url = "isexistsuser?action=check&userName="+userName;
		//alert(url);
		doAjax(url);
	}
	
	//ajax异步处理方法
	function processRequest() {
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			var spanUserName = document.getElementById("spanUserName");
			var flag = xmlHttp.responseText.trim();
			//alert(flag);
			if(flag == "true"){
				document.getElementById("spanUserName").innerHTML = "<font color=\"red\">当前用户名已被注册！</font>";
				document.getElementById("userName").focus();
				document.getElementById("userName").select();
				//return false;	
			} else {
				document.getElementById("spanUserName").innerHTML = "<font color=\"blue\">可以注册，赶快注册吧！</font>";
				//return true;
			}
		}
	}
</script>

<body>
<div id="header" class="wrap">
	<div id="logo">18同城网上书城</div>
	<div id="navbar">
	</div>
</div>
<div id="register">
	<div class="title">
		<h2>欢迎注册18同城网上书城</h2>
	</div>
	<div class="steps">
		<ul class="clearfix">
			<li class="current">1.填写注册信息</li>
			<li class="unpass">2.注册成功</li>
		</ul>
	</div>
	<form method="post" action="register" onsubmit="return check();"  >
		<dl>
			<dt>用 户 名：</dt>
			<dd>
				<input class="input-text" type="text" id="userName" name="userName" value="${user.userName}" onblur="return isUserNameValid();"/>
				<span id="spanUserName"></span>
			</dd>
			<dt>密　　码：</dt>
			<dd>
				<input class="input-text" type="password" id="password" name="password" value="${user.password}" onblur="return isPasswordValid();" />
				<span id="spanPassword"><font color=\"green\">密码至少8位</font></span>
			</dd>
			<dt>确认密码：</dt>
			<dd>
				<input class="input-text" type="password" id="confirmPassword" name="confirmPassword" value="${user.password}" onblur="return isConfirmPasswordValid();" />
				<span id="spanConfirmPassword"></span>
			</dd>
			<dt>Email地址：</dt>
			<dd>
				<input class="input-text" type="text" id="email" name="email" value="${user.email}" onblur="return isEmailValid();" />
				<span id="spanEmail"><font color=\"green\">请输入正确格式的邮箱</font></span>
			</dd>
			<dt></dt>
			<dd class="button">
				<input class="input-reg" type="submit" name="register" value="" />
				<span style="color: red;">${message}</span>
			</dd>
		</dl>
	</form>
</div>	
<jsp:include page="elements/index_bottom.html"></jsp:include>
