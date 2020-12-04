<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<jsp:include page="elements/main_head.html"/>
 
<body>
<jsp:include page="elements/main_menu.jsp"/> 

<div id="content" class="wrap">
	<div class="list bookList">
		<form method="post" name="shoping" action="cartlist">
			<table>
				<tr class="title">
					<th class="checker"><input type="checkbox" name="all" onchange="checkall(this)" /></th>
					<th>书名</th>
					<th class="price">价格</th>
					<th class="store">库存</th>
					<th class="view">图片预览</th>
				</tr>
				<c:forEach var="book" items="${books}">
					<tr>
						<td><input type="checkbox" name="id" value="${book.id }" /></td>
						<td class="title">${book.name }</td>
						<input type="hidden" name="title" value = "${book.id }:${book.name }"/>
						<td>￥${book.price }</td>
						<input type="hidden" name="price" value = "${book.id }:${book.price }"/>
						<td>${book.stock}</td>
						<input type="hidden" name="stock" value = "${book.id }:${book.stock }"/>
						<td class="thumb"><img src="images/book/${book.image }" alt="${book.name }" /></td>
						<input type="hidden" name="image" value = "${book.id }:${book.image }"/>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${not empty requestScope.pb }">
			<div class="page-spliter">
				<a href="search?pageIndex=1&name=${name }&lowprice=${lowprice }&highprice=${highprice }">首页</a>
					<c:forEach var="i" begin="1" end="${requestScope.pb.pageCount }" step="1">
						<c:if test="${i==requestScope.pb.pageIndex }">
							<span class="current">${i }</span>
						</c:if>
						<c:if test="${not (i==requestScope.pb.pageIndex) }">
							<a href="search?pageIndex=${i }&name=${name }&lowprice=${lowprice }&highprice=${highprice }">${i }</a>
						</c:if>
					</c:forEach>
				<a href="search?pageIndex=${requestScope.pb.pageCount }&name=${name }&lowprice=${lowprice }&highprice=${highprice }">尾页</a>
			</div>
			</c:if>
			<!--添加到购物车按钮 -->
			<div class="button"><input class="input-btn" type="submit" name="submit" value="" /></div>
		</form>
	</div>
</div>
</body>
<jsp:include page="elements/main_bottom.html"/>