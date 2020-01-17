<%-- 
    Document   : homeAdmin
    Created on : Dec 27, 2019, 1:51:01 PM
    Author     : Đặng Minh Đức
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="adminurl" value="/admin-api"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    </head>
    <body>
        <div style="min-height: 794px;">
            <h1 class="text-center" style="margin-top: 100px;">
                <c:if test="${not empty add}">
                    Add book
                </c:if>
                <c:if test="${not empty accept}">
                    Accept book
                </c:if>
            </h1>
            <div class="container" style="width: 100%; display: flex; justify-content: center; align-items: center">
                <div style="width: 60%; height: 100%">
                    <c:if test="${not empty add}">
                        <form id="submitAddBook" method="POST" enctype="multipart/form-data" action="<c:url value="/admin-api"></c:url>">
                                <div class="form-group">
                                    <label for="bookTitle">Book Title</label>
                                    <input type="text" class="form-control" id="bookTitle" name="bookTitle" placeholder="Book Title" />
                                </div>

                                <div class="form-group">
                                    <label for="bookAuthor">Book Author</label>
                                    <input type="text" class="form-control" id="bookAuthor" name="bookAuthor" placeholder="Book Author" />
                                </div>
                                <div class="form-group">
                                    <label for="bookCategoryID">Book Category</label>
                                    <select class="form-control" id="bookCategoryID" name="bookCategoryID">
                                    <c:forEach var="category" items="${listCategories}">
                                        <option value="${category.bookCategoryID}">${category.bookCategory}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="bookContent">Book Content</label>
                                <input type="text" class="form-control" id="bookContent" name="bookContent" placeholder="Book Content" />
                            </div>
                            <div class="form-group">
                                <label for="bookImage">Book Image</label>
                                <input type="file" class="form-control" id="bookImage" name="bookImage" placeholder="Book Image" />
                            </div>
                            <div class="form-group" style="    display: flex;
                                 justify-content: center;">
                                <input type="submit" class="btn btn-primary btn-lg" value="Add Book" id="buttonAddBook" />
                            </div>
                        </form>
                    </c:if>
                    <c:if test="${not empty accept}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Book ID</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="cart" items="${listCart}" varStatus="index">
                                    <tr>
                                        <th scope="row">${index.count}</th>
                                        <td>${cart.userName}</td>
                                        <td>${cart.bookID}</td>
                                        <td>${cart.date}</td>
                                        <td>
                                            <form action="<c:url value="/accept"></c:url>" method="post">
                                                <input type="hidden" name="cartId" value="${cart.cartId}" />
                                                <c:if test="${Integer.parseInt(cart.status) == 1}">
                                                    <input type="hidden" name="accept" value="false" />
                                                    <input type="submit" value="Not accept" class="btn btn-danger" />
                                                </c:if>
                                                <c:if test="${Integer.parseInt(cart.status) == 0}">
                                                    <input type="hidden" name="accept" value="true" />
                                                    <input type="submit" value="Accept" class="btn btn-primary" />
                                                </c:if>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>
                        </table>
                    </c:if>

                </div> 
            </div>
        </div>
        <script>
            $(document).ready(function () {
//                $("#addBook").unbind("click").on("click", function(event) {
//                    event.preventDefault();
//                    $.ajax({
//                        url: '${adminurl}',
//                        type: 'POST',
//                        data: {
//                            bookTitle: $("#bookTitle").val(),
//                            bookAuthor: $("#bookAuthor").val(),
//                            bookCategoryID: $("#bookCategoryID").val(),
//                            bookContent: $("#bookContent").val(),
//                            bookImage: $("#bookImage").val()
//                        }
//                    });
//                });
//                $("#submitAddBook").submit(function(event) {
//                   event.preventDefault();
//                   $.ajax({
//                       url: '${adminurl}',
//                       type: 'POST',
//                       data: $("#submitAddBook").serialize(),
//                       success: function() {
//                           alert("successfully");
//                       }
//                   });
//                });
                $("#buttonAddBook").unbind("click").on("click", function (event) {
                    event.preventDefault();
                    alert("Are you sure ?");
                    $("#submitAddBook").submit();
                });

            });

        </script>
    </body>
</html>
