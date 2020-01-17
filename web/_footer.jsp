<%-- 
    Document   : _footer
    Created on : Dec 20, 2019, 9:20:46 AM
    Author     : ??ng Minh ??c
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Footer</title>
    </head>
    <body>
        <!-- footer -->
        <div class="w3_footerv1 section">
            <div class="container">
                <div class="w3_footerv1_grids">
                    <div class="col-md-3 col-sm-6 col-xs-6 w3_footerv1_grid">
                        <h3>Contact</h3>
                        <p>If you need more information, please contact us</p>
                        <ul class="address">
                            <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1 Dai Co Viet 
                                <span>Hai Ba Trung, Ha Noi</span></li>
                            <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:dangmduc99@gmail.com">dangmduc99@gmail.com</a></li>
                            <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+84 359 963 321</li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6  w3_footerv1_grid">
                        <h3>Information</h3>
                        <ul class="info"> 
                            <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                            <li><a href="${pageContext.request.contextPath}/about">Management team</a></li>
                            <li><a href="${pageContext.request.contextPath}/contact">Contact us</a></li>
                            <li><a href="${pageContext.request.contextPath}/help">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6  w3_footerv1_grid">
                        <h3>Category</h3>
                        <c:forEach var="category" items="${listCategories}">
                            <ul class="info"> 
                                <li><a href="${pageContext.request.contextPath}/library">${category.getBookCategory()}</a></li>
                            </ul>
                        </c:forEach>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6 w3_footerv1_grid">
                        <h4>Follow Us</h4>
                        <div class="footer-social address  address-mdl">
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
                                        <a href="mailto:dangmduc99@gmail.com">
                                            <span class="fa fa-google-plus icon_g_plus"></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //footer -->
    </body>
</html>
