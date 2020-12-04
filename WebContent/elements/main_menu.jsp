<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>

<script type="text/javascript">
	function searchSuggest(){
		var searchValue = document.getElementById("txtSearch").value;
		var url="search?keyWords="+searchValue+"&auto=auto";
		doAjax(url);
	}
	
	
	function processRequest(){
		//alert(xmlHttp.status);
		if(xmlHttp.readyState==4 && xmlHttp.status==200){
			//获取层对象
			var divSuggest=document.getElementById("suggest");
			divSuggest.innerHTML="";
			
			//获取AJAX处理响应后的返回值
			var str=xmlHttp.responseText.trim().split("-");
			var suggest="";
			
			//判断处理
			if(str.length>0 && str[0].length>0){
				for(i=0;i<str.length;i++){
					suggest+="<div onmouseover='javascript:suggestOver(this);' ";
					suggest+="onmouseout='javascript:suggestOut(this);' ";
					suggest+="onclick='javascript:setSearch(this.innerHTML);' ";
					suggest+="class='suggest_link'>"+str[i]+"</div>";
				}
				divSuggest.innerHTML=suggest;
				document.getElementById("suggest").style.display="block";
			}else{
				document.getElementById("suggest").style.display="none";
			}
		}else{
			//alert("请求处理错误");
			//alert(xmlHttp.status);
		}
	}
	
	//将选中的内容添加到文本框
	function setSearch(select){
		document.getElementById("txtSearch").value=select;
		//隐藏内容
		document.getElementById("suggest").style.display="none";
	}
	
	//鼠标移上
	function suggestOver(obj){
		obj.className="suggest_link_over";
	}
	
	//鼠标移出
	function suggestOut(obj){
		obj.className="suggest_link";
	}
</script>
	
<div id="header" class="wrap">
	<div id="logo">
		18同城网上书城
	</div>
	<div id="navbar">
		<div class="userMenu">
			<ul>
				<li class="current">
					<font color="BLACK">欢迎您，<strong>${loginUser.userName}</strong>
					</font>&nbsp;&nbsp;&nbsp;
				</li>
				<li>
					<a href="booklist">首页</a>
				</li>
				<li>
					<a href="orderlist">我的订单</a>
				</li>
				<li>
					<a href="shopping.jsp">购物车</a>
				</li>
				<li>
					<a href="logout">注销</a>
				</li>
			</ul>
		</div>
		<form method="post" name="search" action="search">
			图书标题：<input id="name" class="input-text" type="text" name="name" value="${name}"  />
			价格：从<input id="lowprice" class="input-text" type="text" name="lowprice" value="${lowprice==0?'':lowprice}"  />
			到<input id="highprice" class="input-text" type="text" name="highprice" value="${highprice==0?'':highprice}"  />
			<input class="input-btn" type="submit" name="submit" value="" />
			<div id="suggest"></div>
		</form>
		<!-- <form method="post" name="search" action="search">
			搜索：
			<input id="txtSearch" class="input-text" type="text" name="keyWords" value="${keyWords }" 
				onkeyup="searchSuggest();" autocomplete="off" />
			<input class="input-btn" type="submit" name="submit" value="" />
			<div id="suggest"></div>
		</form>
		 -->
	</div>
</div>