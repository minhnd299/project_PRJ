<%-- 
    Document   : Dashboard
    Created on : Apr 12, 2022, 12:28:15 PM
    Author     : DPV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Dashboard</title>
        <%@include file="Header.jsp" %>
    </head>
    <style>
        .feature-box {
            padding: 38px 30px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 29px 0 rgb(18 66 101 / 8%);
            transition: all 0.3s ease-in-out;
            border-radius: 8px;
            z-index: 1;
            width: 100%;
        }
        .feature-icon {
            font-size: 1.8em;
            margin-bottom: 1rem;
        }

        .feature-title {
            font-size: 1.5em;
            font-weight: 500;
            padding-bottom: 0.25rem;
            text-decoration: none;
            color: white;
        }
        .feature-content{
            font-size: 1em;
            font-weight: 500;
            padding-bottom: 0.25rem;
            text-decoration: none;
            color: white;
        }
    </style>
    <body class="sb-nav-fixed">
        <%@include file="Navbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav_nav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1><hr>
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #7261EE">
                                    <div class="text-white">
                                        <div>
                                            <div class="feature-title">TOTAL READER</div>
                                            <div class="feature-title">${NumberOfReader}</div>
                                            <i class="fa-solid fa-book-open-reader feature-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #2196F5">
                                    <div class="text-white">
                                        <div>
                                            <div class="feature-title">TOTAL BOOK</div>
                                            <div class="feature-title">${NumberOfBook}</div>
                                            <i class="fa-solid fa-book feature-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #4DB151">
                                    <div class="text-white">
                                        <div>
                                            <div class="feature-title">TOTAL AUTHOR</div>
                                            <div class="feature-title">${NumberOfAuthor}</div>
                                            <i class="fa-solid fa-user-pen feature-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #029688">
                                    <div class="text-white">
                                        <div>
                                            <div class="feature-title">TOTAL PUBLISHER</div>
                                            <div class="feature-title">${NumberOfPublisher}</div>
                                            <i class="fas fa-file-powerpoint feature-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="feature-box" style="background-color: #3C579B">
                                    <div class="text-white">
                                        <div>
                                            <div class="feature-title">TOTAL CATEGORY</div>
                                            <div class="feature-title">${NumberOfCategory}</div>
                                            <i class="fa-solid fa-filter feature-icon"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="Footer.jsp" %>
            </div>
        </div>
    </body>
</html>

