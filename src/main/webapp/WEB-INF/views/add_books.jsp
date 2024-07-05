<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
		<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty failMsg }">
							<p class="text-center text-danger">${failMsg }</p>
							<c:remove var="failMsg" scope="session" />
						</c:if>
						<form method="post" action="../add_books"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>---select---</option>
									<option selected>New Book</option>

								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail">Upload Photo</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" required="required" name="bimg">
							</div>
							
							<!-- <div class="form-group">
								<label for="exampleInputEmail">Email</label> <input
									type="email" class="form-control"
									id="exampleInputEmail1" required="required" name="bimg">
							</div> -->
							
							<button type="submit" class="btn btn-primary text-center">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    
    <c:if test="${empty userObj }">
        Redirect to login page if user is not logged in
        <c:redirect url="login.jsp"/>
    </c:if>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Add Books</h4>
                        <c:if test="${not empty succMsg }">
                            <p class="text-center text-success">${succMsg }</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty failMsg }">
                            <p class="text-center text-danger">${failMsg }</p>
                            <c:remove var="failMsg" scope="session" />
                        </c:if>
                        <form method="post" action="<c:url value='/add_books'/>"
                            enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="bname">Book Name</label>
                                <input type="text" class="form-control" id="bname" name="bname" required>
                            </div>
                            <div class="form-group">
                                <label for="author">Author Name</label>
                                <input type="text" class="form-control" id="author" name="author" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="form-group">
                                <label for="categories">Book Categories</label>
                                <select id="categories" name="categories" class="form-control">
                                	<option selected>---select---</option>
                                    <option selected>New Book</option>
                                   
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="status">Book Status</label>
                                <select id="status" name="status" class="form-control">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="bimg">Upload Photo</label>
                                <input type="file" class="form-control-file" id="bimg" name="bimg" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
