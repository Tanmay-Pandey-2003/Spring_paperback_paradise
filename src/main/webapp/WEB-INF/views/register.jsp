<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Paperback Paradise : Register</title>
    <%@ include file="allCss1.jsp"%>
</head>
<body>
    <%@ include file="navbar1.jsp"%>

    <div class="container pd-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Registration Page</h4>
                        <c:if test="${not empty successMsg }">
                            <p class="text-center text-success">${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty failMsg }">
                            <p class="text-center text-danger">${failMsg}</p>
                            <c:remove var="failMsg" scope="session" />
                        </c:if>
                        <form method="post" action="register">
                            <div class="form-group">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName"
                                       placeholder="Name" required="required" name="fname" minlength="2" maxlength="20">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Email address</label>
                                <input type="email" class="form-control" id="inputEmail"
                                       placeholder="Enter email" required="required" name="email" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="inputMobile">Mobile No.</label>
                                <input type="tel" class="form-control" id="inputMobile"
                                       placeholder="Enter mobile no" required="required" name="phno" minlength="10" maxlength="15">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword">Password</label>
                                <input type="password" class="form-control" id="inputPassword"
                                       placeholder="Password" required="required" name="password" minlength="6" maxlength="20">
                            </div>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="checkTerms" name="check" required="required">
                                <label class="form-check-label" for="checkTerms">I agree to the terms and conditions</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>
 --%>

 
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Paperback Paradise : Register</title>
    <%@ include file="allCss1.jsp"%>
</head>
<body>
    <%@ include file="navbar1.jsp"%>

    <div class="container pd-4">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Registration Page</h4>
                        <c:if test="${not empty successMsg }">
                            <p class="text-center text-success">${successMsg}</p>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty failMsg }">
                            <p class="text-center text-danger">${failMsg}</p>
                            <c:remove var="failMsg" scope="session" />
                        </c:if>
                        <form method="post" action="<c:url value='/register'/>">
                            <div class="form-group">
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control" id="inputName"
                                       placeholder="Name" required="required" name="fname" minlength="2" maxlength="20">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">Email address</label>
                                <input type="email" class="form-control" id="inputEmail"
                                       placeholder="Enter email" required="required" name="email" maxlength="50">
                            </div>
                            <div class="form-group">
                                <label for="inputMobile">Mobile No.</label>
                                <input type="tel" class="form-control" id="inputMobile"
                                       placeholder="Enter mobile no" required="required" name="phno" minlength="10" maxlength="15">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword">Password</label>
                                <input type="password" class="form-control" id="inputPassword"
                                       placeholder="Password" required="required" name="password" minlength="6" maxlength="20">
                            </div>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="checkTerms" name="check" required="required">
                                <label class="form-check-label" for="checkTerms">I agree to the terms and conditions</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp"%>
</body>
</html>


