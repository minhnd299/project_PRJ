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
                        <h1 class="mt-4">Invoice</h1>               
                        <hr>

                        <div class="card mb-4">
                            <div class="card-header mb-4">
                                <a href="invoice?action=create" type="button" class="btn btn-outline-success">
                                    <i class="fa-solid fa-plus me-2"></i>Add Invoice
                                </a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Invoice ID</th>
                                            <th class="text-center">Reader Name</th>
                                            <th class="text-center">Borrow Date</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listInvoiceUnPaid}" var="iup">
                                            <tr>
                                                <td class="text-center">${iup.getInvoiceID()}</td>

                                                <c:forEach items="${listReader}" var="rd">
                                                    <c:if test="${rd.getReaderID() == iup.getReaderID()}">
                                                        <td class="text-center">${rd.getReaderName()}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td class="text-center">${iup.getBorrowDate()}</td>
                                                <td class="text-center">
                                                    <a href="invoice?action=view&&InvoiceID=${iup.getInvoiceID()}"><i class="fa-solid fa-eye fa-lg text-primary me-2 ms-2" title="View"></i></a>
                                                    <a href="invoice?action=edit&&InvoiceID=${iup.getInvoiceID()}"><i class="fa-solid fa-pen-to-square text-warning fa-lg me-2 ms-2" title="Edit"></i></a>
                                                    <a href="#" onclick="deleteInvoice('${iup.getInvoiceID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function deleteInvoice(id) {
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
                                Swal.fire(
                                        'Deleted!',
                                        'Your file has been deleted.',
                                        'success'
                                        )
                                var delayInMilliseconds = 1000; //1 second

                                setTimeout(function () {
                                    window.location.href = 'invoice?action=delete&&InvoiceID=' + id;
                                }, delayInMilliseconds);

                            }
                        })
                    }
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
