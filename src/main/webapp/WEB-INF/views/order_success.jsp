<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>order:success</title>
<%@ include file="allCss1.jsp"%>
</head>
<body>

	<%@ include file="navbar1.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Order Successfull</h2>
		<h5>within 7 days your order will be deliverd in your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success</title>
<%@ include file="allCss1.jsp"%>
</head>
<body>

    <%@ include file="navbar1.jsp"%>
    <div class="container text-center mt-3">
        <i class="fas fa-check-circle fa-5x text-success"></i>
        <h1>Thank You</h1>
        <h2>Order Successful</h2>
        <h5>Your order will be delivered to your address within 7 days.</h5>
        <a href="<c:url value='/index'/>" class="btn btn-primary mt-3">Home</a>
        <a href="<c:url value='/my-orders'/>" class="btn btn-danger mt-3">View Order</a>
    </div>
</body>
</html>
