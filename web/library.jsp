<%-- 
    Document   : library
    Created on : Dec 20, 2019, 8:47:42 PM
    Author     : ??ng Minh ??c
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="URL" value="/library"></c:url>
    <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login</title>
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
                            <a href="${pageContext.request.contextPath}/library">Library</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->

        <!-- Library -->
        <!-- Shop -->
        <div class="innerf-pages section">
            <div class="container-cart">
                <!-- product left -->
                <div class="side-bar col-md-3">
                    <!--preference -->
                    <div class="left-side">
                        <h3 class="shopf-sear-headits-sear-head">
                            Categories</h3>
                            <c:forEach var="category" items="${listCategories}">	
                            <ul>
                                <li>
                                    <input type="radio" class="checked">
                                    <span class="span">${category.getBookCategory()}</span>
                                </li>


                            </ul>
                        </c:forEach>
                    </div>
                    <!-- // preference -->
                    <div class="search-hotel">
                        <h3 class="shopf-sear-headits-sear-head">
                            <span>Search</span></h3>
                        <form action="${pageContext.request.contextPath}/search" method="POST">
                            <input type="search" placeholder="Type keyword" name="keyWord" required="">
                            <input type="submit" value="Search">
                        </form>
                    </div>

                    <!-- reviews -->
                    <div class="customer-rev left-side">
                        <h3 class="shopf-sear-headits-sear-head">Customer Review</h3>
                        <ul>
                            <li>
                                <a href="#">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <span>5.0</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <span>4.0</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <span>3.5</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <span>3.0</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                    <span>2.5</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- //reviews -->

                </div>
                <div class="left-ads-display col-md-9">
                    <div class="wrapper_top_shop">
                        <!-- product-sec1 -->
                        <div class="product-sec1">
                            <!-- row1-->
                            <c:forEach var="book" items="${listBook}">
                                <div class="col-md-3 product-men">
                                    <div class="product-chr-info chr">
                                        <div class="thumbnail">
                                            <a href="<c:url value="/book?bookid=${book.bookID}"></c:url>">
                                                <img src="<c:url value="/images/imagesUpload/${book.bookImage}"></c:url>" alt="">
                                                </a>
                                            </div>
                                            <div class="caption">
                                                <h4>${book.bookTitle}</h4>
                                            <p>${book.bookAuthor}</p>
                                            <div class="matrlf-mid">
                                                <ul class="rating">
                                                    <li>
                                                        <a href="#">
                                                            <span class="fa fa-star yellow-star" aria-hidden="true"></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="fa fa-star yellow-star" aria-hidden="true"></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="fa fa-star yellow-star" aria-hidden="true"></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="fa fa-star gray-star" aria-hidden="true"></span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="fa fa-star gray-star" aria-hidden="true"></span>
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="clearfix"> </div>
                                            </div>
                                            <form action="#" method="post" id="formAddBook">
                                                <input id="userName" type="hidden" name="userName" value="${USER.userName}">
                                                <input id="bookId" type="hidden" name="bookId" value="${book.bookID}">
                                                <button id="buttonAddToCart" type="submit" class="chr-cart pchr-cart">Add to cart
                                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                </button>
                                                <a href="#" data-toggle="modal" data-target="#myModal1"></a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!-- //row3 -->
                            <div class="clearfix"></div>

                        </div>

                        <!-- //product-sec1 -->
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>

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
                    $('#formAddBook').submit(function (e) {
                        e.preventDefault();

                        if ($("#userName").val() != null && $("#userName").val().length != 0) {
                            var conf = confirm("Are you sure?");
                            if (conf == true) {
                                $.ajax({
                                    url: '${URL}',
                                    type: 'post',
                                    data: $('#formAddBook').serialize(),
                                    success: function () {
                                        //whatever you wanna do after the form is successfully submitted
                                    }
                                });
                            }
                        } else {
                            alert("You haven't yet login...");
                        }


                    });

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
