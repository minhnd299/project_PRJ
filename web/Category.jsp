<%-- 
    Document   : Account.jsp
    Created on : Apr 16, 2022, 5:09:40 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Category</title>
        <%@include file="Header.jsp" %>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Category</h1><hr>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form class="row g-3 needs-validation" action="category?action=create" method="post" >
                                    <div class="col-md-6">
                                        <label for="categoryid" class="form-label">CategoryID</label>
                                        <input type="text" class="form-control " id="categoryid" value="" name="categoryid" required="">
                                        <div class="text-danger">${usernameExists == null ? "":"This account already exists!"}</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="categoryname" class="form-label">CategoryName</label>
                                        <input type="text" class="form-control" id="categoryname" value="" required name="categoryname">
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-primary" type="submit">Add Category</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr style="background-color: #FFCE73">
                                            <th class="text-center">Category ID</th>
                                            <th class="text-center">Category Name</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCategory}" var="ct">
                                            <tr>
                                                <td class="text-center">${ct.getCategoryID()}</td>
                                                <td class="text-center">${ct.getCategoryName()}</td>

                                                <td class="text-center">
                                                    <a data-bs-toggle="modal" data-bs-target="#CategoryID${ct.getCategoryID()}" href=""><i class="fa-solid fa-pen-to-square text-primary fa-lg me-2 ms-2" title="Edit"></i></a>
                                                    <a href="#" onclick="deleteCategory('${ct.getCategoryID()}')" ><i class="fa-solid fa-trash text-danger fa-lg me-2 ms-2" title="Delete"></i></a>
                                                </td>
                                            </tr>
                                            <!-- Modal profiles -->
                                        <div class="modal fade" id="CategoryID${ct.getCategoryID()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="category?action=edit" method="POST">
                                                            <div class="form-floating mb-3">
                                                                <input name="categoryid" class="form-control" id="CategoryID" type="text"
                                                                       placeholder="CategoryID" readonly="" value="${ct.getCategoryID()}"/>
                                                                <label for="CategoryID">CategoryID</label>
                                                            </div>
                                                            <div class="form-floating mb-3">
                                                                <input name="categoryname" class="form-control" id="CategoryName" type="text"
                                                                       placeholder="CategoryName" value="${ct.getCategoryName()}"/>
                                                                <label for="CategoryName">CategoryName</label>
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
                    function deleteCategory(id) {
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
                                    window.location.href = 'category?action=delete&&CategoryID=' + id;  
                                }, delayInMilliseconds);

                            }
                        })
                    }
                    document.getElementById('categoryid').value ='CT' + Date.now();
                </script>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>
