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
                        <h1 class="mt-4">Edit Invoice</h1><hr>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="col-md-12">
                                    <form class="row g-3 mb-4" action="add-to-cart" method="post">
                                        <div class="col-md-1">
                                            <b>BOOK NAME</b>
                                        </div>
                                        <div class="col-md-4">
                                            <select class="form-select" id="BookID" value="" name="BookID" required="">
                                                <option selected disabled value="">Choose...</option>
                                                <c:forEach items="${listBook}" var="bo">
                                                    <option value="${bo.getBookID()}">${bo.getBookName()}</option>
                                                </c:forEach>
                                            </select>

                                        </div>
                                        <div class="col-md-4">
                                            <button class="btn btn-success" type="submit">ADD BOOK</button>
                                            <a href="add-to-cart?action=clear" class="btn btn-danger" >CLEAR BOOK</a>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-12">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr style="background-color: #FFCE73">
                                                <th class="text-center">Book ID</th>
                                                <th class="text-center">Book Name</th>
                                                <th class="text-center"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.carts}" var="ca">
                                                <tr>
                                                    <td class="text-center">${ca.value.book.getBookID()}</td>
                                                    <td class="text-center">${ca.value.book.getBookName()}</td>

                                                    <td class="text-center">
                                                        <a href="#" onclick="deleteCart('${ca.value.book.getBookID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="col-md-12">
                                            <form class="row g-3 needs-validation" action="invoice?action=edit" method="post" >
                                                <div class="col-md-4">
                                                    <label for="InvoiceID" class="form-label">InvoiceID</label>
                                                    <input type="text" class="form-control " id="InvoiceID" value="${invoice.getInvoiceID()}" name="InvoiceID" readonly="">
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="ReaderID" class="form-label">ReaderID</label>
                                                    <select class="form-select" id="ReaderID" required name="ReaderID">
                                                        <option selected disabled value="">Choose...</option>
                                                        <c:forEach items="${listReader}" var="rd">
                                                            <option ${invoice.getReaderID() == rd.getReaderID() ? "selected":""} value="${rd.getReaderID()}">${rd.getReaderID()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="BorrowDate" class="form-label">Borrow Date</label>
                                                    <input type="date" class="form-control" id="BorrowDate" value="${invoice.getBorrowDate()}" name="BorrowDate">
                                                </div>


                                                <div class="col-md-6">
                                                    <button class="btn btn-primary" type="submit">Save Invoice</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function deleteCart(id) {
                        Swal.fire({
                            title: 'Are you sure?',
                            text: "You won't be able to revert this!",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Yes, delete it!'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = 'add-to-cart?action=delete-cart&&BookID=' + id;
                            }
                        })
                    }
                    $('#ReaderID').select2();
                    $('#BookID').select2();

                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
