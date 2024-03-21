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
                        <h1 class="mt-4">Book</h1>               
                        <hr>

                        <div class="card mb-4">
                            <div class="card-header mb-4">
                                <a href="book?action=create" type="button" class="btn btn-outline-success">
                                    <i class="fa-solid fa-plus me-2"></i>Add Book
                                </a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Book ID</th>
                                            <th class="text-center">Book Name</th>
                                            <th class="text-center">Author</th>
                                            <th class="text-center">Publish Year</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listBook}" var="bo">
                                            <tr>
                                                <td class="text-center">${bo.getBookID()}</td>
                                                <td class="text-center">${bo.getBookName()}</td>
                                                <c:forEach items="${listAuthor}" var="at">
                                                    <c:if test="${at.getAuthorID() == bo.getAuthorID()}">
                                                        <td class="text-center">${at.getAuthorName()}</td>
                                                    </c:if>
                                                </c:forEach>

                                                <td class="text-center">${bo.getPublishYear()}</td>
                                                <td class="text-center">${bo.getQuantity() > 0 ? "Available":"Unavailable"}</td>
                                                <td class="text-center">
                                                    <a href="book?action=edit&&BookID=${bo.getBookID()}"><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                    <a href="#" onclick="deleteBook('${bo.getBookID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
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
                    function deleteBook(id) {
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
                                    window.location.href = 'book?action=delete&&BookID=' + id;
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
