<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
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
<title>All New Book</title>
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
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addCart" scope="session" />
	</c:if>
	<!-- NEW BOOK -->
	<%
	User u = (User) session.getAttribute("userObj");
	%>
	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row p-3">

			<%
		/* 	BookService bookService = new BookService(); */
		BookService bookService = WebApplicationContextUtils
			    .getRequiredWebApplicationContext(application)
			    .getBean(BookService.class);
			List<BookDetails> list = bookService.getAllNewBooks();
			for (BookDetails b : list) {
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

							<a href="<c:url value='/loginPage' />" class="btn btn-danger btn-sm ml-2"><i
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

							<a href="<c:url value='/viewBookDetails' />?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View
								Details</a> 
							<a href="" class="btn btn-danger btn-sm"><i
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
</html>

<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="project.Main.User"%>
<%@ page import="project.Main.BookDetails"%>
<%@ page import="java.util.List"%>
<%@ page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All New Books</title>
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

    <c:if test="${not empty addCart }">
        <div id="toast">${addCart}</div>

        <script type="text/javascript">
            showToast();
            function showToast(content) {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000)
            }
        </script>

        <c:remove var="addCart" scope="session" />
    </c:if>

    <!-- NEW BOOK -->
    <div class="container">
        <h3 class="text-center">New Books</h3>
        <div class="row p-3">
            <c:forEach var="b" items="${newBooks}">
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="book/${b.photoName}"
                                 style="width: 150px; height: 200px" class="img-thumblin">
                            <p>${b.bookName}</p>
                            <p>${b.author}</p>
                            <p>${b.bookCategory}</p>
                            <div class="row">
                                <c:choose>
                                    <c:when test="${empty sessionScope.userObj}">
                                        <a href="<c:url value='/login' />" class="btn btn-danger btn-sm ml-2">
                                            <i class="fa-solid fa-cart-shopping"></i> Add
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<c:url value='/cart' />?bid=${b.bookId}&uid=${sessionScope.userObj.id}"
                                           class="btn btn-danger btn-sm ml-2">
                                            <i class="fa-solid fa-cart-shopping"></i> Add
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="<c:url value='/viewBookDetails' />?id=${b.bookId}" class="btn btn-success btn-sm ml-1">
                                    View Details
                                </a>
                                <a href="#" class="btn btn-danger btn-sm">
                                    <i class="fa-solid fa-indian-rupee-sign"></i> ${b.price}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
 --%>