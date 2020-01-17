<%-- 
    Document   : contact
    Created on : Dec 26, 2019, 3:21:51 PM
    Author     : Đặng Minh Đức
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us</title>
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
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
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
                            <a href="${pageContext.request.contextPath}/contact">Contact us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->

        <!-- contact -->
        <div class="section contact" id="contact">
            <div class="container">
                <h4 class="rad-txt text-center">
                    <span class="abtxt1">Contact</span>
                    <span class="abtext">Us</span>
                </h4>
                <div class="contact-form">

                    <!-- contact map grid -->
                    <div class="col-md-5 map contact-right">
                        <div class="contact-top1">
                            <h5>Get directions</h5>
                            <iframe src="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+B%C3%A1ch+khoa+H%C3%A0+N%E1%BB%99i/@21.0048117,105.8431519,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ac76ccab6dd7:0x55e92a5b07a97d03!8m2!3d21.0048067!4d105.8453406?hl=vi-VN"
                                    allowfullscreen></iframe>
                        </div>
                    </div>
                    <!--//contact map grid ends here-->
                    <div class="clearfix"></div>
                </div>
                <!-- contact details -->
                <div class="contact-bottom">
                    <h6>Contact info</h6>
                    <!-- contact details left -->
                    <div class="col-md-6 col-sm-6">
                        <div class="contact-left">
                            <div class="address">
                                <h5>Address:</h5>
                                <p>
                                    1 Dai Co Viet Str
                                    <br> Hai Ba Trung, Ha Noi</p>
                            </div>
                            <div class="address address-mdl">
                                <h5>Phone:</h5>
                                <p>
                                    +84 359 963 321</p>
                                <p>
                                    +84 824 400 143</p>
                            </div>
                        </div>
                    </div>
                    <!-- //contact details left -->
                    <!-- contact details right -->
                    <div class="col-md-6 col-sm-6">
                        <div class="contact-right">
                            <div class="address">
                                <h5>Email:</h5>
                                <p>
                                    <a href="mailto:dangmduc99@gmail.com">Gmail</a>
                                </p>
                                <p>
                                    <a href="mailto:duc.dm173037@sis.hust.edu.vn">Outlook</a>
                                </p>
                            </div>
                            <div class="footer-social address  address-mdl">
                                <h5>Let's get social</h5>
                                <ul>
                                    <li>
                                        <a href="facebook.com/dangmduc99">
                                            <span class="fa fa-facebook icon_facebook"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-twitter icon_twitter"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="fa fa-dribbble icon_dribbble"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="gmail.com">
                                            <span class="fa fa-google-plus icon_g_plus"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- //contact-details right -->
                    <div class="clearfix"></div>
                </div>
                <!-- //contact details ends here -->
            </div>
        </div>
        <!-- //contact -->
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
