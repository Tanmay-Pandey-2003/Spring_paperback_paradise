<%-- <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@page import="java.util.List"%>
<%@page import="project.Main.Cart"%>
<%@page import="project.Main.User"%>
<%@page import="project.Main.CartDaoImpl"%>
<%@page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Details</title>
<%@ include file="allCss1.jsp"%>
</head>
<body>

	<%@ include file="navbar1.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg }">
		<div class="alert alert-warning text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failed }">
		<div class="alert alert-danger text-center" role="alert">${failed }</div>
		<c:remove var="failed" scope="session" />
	</c:if>
	<div class="container">

		<div class="row p-2">

			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">

						<h3 class="text-center text-success">Your selected Item</h3>

						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userObj");
								/* BookService bookService = new BookService(); */
								BookService bookService = WebApplicationContextUtils
			    				.getRequiredWebApplicationContext(application)
			    				.getBean(BookService.class);
								List<Cart> cart = bookService.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice += c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&cid=<%=c.getCid()%>&&uid=<%=c.getUserId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>

						<form action="order" method="post">
							<input type="hidden" value="${userObj.id }" name="id" />
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="username" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" readonly="readonly" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" readonly="readonly" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" name="phno" class="form-control"
										id="inputEmail4" value="<%=u.getPhno()%>" readonly="readonly" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" value="" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">city</label> <input type="text"
										name="city" class="form-control" id="inputPassword4" value="" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" value="" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">pincode</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4"
										value="" required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment" required>
									<option value="noselect">---select---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>

					</div>
				</div>

			</div>


		</div>
	</div>

</body>
</html> --%>

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List"%>
<%@ page import="project.Main.Cart"%>
<%@ page import="project.Main.User"%>
<%@ page import="project.Main.BookService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Details</title>
    <%@ include file="allCss1.jsp"%>
</head>
<body>

    <%@ include file="navbar1.jsp"%>
    
    <c:if test="${empty userObj}">
        <c:redirect url="/loginPage"></c:redirect>
    </c:if>
    
    <c:if test="${not empty succMsg}">
        <div class="alert alert-warning text-center" role="alert">${succMsg}</div>
        <c:remove var="succMsg" scope="session" />
    </c:if>
    
    <c:if test="${not empty failed}">
        <div class="alert alert-danger text-center" role="alert">${failed}</div>
        <c:remove var="failed" scope="session" />
    </c:if>
    
    <div class="container">
        <div class="row p-2">
            <div class="col-md-6">
                <div class="card bg-white">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your selected Items</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                User u = (User) session.getAttribute("userObj");
                                BookService bookService = WebApplicationContextUtils
                                        .getRequiredWebApplicationContext(application)
                                        .getBean(BookService.class);
                                List<Cart> cart = bookService.getBookByUser(u.getId());
                                Double totalPrice = 0.0;
                                for (Cart c : cart) {
                                    totalPrice += c.getPrice();
                                %>
                                <tr>
                                    <td><%= c.getBookName() %></td>
                                    <td><%= c.getAuthor() %></td>
                                    <td><%= c.getPrice() %></td>
                                    <td>
                                        <a href="<c:url value='/remove_book' />?bid=<%= c.getBid() %>&cid=<%= c.getCid() %>&uid=<%= c.getUserId() %>"
                                           class="btn btn-sm btn-danger">Remove</a>
                                    </td>
                                </tr>
                                <% } %>
                                <tr>
                                    <td colspan="2">Total</td>
                                    <td><%= totalPrice %></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center text-success">Your Details For Order</h3>
                        <form action="<c:url value='/order' />" method="post">
                            <input type="hidden" value="${userObj.id}" name="id" />
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Name</label>
                                    <input type="text" name="username" class="form-control"
                                           id="inputEmail4" value="<%= u.getName() %>" readonly="readonly" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Email</label>
                                    <input type="email" name="email" class="form-control"
                                           id="inputPassword4" value="<%= u.getEmail() %>" readonly="readonly" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Phone Number</label>
                                    <input type="number" name="phno" class="form-control"
                                           id="inputEmail4" value="<%= u.getPhno() %>" readonly="readonly" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Address</label>
                                    <input type="text" name="address" class="form-control"
                                           id="inputPassword4" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Landmark</label>
                                    <input type="text" name="landmark" class="form-control"
                                           id="inputEmail4" value="" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">City</label>
                                    <input type="text" name="city" class="form-control"
                                           id="inputPassword4" value="" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">State</label>
                                    <input type="text" name="state" class="form-control"
                                           id="inputEmail4" value="" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Pincode</label>
                                    <input type="text" name="pincode" class="form-control"
                                           id="inputPassword4" value="" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Payment Mode</label>
                                <select class="form-control" name="payment" required>
                                    <option value="noselect">--- Select ---</option>
                                    <option value="COD">Cash On Delivery</option>
                                </select>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-warning">Order Now</button>
                                <a href="<c:url value='/index'/>" class="btn btn-success">Continue Shopping</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
