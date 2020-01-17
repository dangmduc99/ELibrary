<%-- 
    Document   : singleBook
    Created on : Dec 21, 2019, 10:07:59 PM
    Author     : ??ng Minh ??c
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="zxx">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${book.getBookTitle()}</title>
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
                        <li>
                            <a href="${pageContext.request.contextPath}/book?id=${book.getBookID()}">${book.getBookTitle()}}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->

        <!-- Single -->
        <div class="innerf-pages section">
            <div class="container">
                <c:set var = "book" scope = "session" value = "${book}"/>
                <div class="col-md-4 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider1">
                            <div class="thumb-image">
                                <img src="<c:url value="/images/imagesUpload/${book.bookImage}"></c:url>" data-imagezoom="true" alt=" " class="img-responsive"> </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-8 single-right-left simpleCart_shelfItem">
                        <h3>
                            <span>${book.bookTitle}</span>
                    </h3>
                    <p>by
                        <a href="#">${book.bookAuthor}</a>
                    </p>
                    <div class="caption">

                        <ul class="rating-single">
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
                                    <span class="fa fa-star yellow-star" aria-hidden="true"></span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="fa fa-star yellow-star" aria-hidden="true"></span>
                                </a>
                            </li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="desc_single">
                        <h5>Description</h5>
                        <p>${book.bookContent}</p>
                    </div>
                    <div class="occasional">
                        <h5>Detail</h5>
                        <ul class="single_specific">
                            <li>
                                <span>ID: </span> ${book.bookID}</li>
                            <li>
                                <span>Title :</span> ${book.bookTitle}</li>
                            <li>
                                <span>Author :</span> ${book.bookAuthor}</li>
                            <li>
                                <span>Category :</span> ${category.bookCategory}</li>
                        </ul>

                    </div>
                    <div class="clearfix"></div>
                    <div class="occasion-cart">
                        <div class="chr single-item single_page_b">
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
                <div class="clearfix"> </div>
            </div>
        </div>					
        <!--// Single -->

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
