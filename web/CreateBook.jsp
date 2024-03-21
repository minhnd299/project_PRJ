<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Create Book</h1><hr>
                        <form class="row g-3 needs-validation" action="book?action=create" method="post">
                            <div class="col-md-6">
                                <label for="BookID" class="form-label">Book ID</label>
                                <input type="text" class="form-control " id="BookID" value="" name="BookID" required="">
                                <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                            </div>
                            <div class="col-md-6">
                                <label for="BookName" class="form-label">Book Name</label>
                                <input type="text" class="form-control" id="BookName" value="" required name="BookName">
                            </div>
                            <div class="col-md-6">
                                <label for="AuthorID" class="form-label">Author</label>
                                <select class="form-select" id="AuthorID" required name="AuthorID">
                                    <option selected disabled value="">Choose...</option>
                                    <c:forEach items="${listAuthor}" var="at">
                                        <option value="${at.getAuthorID()}">${at.getAuthorName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="CategoryID" class="form-label">Category</label>
                                <select class="form-select" id="CategoryID" required name="CategoryID" >
                                    <option selected disabled value="">Choose...</option>
                                    <c:forEach items="${listCategory}" var="ct">
                                        <option value="${ct.getCategoryID()}">${ct.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="PublisherID" class="form-label">Publisher</label>
                                <select class="form-select" id="PublisherID" required name="PublisherID">
                                    <option selected disabled value="" >Choose...</option>
                                    <c:forEach items="${listPublisher}" var="pu">
                                        <option value="${pu.getPublisherID()}">${pu.getPublisherName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="PublishYear" class="form-label">Publish Year</label>
                                <input type="text" class="form-control" id="PublishYear" value="" required name="PublishYear">
                            </div>
                            <div class="col-md-6">
                                <label for="Quantity" class="form-label">Quantity</label>
                                <input type="number" class="form-control" id="Quantity" value="" required name="Quantity">
                            </div>
                            <div class="col-md-6">
                                <label for="Price" class="form-label">Price</label>
                                <input type="number" step="any" class="form-control" id="Price" value="" required name="Price">
                            </div>

                            <div class="col-md-6">
                                <button class="btn btn-primary" type="submit">Add Book</button>
                            </div>
                        </form>
                    </div>
                </main>
                <script type="text/javascript">
                    $('#AuthorID').select2();
                    $('#CategoryID').select2();
                    $('#PublisherID').select2();
                    document.getElementById('BookID').value ='BO' + Date.now();
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
