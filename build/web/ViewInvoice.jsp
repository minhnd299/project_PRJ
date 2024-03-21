<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Invoice</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">View Invoice</h1><hr>
                        <div class="card mb-4">
                            <div class="card-body">
                                <h2 class="text-center mb-4">Invoice information</h2>
                                <div class="row g-3 mb-4 text-center">
                                    <div class="col-md-4">
                                        <b>InvoiceID: </b>${InvoiceUnPaid.getInvoiceID()}
                                    </div>

                                    <div class="col-md-4">
                                        <c:forEach items="${listReader}" var="rd">
                                            <c:if test="${rd.getReaderID() == InvoiceUnPaid.getReaderID()}">
                                                <b>Reader Name: </b>${rd.getReaderName()}
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                    <div class="col-md-4">
                                        <b>Borrow Date: </b>${InvoiceUnPaid.getBorrowDate()}
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr style="background-color: #FFCE73">
                                                <th class="text-center">Book Name</th>
                                                <th class="text-center">Category</th>
                                                <th class="text-center">Author</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listInvoiceDetailsUnPaid}" var="idu">
                                                <tr>
                                                    <c:forEach items="${listBook}" var="bo">
                                                        <c:if test="${bo.getBookID() == idu.getBookID()}">
                                                            <td class="text-center">${idu.getBookID()}</td>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:forEach items="${listBook}" var="bo">
                                                        <c:if test="${bo.getBookID() == idu.getBookID()}">
                                                            <c:forEach items="${listCategory}" var="ct">
                                                                <c:if test="${ct.getCategoryID() == bo.getCategoryID()}">
                                                                    <td class="text-center">${ct.getCategoryName()}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>

                                                    <c:forEach items="${listBook}" var="bo">
                                                        <c:if test="${bo.getBookID() == idu.getBookID()}">
                                                            <c:forEach items="${listAuthor}" var="at">
                                                                <c:if test="${at.getAuthorID() == bo.getAuthorID()}">
                                                                    <td class="text-center">${at.getAuthorName()}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12 d-flex justify-content-end">
                                    <a href="#" onclick="returnBook('${InvoiceUnPaid.getInvoiceID()}')" class="btn btn-success"><i class="fa-solid fa-rotate-left"></i> RETURN BOOK</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function returnBook(id) {
                        Swal.fire({
                            title: 'Return book?',
                            text: "Check the full quantity before returning the book!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, return book'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'invoice?action=return-book&&InvoiceID=' + id;
                            }
                        })
                    }
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
