<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<jsp:include page="elements/index_head.jsp"></jsp:include>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">
	//输入有效性检查用户名
	function checkUserName() {
		var userName = document.getElementById("userName").value;
		var spanUserName = document.getElementById("spanUserName");
	
		if (userName == null || userName == "") {
			spanUserName.innerHTML = "<font color=\"red\">用户名不能为空!</font>"
			return false;
		} else {
			spanUserName.innerHTML = "";
		}
		return true;
	}
	
	//检查密码
	function checkPassword() {
		var password = document.getElementById("password").value;
		var spanPassword = document.getElementById("spanPassword");
	
		if (password == null || password == "") {
			spanPassword.innerHTML = "<font color=\"red\">密码不能为空!</font>"
			return false;
		} else {
			spanPassword.innerHTML = "";
		}
	
		return true;
	}
	
	//ajax登录验证
	function checkLogin() {
		if (!checkUserName()) {
			return false;
		} else if (!checkPassword()) {
			return false;
		}
	
		//调用ajax验证登录
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		
		var url = "login?userName=" + userName + "&password=" + password;
		//alert(url);
		doAjax(url);
	
		//return true;
	}

	//ajax异步处理方法
	function processRequest() {
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			//获取消息对象
			var spanUserName = document.getElementById("spanUserName");
			var spanPassword = document.getElementById("spanPassword");
			var userName = document.getElementById("userName");
			var password = document.getElementById("password");
		
			//获取AJAX处理响应后的返回值
			var flag=xmlHttp.responseText.trim();
			//alert(flag);
			spanUserName.innerHTML="";
			spanPassword.innerHTML="";
			
			//判断处理
			if(flag=="1"){//登录成功
				window.location.href="main.jsp";
			} else if(flag=="-1"){
				spanUserName.innerHTML="用户名错误!";
				userName.focus();
				userName.select();
			} else {
				spanPassword.innerHTML="密码错误!";
				password.focus();
				password.select();
			}
		}
	}
</script>

<body>
	<div id="header" class="wrap">
		<div id="logo">
			18同城网上书城
		</div>
		<div id="navbar">
		</div>
	</div>
	<div id="login">
		<h2>
			用户登录
		</h2>
		<form id="loginForm" name="loginForm" method="post" action="login">
			<dl>
				<dt>
					用户名：
				</dt>
				<dd>
					<input class="input-text" type="text" id="userName" name="userName"
						onblur="checkUserName();" />
					<span id="spanUserName"></span>
				</dd>
				<dt>
					密&nbsp;&nbsp;码：
				</dt>
				<dd>
					<input class="input-text" type="password" id="password"
						name="password" onBlur="checkPassword();" />
					<span id="spanPassword"></span>
				</dd>
				<dt>
					&nbsp;
				</dt>
				<dd class="button">
					<input class="input-btn" type="button" name="submit" value=""  onclick="return checkLogin();" />
					<input class="input-reg" type="button" name="register" value=""
						onclick="window.location='register.jsp';" />
				</dd>
			</dl>
		</form>
	</div>

	<jsp:include page="elements/index_bottom.html"></jsp:include>