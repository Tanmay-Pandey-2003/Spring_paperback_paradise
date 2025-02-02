<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.User"%>
<%@page import="project.Main.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="project.Main.BookDaoImpl"%>
<%@page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Book Jsp</title>
<%@ include file="allCss1.jsp"%>
<style type="text/css">
.card {
	background-color: #7bf274;
}

.crd-ho:hover {
	background-color: #99ff87;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body>
	<%@ include file="navbar1.jsp"%>

	<!-- SEARCH BOOK -->

	<div class="container">
		<div class="row p-3">
			<%
			User u = (User) session.getAttribute("userObj");
			String  ch = request.getParameter("ch");
			/* BookService bookService = new BookService(); */
			BookService bookService = WebApplicationContextUtils
			    .getRequiredWebApplicationContext(application)
			    .getBean(BookService.class);
			List<BookDetails> list2 = bookService.getBooksBySearch(ch);
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
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
	</div>
</body>
</html> --%>

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="project.Main.BookDetails" %>
<%@ page import="project.Main.User" %>
<%@ page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Search Book</title>
    <%@ include file="allCss1.jsp"%>
    <style type="text/css">
        .card {
            background-color: #7bf274;
        }

        .crd-ho:hover {
            background-color: #99ff87;
        }
        /* toast */
        #toast {
            min-width: 300px;
            position: fixed;
            bottom: 30px;
            left: 50%;
            margin-left: -125px;
            background: #333;
            padding: 10px;
            color: white;
            text-align: center;
            z-index: 1;
            font-size: 18px;
            visibility: hidden;
            box-shadow: 0px 0px 100px #000;
        }

        #toast.display {
            visibility: visible;
            animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
        }

        @keyframes fadeIn {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        /* toast */
    </style>
</head>
<body>
    <%@ include file="navbar1.jsp"%>

    <!-- SEARCH BOOK -->

    <div class="container">
        <div class="row p-3">
            <%-- Retrieving User and Search Query --%>
            <% User u = (User) session.getAttribute("userObj"); %>
            <% String ch = request.getParameter("ch"); %>

            <%-- Accessing Spring-managed BookService bean --%>
            <% BookService bookService = WebApplicationContextUtils.getRequiredWebApplicationContext(application)
                    .getBean(BookService.class); %>

            <%-- Fetching Book Details based on search query --%>
            <% List<BookDetails> bookList = new ArrayList<>(); %>
            <% if (ch != null && !ch.isEmpty()) {
                   bookList = bookService.getBooksBySearch(ch);
               } %>

            <%-- Displaying the retrieved book details --%>
            <% for (BookDetails book : bookList) { %>
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="book/<%= book.getPhotoName() %>" style="width: 150px; height: 200px" class="img-thumblin">
                            <p><%= book.getBookName() %></p>
                            <p><%= book.getAuthor() %></p>
                            <p><%= book.getBookCategory() %></p>
                            <div class="row">
                                <% if (u == null) { %>
                                    <a href="<c:url value='/login' />" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add</a>
                                <% } else { %>
                                    <a href="cart?bid=<%= book.getBookId() %>&uid=<%= u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add</a>
                                <% } %>
                                <a href="<c:url value='/viewBookDetails' />?bid=<%= book.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="#" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= book.getPrice() %></a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
