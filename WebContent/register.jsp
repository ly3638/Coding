<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="elements/index_head.jsp"></jsp:include>

<script type="text/javascript" src="js/ajax.js"></script>


<script type="text/javascript">
	//ȫ��������ǿռ��
	function isUserNameEmpty(){
		var userName = document.getElementById("userName").value;
		var spanUserName = document.getElementById("spanUserName");
		
		//spanUserName.innerHTML = "";
		
		//�ж��Ƿ�Ϊ��
		if(userName == null || userName == ""){
			spanUserName.innerHTML = "<font color=\"red\">�û�������Ϊ�գ�</font>"
			return false;
		}
		return true;
	}
	//����û����Ƿ�Ϊ�պ��Ƿ����
	function isUserNameValid(){
		if(!isUserNameEmpty()){
			return false;
		}
		
		//ʹ��Ajax����û��Ƿ����		
		isUserExsit();
		//return true;
	}
	//�����������λ��
	function isPasswordValid(){
		var password = document.getElementById("password").value;
		var spanPassword = document.getElementById("spanPassword");
		
		spanPassword.innerHTML = ""
		
		if(password == null || password == ""){
			spanPassword.innerHTML = "<font color=\"red\">���벻��Ϊ�գ�</font>"
			return false;
		}else if(password.length < 8){
			spanPassword.innerHTML = "<font color=\"red\">���볤��С��8λ����</font>"
			document.getElementById("password").focus();
			document.getElementById("password").select();
			return false;
		}
		return true;
	}
	//��������Ƿ�һ��
	function isConfirmPasswordValid(){
		var confirmPassword = document.getElementById("confirmPassword").value;
		var password = document.getElementById("password").value;
		var spanConfirmPassword = document.getElementById("spanConfirmPassword");
		
		spanConfirmPassword.innerHTML = ""
		
		if(confirmPassword == null || confirmPassword == ""){
			spanConfirmPassword.innerHTML = "<font color=\"red\">ȷ�����벻��Ϊ�գ�</font>"
			return false;
		}
		if(confirmPassword != password){
			spanConfirmPassword.innerHTML = "<font color=\"red\">�����������벻һ�£�</font>"
			document.getElementById("confirmPassword").focus();
			document.getElementById("confirmPassword").select();
			return false;
		}
		
		return true;
	}
	//��������ʽ�Ƿ���ȷ
	function isEmailValid(){
		var email = document.getElementById("email").value;
		var spanEmail = document.getElementById("spanEmail");
		
		spanEmail.innerHTML = ""
		
		var regEx = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z_-]+)+$/;
		
		if(email == null || email == ""){
			spanEmail.innerHTML = "<font color=\"red\">���䲻��Ϊ�գ�</font>"
			return false;
		}else if(!regEx.test(email)){
			spanEmail.innerHTML = "<font color=\"red\">�����ʽ����ȷ��</font>"
			document.getElementById("email").focus();
			document.getElementById("email").select();
			return false;
		}
		
		return true;
	}
	
	function check(){
		//��֤�û����Ƿ�Ϊ��
		var spanUserName = document.getElementById("spanUserName");
		if(!isUserNameEmpty()){
			return false;
		}
		
		//��֤�û����Ƿ����
		//isUserExist();
		if(spanUserName.innerHTML!="<font color=\"blue\">����ע�ᣬ�Ͽ�ע��ɣ�</font>"){
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
	 
	//Ajax�鿴�û��Ƿ��Ѿ���ע��
	function isUserExsit(){
		var userName = document.getElementById("userName").value;
		var url = "isexistsuser?action=check&userName="+userName;
		//alert(url);
		doAjax(url);
	}
	
	//ajax�첽������
	function processRequest() {
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			var spanUserName = document.getElementById("spanUserName");
			var flag = xmlHttp.responseText.trim();
			//alert(flag);
			if(flag == "true"){
				document.getElementById("spanUserName").innerHTML = "<font color=\"red\">��ǰ�û����ѱ�ע�ᣡ</font>";
				document.getElementById("userName").focus();
				document.getElementById("userName").select();
				//return false;	
			} else {
				document.getElementById("spanUserName").innerHTML = "<font color=\"blue\">����ע�ᣬ�Ͽ�ע��ɣ�</font>";
				//return true;
			}
		}
	}
</script>

<body>
<div id="header" class="wrap">
	<div id="logo">18ͬ���������</div>
	<div id="navbar">
	</div>
</div>
<div id="register">
	<div class="title">
		<h2>��ӭע��18ͬ���������</h2>
	</div>
	<div class="steps">
		<ul class="clearfix">
			<li class="current">1.��дע����Ϣ</li>
			<li class="unpass">2.ע��ɹ�</li>
		</ul>
	</div>
	<form method="post" action="register" onsubmit="return check();"  >
		<dl>
			<dt>�� �� ����</dt>
			<dd>
				<input class="input-text" type="text" id="userName" name="userName" value="${user.userName}" onblur="return isUserNameValid();"/>
				<span id="spanUserName"></span>
			</dd>
			<dt>�ܡ����룺</dt>
			<dd>
				<input class="input-text" type="password" id="password" name="password" value="${user.password}" onblur="return isPasswordValid();" />
				<span id="spanPassword"><font color=\"green\">��������8λ</font></span>
			</dd>
			<dt>ȷ�����룺</dt>
			<dd>
				<input class="input-text" type="password" id="confirmPassword" name="confirmPassword" value="${user.password}" onblur="return isConfirmPasswordValid();" />
				<span id="spanConfirmPassword"></span>
			</dd>
			<dt>Email��ַ��</dt>
			<dd>
				<input class="input-text" type="text" id="email" name="email" value="${user.email}" onblur="return isEmailValid();" />
				<span id="spanEmail"><font color=\"green\">��������ȷ��ʽ������</font></span>
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
