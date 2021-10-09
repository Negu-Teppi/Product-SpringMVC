<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/25/2021
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/app.css"/>" type="text/css" rel="stylesheet"/>
</head>
<body>

    <div class="container">
        <c:if test="${action=='add-product-detail'}">
            <div class="row text-align-center">
                <div class="col-12 text-align-center">
                    <h4>Add Product Detail</h4>
                </div>
            </div>
        </c:if>
        <mvc:form action="${pageContext.request.contextPath}/add-products-detail" method="post" modelAttribute="product-detail">

            <div class="row"><div class="form-group col-6" >
                <label for="quantity">Quantity</label>
                <input name="quantity" type="number" class="form-control" id="quantity"/>
            </div>
                <div class="form-group col-6">
                    <label for="price">Price</label>
                    <input name="price" type="number" class="form-control" id="price"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-6">
                    <label>Color</label>
                    <select name="color.colorE" class="form-control" >
                        <c:forEach items="${colors}" var="color">
                            <option value="${color}">${color}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group col-6">
                    <label>Size</label>
                    <select name="size.sizeE" class="form-control" >
                        <c:forEach items="${sizes}" var="size">
                            <option value="${size}">${size}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </mvc:form>


        <div class="container">
            <c:if test="${exists != null}">
                <div class="alert alert-danger">
                    <i>Product Detail Exists</i>
                </div>
            </c:if>

            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Color</th>
                                    <th>Size</th>
                                    <th>Action</th>
                                </tr>
                            <thead>
                            <tbody>
                                <c:forEach items="${productDetails}" var="productDetail" varStatus="loopStatus">
                                    <tr>
                                        <td>${productDetail.product.name}</td>
                                        <td>${productDetail.price}</td>
                                        <td>${productDetail.quantity}</td>
                                        <td>${productDetail.color.colorE}</td>
                                        <td>${productDetail.size.sizeE}</td>
                                        <td>
                                            <button type="button" class="btn btn-danger"
                                            onclick="location.href = '<c:url value="/delete-productDetail/${loopStatus.index}"/>'">Remove</button>
                                        </td>
                                    </tr>

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-align-center">
                    <button type="submit" class="btn btn-primary"
                            onclick="location.href='<c:url value="/save-productDetails"/>'">Submit</button>
                </div>
            </div>
        </div>

    </div>


    <script src="<c:url value="/resources/js/jquery.min.js"/> "/>
    <script src="<c:url value="/resources/js/popper.min.js"/> "/>
    <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"/>"/>
</body>
</html>
