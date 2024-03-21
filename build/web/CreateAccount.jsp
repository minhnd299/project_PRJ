<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Account</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Create Account</h1><hr>
                        <form class="row g-3 needs-validation" action="account?action=create" method="post">
                            <div class="col-md-6">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control " id="username" value="" name="username" required="">
                                <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                            </div>
                            <div class="col-md-6">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" value="" required name="password">
                            </div>
                            <div class="col-md-6">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" value="" required name="name">
                            </div>
                            <div class="col-md-6">
                                <label for="role" class="form-label">Role</label>
                                <select class="form-select" id="role" required name="role">
                                    <option selected disabled value="">Choose...</option>
                                    <option value="0">User</option>
                                    <option value="1">Administrators</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid state.
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="dob" class="form-label">Date of birth</label>
                                <input type="date" class="form-control" id="dob" value="" required name="dob">
                            </div>
                            <div class="col-md-6">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" value="" required name="address">
                            </div>
                            <div class="col-md-6">
                                <label for="phonenumber" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="phonenumber" value="" required name="phonenumber">
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" value="" required name="email">
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit">Add Account</button>
                            </div>
                        </form>
                    </div>
                </main>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
