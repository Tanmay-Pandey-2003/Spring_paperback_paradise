<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="project.Main.BookOrderDaoImpl"%>
<%@page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : All Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<table class="table table-striped ">
		<thead class="bg-danger text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph no</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
			/* BookService bookService = new BookService(); */
			BookService bookService = WebApplicationContextUtils
				    .getRequiredWebApplicationContext(application)
				    .getBean(BookService.class);
			List<Book_Order> blist = bookService.getAllOrderedBook();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>
</body>
</html> --%>

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="project.Main.Book_Order" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : All Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <c:if test="${empty userObj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <table class="table table-striped ">
        <thead class="bg-danger text-white">
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Ph no</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
            <%
            BookService bookService = WebApplicationContextUtils
                    .getRequiredWebApplicationContext(application)
                    .getBean(BookService.class);
            List<Book_Order> blist = bookService.getAllOrderedBook();
            for (Book_Order b : blist) {
            %>
            <tr>
                <th scope="row"><%=b.getOrderId()%></th>
                <td><%=b.getUserName()%></td>
                <td><%=b.getBookName()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getEmail()%></td>
                <td><%=b.getFulladd()%></td>
                <td><%=b.getPhno()%></td>
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
        <a href="<c:url value='/home'/>" class="btn btn-danger">Admin Dashboard</a>
    </div>
</body>
</html>
