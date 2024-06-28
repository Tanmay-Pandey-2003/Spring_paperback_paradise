<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="project.Main.BookOrderDaoImpl"%>
<%@page import="project.Main.User"%>
<%@page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Order</title>
<%@ include file="allCss1.jsp"%>
</head>
<body>
	<%@ include file="navbar1.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container p-1">
		<h3 class="text-center text-primary p-1">Your Orders</h3>
		<table class="table table-striped mt-3">
			<thead class="bg-danger text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userObj");
				/* BookService bookService = new BookService(); */
				BookService bookService = WebApplicationContextUtils
			    .getRequiredWebApplicationContext(application)
			    .getBean(BookService.class);
				List<Book_Order> blist = bookService.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>
</body>
</html> --%>

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="project.Main.Book_Order" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Main.BookService" %>
<%@ page import="project.Main.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Order</title>
<%@ include file="allCss1.jsp"%>
</head>
<body>
    <%@ include file="navbar1.jsp"%>
    <c:if test="${empty userObj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <div class="container p-1">
        <h3 class="text-center text-primary p-1">Your Orders</h3>
        <table class="table table-striped mt-3">
            <thead class="bg-danger text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                User u = (User) session.getAttribute("userObj");
                BookService bookService = WebApplicationContextUtils
                        .getRequiredWebApplicationContext(application)
                        .getBean(BookService.class);
                List<Book_Order> blist = bookService.getBook(u.getEmail());
                for (Book_Order b : blist) {
                %>
                <tr>
                    <th scope="row"><%=b.getOrderId()%></th>
                    <td><%=b.getUserName()%></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <div class="text-center mt-3">
            <a href="<c:url value='/index'/>" class="btn btn-primary">Home</a>
            <a href="<c:url value='/setting'/>" class="btn btn-danger">Settings Dashboard</a>
        </div>
    </div>
</body>
</html>
