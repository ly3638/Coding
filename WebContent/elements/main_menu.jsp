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
			//��ȡ�����
			var divSuggest=document.getElementById("suggest");
			divSuggest.innerHTML="";
			
			//��ȡAJAX������Ӧ��ķ���ֵ
			var str=xmlHttp.responseText.trim().split("-");
			var suggest="";
			
			//�жϴ���
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
			//alert("���������");
			//alert(xmlHttp.status);
		}
	}
	
	//��ѡ�е�������ӵ��ı���
	function setSearch(select){
		document.getElementById("txtSearch").value=select;
		//��������
		document.getElementById("suggest").style.display="none";
	}
	
	//�������
	function suggestOver(obj){
		obj.className="suggest_link_over";
	}
	
	//����Ƴ�
	function suggestOut(obj){
		obj.className="suggest_link";
	}
</script>
	
<div id="header" class="wrap">
	<div id="logo">
		18ͬ���������
	</div>
	<div id="navbar">
		<div class="userMenu">
			<ul>
				<li class="current">
					<font color="BLACK">��ӭ����<strong>${loginUser.userName}</strong>
					</font>&nbsp;&nbsp;&nbsp;
				</li>
				<li>
					<a href="booklist">��ҳ</a>
				</li>
				<li>
					<a href="orderlist">�ҵĶ���</a>
				</li>
				<li>
					<a href="shopping.jsp">���ﳵ</a>
				</li>
				<li>
					<a href="logout">ע��</a>
				</li>
			</ul>
		</div>
		<form method="post" name="search" action="search">
			ͼ����⣺<input id="name" class="input-text" type="text" name="name" value="${name}"  />
			�۸񣺴�<input id="lowprice" class="input-text" type="text" name="lowprice" value="${lowprice==0?'':lowprice}"  />
			��<input id="highprice" class="input-text" type="text" name="highprice" value="${highprice==0?'':highprice}"  />
			<input class="input-btn" type="submit" name="submit" value="" />
			<div id="suggest"></div>
		</form>
		<!-- <form method="post" name="search" action="search">
			������
			<input id="txtSearch" class="input-text" type="text" name="keyWords" value="${keyWords }" 
				onkeyup="searchSuggest();" autocomplete="off" />
			<input class="input-btn" type="submit" name="submit" value="" />
			<div id="suggest"></div>
		</form>
		 -->
	</div>
</div>