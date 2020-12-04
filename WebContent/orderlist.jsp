<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>



<jsp:include page="elements/main_head.html"/>

<body>
<jsp:include page="elements/main_menu.jsp"/>
<script type="text/javascript" >
	//相同的行具有相同的列值，进行合并:合并订单号、收货人、订单时间、总金额
	function unite(id, num,amount){
		var td_id = document.getElementById("id_" + id);
		var td_user = document.getElementById("user_" + id);
		var td_crdt = document.getElementById("crdt_" + id);
		var td_total = document.getElementById("total_" + id);
		td_id.rowSpan = num;
		td_user.rowSpan = num;
		td_crdt.rowSpan = num;
		td_total.rowSpan = num;
		td_total.innerHTML=amount;
	}
</script>
<div id="content" class="wrap">
	<div class="list orderList">
			<table>
				<tr class="title">
					<th class="orderId">订单编号</th>					
					<th class="userName">收货人</th>					
					<th class="createTime">下单时间</th>
					<th class="status">总价</th>
					<th>订单商品</th>
					<th>商品名称</th>
					<th>商品单价</th>
					<th class="price">商品数量</th>
				</tr>
				<c:set var="oid_count" value="0" />
				<c:set var="td_id" value="0" />	
				<c:set var="amount" value="0" />
				<c:forEach var="order" items="${orders }">
				<tr>
					<c:if test="${oid_temp != order.order.id}">
						<c:set var="td_id" value="${td_id+1}" />
						<td id="id_${td_id}">${order.order.id}</td>
						<td id="user_${td_id}">${order.order.userInfo.userName }</td>						
						<td id="crdt_${td_id}">${order.createDate }</td>
						<td id="total_${td_id}">${order.amount }</td>
						<c:if test="${oid_count > 1}">
							<script type="text/javascript" >	
								unite(${td_id-1}, ${oid_count}, ${amount });
							</script>
						</c:if>
						<c:set var="oid_count" value="0" />
						<c:set var="amount" value="0" />
					</c:if>
					<td class="thumb"><img src="images/book/${order.book.image }" /></td>					
					<td>${order.book.name }</td>
					<td>${order.book.price }</td>
					<td>${order.count}</td>
					<c:set var="oid_count" value="${oid_count+1 }" />
					<c:set var="amount" value="${amount+order.amount }" />
					<c:set var="oid_temp" value="${order.order.id }"></c:set>
				</tr>
				</c:forEach>
				<c:if test="${td_id > 0}">
					<script type="text/javascript" >
						unite(${td_id }, ${oid_count }, ${amount });
					</script>
				</c:if>
			</table>
	</div>
</div>
</body>
<jsp:include page="elements/main_bottom.html"/>
