<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Author</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Author</h1><hr>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form class="row g-3 needs-validation" action="author?action=create" method="post" >
                                    <div class="col-md-4">
                                        <label for="authorid" class="form-label">AuthorID</label>
                                        <input type="text" class="form-control " id="authorid" value="" name="authorid" required="">
                                        <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="authorname" class="form-label">AuthorName</label>
                                        <input type="text" class="form-control" id="authorname" value="" required name="authorname">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="note" class="form-label">Note</label>
                                        <input type="text" class="form-control" id="note" value="" name="note">
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-primary" type="submit">Add Author</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Author ID</th>
                                            <th class="text-center">Author Name</th>
                                            <th class="text-center">Note</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listAuthor}" var="au">
                                            <tr>
                                                <td class="text-center">${au.getAuthorID()}</td>
                                                <td class="text-center">${au.getAuthorName()}</td>
                                                <td class="text-center">${au.getNote()}</td>

                                                <td class="text-center">
                                                    <a data-bs-toggle="modal" data-bs-target="#AuthorID${au.getAuthorID()}" href=""><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                    <a href="#" onclick="deleteAuthor('${au.getAuthorID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                </td>
                                            </tr>
                                            <!-- Modal profiles -->
                                        <div class="modal fade" id="AuthorID${au.getAuthorID()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Edit Author</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="author?action=edit" method="POST">
                                                            <div class="form-floating mb-3">
                                                                <input name="authorid" class="form-control" id="AuthorID" type="text"
                                                                       placeholder="AuthorID" readonly="" value="${au.getAuthorID()}"/>
                                                                <label for="AuthorID">AuthorID</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="authorname" class="form-control" id="AuthorName" type="text"
                                                                       placeholder="AuthorName" value="${au.getAuthorName()}"/>
                                                                <label for="AuthorName">AuthorName</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="note" class="form-control" id="Note" type="text"
                                                                       placeholder="Note" value="${au.getNote()}"/>
                                                                <label for="Note">Note</label>
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
                    function deleteAuthor(id) {
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
                                    window.location.href = 'author?action=delete&&AuthorID=' + id;
                                }, delayInMilliseconds);

                            }
                        })
                    }
                    document.getElementById('authorid').value ='AT' + Date.now();
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
