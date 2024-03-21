<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link ${dashboardMenu}" href="dashboard">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-house me-3"></i>Dashboard
                </a>
                <c:if test="${account.getRole() == 1}">
                    <a class="nav-link ${accountMenu}" href="account">
                        <div class="sb-nav-link-icon"></div>
                        <i class="fa-solid fa-user me-3"></i>Account
                    </a>
                </c:if>

                <a class="nav-link ${readerMenu}" href="reader">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-book-open-reader me-3"></i>Reader
                </a>
                <a class="nav-link ${invoiceMenu}" href="invoice">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-file-lines me-3"></i>Invoice
                </a>
                <a class="nav-link ${bookMenu}" href="book">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-book me-3"></i>Book
                </a>
                <a class="nav-link ${categoryMenu}" href="category">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-filter me-3"></i>Category
                </a>
                <a class="nav-link ${authorMenu}" href="author">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fa-solid fa-user-pen me-3"></i>Author
                </a>
                <a class="nav-link ${publisherMenu}" href="publisher">
                    <div class="sb-nav-link-icon"></div>
                    <i class="fas fa-file-powerpoint me-3"></i>Publisher
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Login in as:</div>
            ${account.getRole() == 0 ? "User" : "Administrators"}
        </div>
    </nav>
</div>