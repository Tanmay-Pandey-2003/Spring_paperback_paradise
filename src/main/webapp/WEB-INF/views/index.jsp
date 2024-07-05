<%-- <%@page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.User"%>
<%@page import="project.Main.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="project.Main.BookService"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paperback-Paradise</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/style.css">

<%@ include file="allCss1.jsp"%>

<style type="text/css">
.back-img {
	background: url("${pageContext.request.contextPath}/resources/img/b.jpeg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.card {
	background-color: #7bf274;
}

.crd-ho:hover {
	background-color: #99ff87;
}
</style>
</head>
<body>
	
	<%@ include file="navbar1.jsp"%>

	<div class="container-fluid back-img">
		<h2 class="text-danger">Online Book Store</h2>
	</div>
	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<!-- NEW BOOK -->

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">

			<%
			/* BookService bookService = new BookService(); */
			BookService bookService = WebApplicationContextUtils
			    .getRequiredWebApplicationContext(application)
			    .getBean(BookService.class);
			List<BookDetails> list = bookService.getNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<hr>

	<!-- OLD BOOK -->

	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">

			<%
			/* BookService bookService1 = new BookService(); */
			BookService bookService1 = WebApplicationContextUtils
				    .getRequiredWebApplicationContext(application)
				    .getBean(BookService.class);
			List<BookDetails> list2 = bookService1.getOldBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<hr>
	<%@ include file="footer.jsp"%>

</body>
</html>--%>

<%@page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.User"%>
<%@page import="project.Main.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paperback-Paradise</title>


<%@ include file="allCss1.jsp"%>

<style type="text/css">
.back-img {
    background: url("${pageContext.request.contextPath}/resources/img/b.jpeg");
    height: 50vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}

.card {
    background-color: #7bf274;
}

.crd-ho:hover {
    background-color: #99ff87;
}
</style>
</head>
<body>
    
    <%@ include file="navbar1.jsp"%>

    <div class="container-fluid back-img">
        <h2 class="text-danger">Online Book Store</h2>
    </div>
    <%
    User u = (User) session.getAttribute("userObj");
    %>
    <!-- NEW BOOK -->

    <div class="container">
        <h3 class="text-center">New Books</h3>
        <div class="row">

            <%
            BookService bookService = WebApplicationContextUtils
                .getRequiredWebApplicationContext(application)
                .getBean(BookService.class);
            List<BookDetails> list = bookService.getNewBooks();
            for (BookDetails b : list) {
            %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="<c:url value='/book'/><%=b.getPhotoName()%>"
                            style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                     	<p><%=b.getBookCategory()%></p>
                        <div class="row">
                            <%
                            if (u == null) {
                            %>
                            <a href="<c:url value='/login'/>" class="btn btn-danger btn-sm ml-2"><i
                                class="fa-solid fa-cart-shopping"></i> Add</a>
                            <%
                            } else {
                            %>
                            <a href="<c:url value='/cart'/>?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
                                class="btn btn-danger btn-sm ml-2"><i
                                class="fa-solid fa-cart-shopping"></i> Add</a>
                            <%
                            }
                            %>
                            <a href="<c:url value='/viewBookDetails' />?bid=<%=b.getBookId()%>"
                                class="btn btn-success btn-sm ml-1">View Details</a> 
                            <a href="#" class="btn btn-danger btn-sm ml-1"><i
                                class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>

        <div class="text-center mt-1">
            <a href="<c:url value='/all_new_book'/>" class="btn btn-danger btn-sm text-white">View
                All</a>
        </div>

    </div>
    <hr>

    <!-- OLD BOOK -->

    <div class="container">
        <h3 class="text-center">Old Books</h3>
        <div class="row">

            <%
            BookService bookService1 = WebApplicationContextUtils
                .getRequiredWebApplicationContext(application)
                .getBean(BookService.class);
            List<BookDetails> list2 = bookService1.getOldBooks();
            for (BookDetails b : list2) {
            %>
            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="<c:url value='/book'/><%=b.getPhotoName()%>"
                            style="width: 150px; height: 200px" class="img-thumblin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                       <p><%=b.getBookCategory()%></p>
                        <div class="row">
                            <%
                            if (u == null) {
                            %>
                            <a href="<c:url value='/login'/>" class="btn btn-danger btn-sm ml-2"><i
                                class="fa-solid fa-cart-shopping"></i> Add</a>
                            <%
                            } else {
                            %>
                            <a href="<c:url value='/cart'/>?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"                              class="btn btn-danger btn-sm ml-2"><i
                                class="fa-solid fa-cart-shopping"></i> Add</a>
                            <%
                            }
                            %>
                            <a href="<c:url value='/viewBookDetails'/>?bid=<%=b.getBookId()%>"
                                class="btn btn-success btn-sm ml-1">View Details</a> 
                            <a href="#" class="btn btn-danger btn-sm ml-1"><i
                                class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>

        <div class="text-center mt-1">
            <a href="<c:url value='/all_old_book'/>" class="btn btn-danger btn-sm text-white">View
                All</a>
        </div>

    </div>
    <hr>
    <%@ include file="footer.jsp"%>

</body>
</html>
