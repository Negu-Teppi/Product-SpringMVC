<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/16/2021
  Time: 5:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Product Page</title>
    <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/app.css"/>" type="text/css" rel="stylesheet"/>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12 text-align-center">
                <h4>List Product</h4>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-6 padding-bottom-5px">
                <button class="btn btn-primary" onclick="location.href ='<c:url value="/add-products"/>'">Add Book</button>
            </div>
            <div class="col-12 col-lg-6">
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Create Date</th>
                            <th>Image</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>

                        <c:forEach items="${products}" var="product">
                            <tr>
                                <td>${product.name}</td>
                                <td>${product.description}</td>
                                <td><fmt:formatDate pattern = "dd-MM-yyyy"
                                                    value = "${product.createDate}" /></td>
                                <td class="td-with">
                                    <c:forEach items="${product.images}" var="image">
                                        <img width="48%" class="padding-5px"
                                             src="<c:url value="/resources/images/"/>${image.name}"/>
                                    </c:forEach>
                                </td>
                                <td>${product.category.name}</td>
                                <td><button type="button" class="btn btn-danger"
                                            onclick="location.href = '<c:url value="/order/${product.id}"/>'">Order</button></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/js/jquery.min.js"/> "/>
    <script src="<c:url value="/resources/js/popper.min.js"/> "/>
    <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"/>"/>
</body>
</html>
