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
                        <h1 class="mt-4">Edit Reader</h1><hr>
                        <form class="row g-3 needs-validation" action="reader?action=edit" method="post">
                            <div class="col-md-6">
                                <label for="ReaderID" class="form-label">Reader ID</label>
                                <input type="text" class="form-control " id="ReaderID" value="${readerEdit.getReaderID()}" name="ReaderID" required="" readonly="" placeholder="Example: RD001">
                                <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderName" class="form-label">Reader Name</label>
                                <input type="text" class="form-control" id="ReaderName" value="${readerEdit.getReaderName()}" required name="ReaderName" placeholder="Enter Name">
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderAddress" class="form-label">Reader Address</label>
                                <input type="text" class="form-control" id="ReaderAddress" value="${readerEdit.getReaderAddress()}" required name="ReaderAddress" placeholder="Enter Address">
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderDOB" class="form-label">Reader DOB</label>
                                <input type="date" class="form-control" id="ReaderDOB" value="${readerEdit.getReaderDOB()}" required name="ReaderDOB">
                            </div>
                            <div class="col-md-6">
                                <label for="ReaderEmail" class="form-label">Reader Email</label>
                                <input type="email"  class="form-control" id="ReaderEmail" value="${readerEdit.getReaderEmail()}" required name="ReaderEmail" placeholder="Enter Email">
                            </div>
                            <div class="col-md-6">
                                <label for="BeginDate" class="form-label">Begin Date</label>
                                <input type="date"  class="form-control" id="BeginDate" value="${readerEdit.getBeginDate()}" required name="BeginDate">
                            </div>
                            

                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit">Save</button>
                            </div>
                        </form>
                    </div>
                </main>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
