<%-- 
    Document   : cart
    Created on : Dec 22, 2019, 5:22:40 PM
    Author     : Đặng Minh Đức
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!-- Custom Theme files -->
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <!-- shop css -->
        <link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
        <!-- font-awesome icons -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- //Custom Theme files -->
        <!-- online-fonts -->
        <!-- logo -->
        <link href="//fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
        <!-- titles -->
        <link href="//fonts.googleapis.com/css?family=Merriweather+Sans:300,300i,400,400i,700,700i,800,800i" rel="stylesheet">
        <!-- body -->
        <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
        <!-- //online-fonts -->
    </head>
    <body>
        <jsp:include page="_header.jsp"></jsp:include>
        <jsp:include page="_banner.jsp"></jsp:include>
            <!-- breadcrumbs -->
            <div class="crumbs text-center">
                <div class="container">
                    <div class="row">
                        <ul class="btn-group btn-breadcrumb bc-list">
                            <li class="btn btn1">
                                <a href="${pageContext.request.contextPath}/home">
                                <i class="glyphicon glyphicon-home"></i>
                            </a>
                        </li>
                        <li class="btn btn2">
                            <a href="${pageContext.request.contextPath}/cart">Cart</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->

        <!--cart-->
        <div class="innerf-pages section">
            <div class="container">
                <div class="privacy about">
                    <h4 class="rad-txt">
                        <span class="abtxt1">Review</span>
                        <span class="abtext">Your cart</span>
                    </h4>

                    <div class="checkout-right">
                        
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Book ID</th>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Book Detail</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${listCart}" varStatus="index">
                                    <tr class="rem1">
                                        <td class="invert" scope="row">${index.count}</td>
                                        <td class="invert">${cart.getBookID()}</td>
                                        <td class="invert">${cart.book.bookTitle}</td>
                                        <td>
                                            <a href="<c:url value="/book?bookid=${cart.book.bookID}"></c:url>">Detail</a>
                                        </td>
                                        <td class="invert">${cart.date}</td>
                                        <td class="invert">${cart.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--//cart-->

        <jsp:include page="_footer.jsp"></jsp:include>
        <!-- js -->
        <script src="js/jquery-2.2.3.min.js"></script>
        <!-- //js -->
        <!-- dropdown nav -->
        <script>
            $(document).ready(function () {
                $(".dropdown").hover(
                        function () {
                            $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                            $(this).toggleClass('open');
                        },
                        function () {
                            $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                            $(this).toggleClass('open');
                        }
                );
            });
        </script>
        <!-- //dropdown nav -->
        <!--search jQuery-->
        <script src="js/main.js"></script>
        <!--search jQuery-->
        <!-- cart-js -->
        <script src="js/minicart.js"></script>
        <script>
            chr.render();

            chr.cart.on('new_checkout', function (evt) {
                var items, len, i;

                if (this.subtotal() > 0) {
                    items = this.items();

                    for (i = 0, len = items.length; i < len; i++) {
                    }
                }
            });
        </script>
        <!-- //cart-js -->
        <!-- Scrolling Nav JavaScript -->
        <script src="js/scrolling-nav.js"></script>
        <!-- //fixed-scroll-nav-js -->
        <!-- start-smooth-scrolling -->
        <script src="js/move-top.js"></script>
        <script src="js/easing.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();

                    $('html,body').animate({
                        scrollTop: $(this.hash).offset().top
                    }, 1000);
                });
            });
        </script>
        <!-- //end-smooth-scrolling -->
        <!-- smooth-scrolling-of-move-up -->
        <script>
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({
                    easingType: 'easeOutQuart'
                });

            });
        </script>
        <script src="js/SmoothScroll.min.js"></script>
        <!-- //smooth-scrolling-of-move-up -->
        <!-- Bootstrap core JavaScript
     ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>
