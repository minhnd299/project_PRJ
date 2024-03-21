<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reader</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Create Reader</h1><hr>
                        <form class="row g-3 needs-validation" action="reader?action=create" method="post">
                            <div class="col-md-6">
                                <label for="ReaderID" class="form-label">Reader ID</label>
                                <input type="text" class="form-control " id="ReaderID" value="" name="ReaderID" required="" placeholder="Example: RD001">
                                <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderName" class="form-label">Reader Name</label>
                                <input type="text" class="form-control" id="ReaderName" value="" required name="ReaderName" placeholder="Enter Name">
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderAddress" class="form-label">Reader Address</label>
                                <input type="text" class="form-control" id="ReaderAddress" value="" required name="ReaderAddress" placeholder="Enter Address">
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderDOB" class="form-label">Reader DOB</label>
                                <input type="date" class="form-control" id="ReaderDOB" value="" required name="ReaderDOB">
                            </div>
                            <div class="col-md-12">
                                <label for="ReaderEmail" class="form-label">Reader Email</label>
                                <input type="email"  class="form-control" id="ReaderEmail" value="" required name="ReaderEmail" placeholder="Enter Email">
                            </div>

                            <input type="date"  class="form-control" id="BeginDate" value="" required name="BeginDate" hidden="">

                            

                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit">Add Reader</button>
                            </div>
                        </form>
                    </div>
                </main>
                <script>
                    document.getElementById('BeginDate').valueAsDate = new Date();
                    document.getElementById('ReaderID').value = 'RD' + Date.now();
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
