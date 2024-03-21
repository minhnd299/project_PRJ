<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Publisher</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Publisher</h1><hr>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form class="row g-3 needs-validation" action="publisher?action=create" method="post" >
                                    <div class="col-md-6">
                                        <label for="PublisherID" class="form-label">PublisherID</label>
                                        <input type="text" class="form-control " id="PublisherID" value="" name="PublisherID" required="">
                                        <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="PublisherName" class="form-label">PublisherName</label>
                                        <input type="text" class="form-control" id="PublisherName" value="" required name="PublisherName">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="PublisherAddress" class="form-label">PublisherAddress</label>
                                        <input type="text" class="form-control" id="PublisherAddress" value="" required name="PublisherAddress">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="PublisherEmail" class="form-label">PublisherEmail</label>
                                        <input type="email" class="form-control" id="PublisherEmail" value="" required name="PublisherEmail">
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-primary" type="submit">Add Publisher</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Publisher ID</th>
                                            <th class="text-center">Publisher Name</th>
                                            <th class="text-center">Publisher Address</th>
                                            <th class="text-center">Publisher Email</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listPublisher}" var="pu">
                                            <tr>
                                                <td class="text-center">${pu.getPublisherID()}</td>
                                                <td class="text-center">${pu.getPublisherName()}</td>
                                                <td class="text-center">${pu.getPublisherAddress()}</td>
                                                <td class="text-center">${pu.getPublisherEmail()}</td>

                                                <td class="text-center">
                                                    <div>
                                                        <a data-bs-toggle="modal" data-bs-target="#PublisherID${pu.getPublisherID()}" href=""><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                        <a href="#" onclick="deletePublisher('${pu.getPublisherID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- Modal profiles -->
                                        <div class="modal fade" id="PublisherID${pu.getPublisherID()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Edit Publisher</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="publisher?action=edit" method="POST">
                                                            <div class="form-floating mb-3">
                                                                <input name="PublisherID" class="form-control" id="PublisherID" type="text"
                                                                       placeholder="PublisherID" readonly="" value="${pu.getPublisherID()}"/>
                                                                <label for="PublisherID">PublisherID</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="PublisherName" class="form-control" id="PublisherName" type="text"
                                                                       placeholder="PublisherName" required value="${pu.getPublisherName()}"/>
                                                                <label for="PublisherName">PublisherName</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="PublisherAddress" class="form-control" id="PublisherAddress" type="text"
                                                                       placeholder="PublisherAddress" required value="${pu.getPublisherAddress()}"/>
                                                                <label for="PublisherAddress">PublisherAddress</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="PublisherEmail" class="form-control" id="PublisherEmail" type="email"
                                                                       placeholder="PublisherEmail" required value="${pu.getPublisherEmail()}"/>
                                                                <label for="PublisherEmail">PublisherEmail</label>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Save</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <script>
                    function deletePublisher(id) {
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
                                    window.location.href = 'publisher?action=delete&&PublisherID=' + id;
                                }, delayInMilliseconds);

                            }
                        })
                    }
                    document.getElementById('PublisherID').value = 'PL' + Date.now();
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
