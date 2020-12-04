<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>电子图书查询</title>

	</head>

	<body>
		<form method="post" name="search" action="search">
			图书标题：
			<input id="name" class="input-text" type="text" name="name"
				value="${name}" />
			价格：从
			<input id="lowprice" class="input-text" type="text" name="lowprice" />
			到
			<input id="highprice" class="input-text" type="text" name="highprice" />
			<input class="input-btn" type="submit" name="submit" value="查询" />
			<div id="suggest"></div>
		</form>
	</body>
</html>
