<%-- 
    Document   : about
    Created on : Dec 26, 2019, 3:47:30 PM
    Author     : Đặng Minh Đức
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us</title>
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
                            <a href="${pageContext.request.contextPath}/about">About us</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--//breadcrumbs ends here-->

        <!-- about -->
        <div class="about-sec section" id="about">
            <div class="container">
                <!-- about-left-grid -->
                <div class="col-md-7 about-left-grid">
                    <div class="inner-about2">
                        <h4>the splendid Central Library</h4>
                        <p>Billed as the largest in the world,and the library's collection holds more than 3 million items.</p>
                        <h5>the library catalogue</h5>
                        <ul class="about-list">
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>International Collections</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>E books</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>Manuscripts</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>scientific and Technical Information</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>Comic Books</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>Cartography</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>Journals</li>
                            <li>
                                <i class="fa fa-play-circle-o" aria-hidden="true"></i>Audio books</li>
                        </ul>
                        <a href="${pageContext.request.contextPath}/library">View more</a>
                    </div>
                    <!-- about left bottom - services -->
                    <div class="principles-grids principles-grids1">
                        <div class="abt-btm agileits w3layouts aos-init aos-animate">
                            <div class="col-md-6 col-sm-6 agileits elite-services1 w3layouts bottom-gds" data-aos="fade-up">
                                <div class="bott-img agileits w3layouts">
                                    <div class="icon-holder agileits w3layouts">
                                        <span class="fa fa-book agileits w3layouts service-icon" aria-hidden="true"></span>
                                    </div>
                                    <h4 class="mission agileits w3layouts">Law library</h4>
                                    <div class="description agileits w3layouts">
                                        <a href="${pageContext.request.contextPath}/about">Read More</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- //about left bottom - services ends here -->
                </div>
                <!-- //about-left-grid ends here-->
                <!-- about-right-grid -->
                <div class="col-md-5 about-right-grid"></div>
                <!-- //about-right-grid ends here -->
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //about ends here -->
        <!-- about bottom -->
        <div class="about-bottom section">
            <div class="container-fluid">
                <h4 class="rad-txt">
                    <span class="abtxt1">Wonderful</span>
                    <span class="abtext"> World of reading</span>
                </h4>
                <!-- about-bottom grid1 -->
                <div class="col-md-6 about-bottom-right">
                    <p class="abt-p">Etiam massa quam, efficitur eu ante vestibulum, convallis molestie arcu. Morbi dapibus suscipit ante,
                        sit efficitur eu ante vestibulum, convallis molestie arcu. Morbi dapibus suscipit an amet pulvinar
                        risus.
                    </p>
                    <div class="col-md-6 col-sm-6 col-xs-6 services-w3ls">
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>E-books</h5>
                                <p>loremipsum is a dummy text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>Magazines</h5>
                                <p>loremipsum is a dummy text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>Fiction</h5>
                                <p>loremipsum is a dummy text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>Audio books</h5>
                                <p>text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6 services-w3ls service2">
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>Journals</h5>
                                <p>text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>e-library</h5>
                                <p>text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>magazines</h5>
                                <p>text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="ab1">
                            <div class="col-md-3 col-sm-3 col-xs-3 ab1-icon">
                                <span class="fa fa-book" aria-hidden="true"></span>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-9 ab1-text">
                                <h5>Comic Books</h5>
                                <p>text</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //about-bottom grid1 ends here -->
                <div class="col-md-6 home-about2">
                    <!-- about-bottom grid2 -->
                    <div class="col-md-6 col-sm-6 col-xs-6 bg-right"></div>
                    <!-- //about-bottom grid2 ends here -->
                    <!-- about-bottom grid3 -->
                    <div class="col-md-6 col-sm-6 col-xs-6 w3ls-section  stats">
                        <div class="stats-aboutinfo services-main">
                            <div class="agileits_w3layouts-stats-grids text-center">
                                <div class="stats-icon">
                                    <span class="fa fa-book" aria-hidden="true"></span>
                                </div>
                                <div class="stats-right">
                                    <h6>Volumes</h6>
                                    <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='221073' data-delay='.5' data-increment="300">221073</div>

                                </div>
                                <div class="clearfix"></div>

                            </div>
                            <div class="agileits_w3layouts-stats-grids text-center">
                                <div class="stats-icon">
                                    <span class="fa fa-university" aria-hidden="true"></span>
                                </div>
                                <div class="stats-right">
                                    <h6>Branches</h6>
                                    <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='780' data-delay='.5' data-increment="50">980</div>

                                </div>
                                <div class="clearfix"></div>


                            </div>
                            <div class="agileits_w3layouts-stats-grids text-center">
                                <div class="stats-icon">
                                    <span class="fa fa-laptop" aria-hidden="true"></span>
                                </div>
                                <div class="stats-right">
                                    <h6>E-books</h6>
                                    <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='9800' data-delay='.5' data-increment="50">9800</div>

                                </div>
                                <div class="clearfix"></div>

                            </div>
                            <div class="agileits_w3layouts-stats-grids text-center">
                                <div class="stats-icon">
                                    <span class="fa fa-users" aria-hidden="true"></span>
                                </div>
                                <div class="stats-right">
                                    <h6>Visitors</h6>
                                    <div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='123623' data-delay='.5' data-increment="300">123623</div>

                                </div>
                                <div class="clearfix"></div>

                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //about-bottom grid3 ends here -->
                <!-- //Numscroller -->
                <div class="clearfix"></div>
            </div>
            <!-- //about container ends here-->
        </div>
        <!--//about bottom ends here-->

<!-- gallery -->
        <div id="section_demo" class="section">
            <div class="container">
                <h4 class="rad-txt">
                    <span class="abtxt1">Library</span>
                    <span class="abtext">Gallery</span>
                </h4>
                <div class="row">
                    <!-- Result 1 -->
                    <div class="col-lg-12 col-md-12">
                        <div class="row">
                            <div id="slideshow_1_thumbs_1" class="col-lg-2 col-md-2">
                                <ul class="slideshow1_thumbs desoslide-thumbs-vertical list-inline text-center">
                                    <li>
                                        <a href="images/l3.jpg" data-desoslide-index="0">
                                            <img src="images/lt3.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l2.jpg" data-desoslide-index="1">
                                            <img src="images/lt2.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l5.jpg" data-desoslide-index="2">
                                            <img src="images/lt5.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l4.jpg" data-desoslide-index="3">
                                            <img src="images/lt4.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div id="slideshow1" class="col-lg-8 col-md-8"></div>
                            <div class="desoslide-wrapper">
                                <img alt="chronicle_image" class="img-responsive animated fadeIn" src="">
                                <div class="desoslide-overlay" style="left: 0px; top: 399.75px; width: 462px; border-bottom-left-radius: 0px; border-bottom-right-radius: 0px; opacity:0; ">
                                    <span class="desoslide-caption-title">Library Gallery</span>
                                    <div class="desoslide-controls-wrapper">
                                        <a class="desoslide-controls prev" href="#prev"></a>
                                        <a class="desoslide-controls pause" href="#pause" style="display: none;"></a>
                                        <a class="desoslide-controls play" href="#play"></a>
                                        <a class="desoslide-controls next" href="#next"></a>
                                    </div>
                                </div>
                            </div>
                            <div id="slideshow_1_thumbs_2" class="col-lg-2 col-md-2">
                                <ul class="slideshow1_thumbs desoslide-thumbs-vertical list-inline">
                                    <li>
                                        <a href="images/l1.jpg" data-desoslide-index="4">
                                            <img src="images/lt1.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l6.jpg" data-desoslide-index="5">
                                            <img src="images/lt6.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l7.jpg" data-desoslide-index="6">
                                            <img src="images/lt7.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                    <li>
                                        <a href="images/l8.jpg" data-desoslide-index="7">
                                            <img src="images/lt8.jpg" alt="chronicle_image"  data-desoslide-caption-title="Library Gallery" class="img-responsive">
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <!-- //gallery -->
        
        <!--testimonials -->
        <div class="reviews section" id="testimonials">
            <div class="container">
                <h4 class="rad-txt">
                    <span class="abtxt1">Visitors</span>
                    <span class="abtext">Testimonials</span>
                </h4>
                <div id="Carousel" class="slide carousel">
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="row">
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids">
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Exciting</h6>
                                            <p>A thousand interested book</p>
                                            <h5>Dang Minh Duc</h5>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3  img-testi">
                                            <img class="img-responsive" src="images/duc1.jpg" alt="">
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids t2">
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/nam.jpg" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Wonderful</h6>
                                            <p>There are a lot of Vietnamese's history book</p>
                                            <h5>Dao Hoai Nam</h5>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids">
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Happy</h6>
                                            <p>I can borrow a lot of book which are free</p>
                                            <h5>Le Xuan Quang</h5>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/quang.jpg" alt="">
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids t2">
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/hoang.jpg" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Great</h6>
                                            <p>Biggest library I have seen</p>
                                            <h5>Le Viet Hoang</h5>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                            </div>
                            <!--.row-->
                        </div>
                        <!--.item-->
                        <div class="item">
                            <div class="row">
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids">
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Crazy</h6>
                                            <p></p>
                                            <h5>Hoang Thanh Lam</h5>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/lam.jpg" alt="">
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6 testi-main">
                                    <div class="testi-grids t2">
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/meo.jpg" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Lovely</h6>
                                            <p>Lovely house</p>
                                            <h5>Sweetie Cat</h5>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids">
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Exciting</h6>
                                            <p>I have borrowed all of Jindodinho. I will practice new skill</p>
                                            <h5>Lionel Messi</h5>
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/12.jpg" alt="">
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <div class="col-md-6  testi-main">
                                    <div class="testi-grids t2">
                                        <div class="col-md-3 col-sm-3 col-xs-3 img-testi">
                                            <img class="img-responsive" src="images/12122.jpg" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9 team-w3ls-txt">
                                            <h6>Miracle</h6>
                                            <p>I have borrowed all of Conan. I dont care what's skill Messi practice. I'll defeat him on the pitch</p>
                                            <h5>Cristian Ronaldo</h5>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                            </div>
                            <!--.row-->
                        </div>
                    </div>
                    <!--.carousel-inner-->
                    <a data-slide="prev" href="#Carousel" class="left carousel-control"><</a>
                    <a data-slide="next" href="#Carousel" class="right carousel-control">></a>
                </div>
                <!--.Carousel-->
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //testimonials-->

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
        <img src="images/l3.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l2.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l5.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l4.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l1.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l6.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l7.jpg" alt="chronicle_image" style="display:none;">
        <img src="images/l8.jpg" alt="chronicle_image" style="display:none;">
        
        <a href="#" id="toTop" style="display: block;">
            <span id="toTopHover" style="opacity:0;"></span>
            "To Top"
        </a>              
    </body>
</html>
