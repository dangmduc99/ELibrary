<%-- 
    Document   : _header
    Created on : Dec 20, 2019, 9:20:24 AM
    Author     : ??ng Minh ??c
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <div id="home">
            <!-- header -->
            <!-- navbar -->
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="main-nav">
                    <div class="container">

                        <div class="navbar-header page-scroll">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="sr-only">E Library</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <h1>
                                <a class="navbar-brand" href="${pageContext.request.contextPath}/home">E Library</a>
                            </h1>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-ex1-collapse nav-right">
                            <ul class="nav navbar-nav navbar-left cl-effect-15">
                                <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                                <li class="hidden">
                                    <a class="page-scroll" href="#page-top"></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/home">Home</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/library">Library</a>
                                </li>
                                <li>
                                    <c:if test="${(not empty USER) && (USER.isAdmin == 1)}">
                                        <a href="${pageContext.request.contextPath}/add">Add Book</a>
                                    </c:if>
                                    <c:if test="${(empty USER) || (USER.isAdmin == 0)}">
                                        <a href="${pageContext.request.contextPath}/about">About us</a>
                                    </c:if>
                                </li>
                                <li>
                                    <c:if test="${(not empty USER) && (USER.isAdmin == 1)}">
                                        <a href="${pageContext.request.contextPath}/accept">Accept book</a>
                                    </c:if>
                                    <c:if test="${(empty USER) || (USER.isAdmin == 0)}">
                                        <a href="${pageContext.request.contextPath}/contact">Contact us</a>
                                    </c:if>

                                </li>
                                <c:if test="${(empty USER) || (USER.isAdmin == 0)}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/help">Help</a>
                                    </li>
                                </c:if>


                                <li class="dropdown">
                                    <a href="${pageContext.request.contextPath}/user" title="User infomation">
                                        <span class="fa fa-user nav-icon" aria-hidden="true"></span>
                                    </a>
                                    <c:if test="${not empty USER}">
                                        <ul class="dropdown-menu" id="info">
                                            <li><a href="${pageContext.request.contextPath}/user">User information</a></li>
                                            <li><a href="${pageContext.request.contextPath}/updateProfile">Update profile</a></li>
                                            <li><a href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a></li>
                                            <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
                                        </ul>
                                    </c:if>
                                    <c:if test="${empty USER}">
                                        <ul class="dropdown-menu" id="login">
                                            <li><a href="${pageContext.request.contextPath}/login">Log in</a></li>
                                            <li><a href="${pageContext.request.contextPath}/signup">Sign up</a></li>
                                        </ul>
                                    </c:if>




                                </li>
                            </ul>
                            <!-- search-bar -->
                            <div class="search-bar-agileits">
                                <div class="cd-main-header">
                                    <ul class="cd-header-buttons">
                                        <li>
                                            <a class="cd-search-trigger" href="#cd-search">
                                                <span></span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- cd-header-buttons -->
                                </div>
                                <div id="cd-search" class="cd-search">
                                    <form action="${pageContext.request.contextPath}/search" method="POST">
                                        <input name="keyWord" type="search" placeholder="Type and press Enter...">
                                    </form>
                                </div>
                            </div>
                            <!-- //search-bar ends here -->
                            <!-- shopping cart -->

                            <div class="cart-mainf">
                                <div class="chrcart chrcart2 cart cart box_1">
                                    <form action="${pageContext.request.contextPath}/cart" method="POST" class="last">
                                        <input type="hidden" name="cmd" value="_cart">
                                        <input type="hidden" name="display" value="1">
                                        <a href="<c:url value="/cart"></c:url>" class="top_chr_cart">
                                                <i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
                                            </a>
                                        </form>
                                    </div>
                                </div>


                                <!-- //shopping cart ends here -->
                            </div>
                            <!-- /.navbar-collapse -->
                            <div class="clearfix"></div>
                        </div>
                        <!-- /.container -->
                    </div>
                </nav>
                <!-- //navbar ends here -->
            </div>
            <script>
//            var userName = '${USER.userName.trim()}';
//            if (userName === null || userName === '') {
//                document.getElementById('info').style.visibility = "hidden";
//                document.getElementById('login').style.visibility = "visible";
//            } else {
//                document.getElementById('login').style.visibility = "hidden";
//                document.getElementById('info').style.visibility = "visible";
//            }
        </script>
    </body>
</html>
