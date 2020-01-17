<%-- 
    Document   : updateProfile
    Created on : Dec 26, 2019, 10:03:17 AM
    Author     : Đặng Minh Đức
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update profile</title>
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
                            <a href="${pageContext.request.contextPath}/updateProfile">Update profile</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->
        
        <div class="login-form section text-center">
                <div class="container">
                    <h4 class="rad-txt">
                        <span class="abtxt1">Update</span>
                        <span class="abtext">Profile</span>
                    </h4>
                    <div id="signupform" style=" margin-top:30px" class="mainbox signupbox">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Update profile</div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form id="signupform" class="form-horizontal" action="${pageContext.request.contextPath}/updateProfile" method="POST">
                                
                                <c:if test="${not empty message}">
                                <c:if test="${not empty success}">
                                    <div id="login-alert" class="alert alert-success col-sm-12">
                                        ${message}
                                    </div> 
                                </c:if>
                                <c:if test="${empty success}">
                                    <div id="login-alert" class="alert alert-danger col-sm-12">
                                        ${message}
                                    </div> 
                                </c:if>
                            </c:if>
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-3 control-label">Full name</label>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <input type="text" class="form-control" name="userFullname" placeholder="Full name" required="" value="${user.userFullname}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-3 control-label">Phone number</label>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <input type="text" class="form-control" name="userPhone" placeholder="Phone number" required="" value="${user.userPhone}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-3 control-label">Email</label>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <input type="text" class="form-control" name="userEmail" placeholder="Email" required="" value="${user.userEmail}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-3 control-label">Address</label>
                                    <div class="col-md-9 col-sm-9 col-xs-9">
                                        <input type="text" class="form-control" name="userAddress" placeholder="Address" required="" value="${user.userAddress}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <!-- Button -->
                                    <div class="signup-btn">
                                        <input type="submit" value="Submit" id="btn-signup" class="btn btn-success">
                                        <a href="${pageContext.request.contextPath}/home">Cancel</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--//sign up form ends here-->
                <jsp:include page="_footer.jsp"></jsp:include>
                <!-- js -->
                <script src="js/jquery-2.2.3.min.js"></script>
                <!-- //js -->
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
                <!-- about bottom grid Numscroller -->
                <script src="js/numscroller-1.0.js"></script>
                <!-- //about bottom grid Numscroller -->
                <!-- Bootstrap core JavaScript
             ================================================== -->
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="js/bootstrap.js"></script>
            </div>
    </body>
</html>
