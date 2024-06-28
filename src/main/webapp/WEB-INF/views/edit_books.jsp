<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="project.Main.BookDetails"%>
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
<title>Admin : Edit Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
					
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						/* BookService bookService = new BookService(); */
						BookService bookService = WebApplicationContextUtils
							    .getRequiredWebApplicationContext(application)
							    .getBean(BookService.class);
						BookDetails bd = bookService.getBookById(id);
						%>
						<form method="post" action="../edit_books">
							<input type="hidden" name="id" value="<%=bd.getBookId() %>" />
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname"
									value="<%=bd.getBookName() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author"
									value="<%=bd.getAuthor() %>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price"
									value="<%=bd.getPrice() %>">
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<% 
                                     if ("Active".equals(bd.getStatus())) {
                                     %>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<% } else {%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<% } %>

								</select>
							</div>

							<button type="submit" class="btn btn-primary text-center">update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html> --%>

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="project.Main.BookDetails"%>
<%@ page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin : Edit Books</title>
    <%@ include file="allCss.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Edit Books</h4>
                    
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        BookService bookService = WebApplicationContextUtils
                                .getRequiredWebApplicationContext(application)
                                .getBean(BookService.class);
                        BookDetails bd = bookService.getBookById(id);
                        %>
                        <form method="post" action="<c:url value='/edit_books' />">
                            <input type="hidden" name="id" value="<%= bd.getBookId() %>" />
                            <div class="form-group">
                                <label for="bname">Book Name</label>
                                <input type="text" class="form-control" id="bname" name="bname"
                                       required="required" value="<%= bd.getBookName() %>">
                            </div>
                            <div class="form-group">
                                <label for="author">Author Name</label>
                                <input type="text" class="form-control" id="author" name="author"
                                       required="required" value="<%= bd.getAuthor() %>">
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" id="price" name="price"
                                       required="required" value="<%= bd.getPrice() %>">
                            </div>
                            <div class="form-group">
                                <label for="status">Book Status</label>
                                <select id="status" name="status" class="form-control">
                                    <option value="Active" <%= bd.getStatus().equals("Active") ? "selected" : "" %>>Active</option>
                                    <option value="Inactive" <%= bd.getStatus().equals("Inactive") ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary text-center">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
