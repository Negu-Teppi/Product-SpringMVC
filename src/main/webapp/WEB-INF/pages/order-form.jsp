<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/7/2021
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<html>
<head>
    <title>Order Pages</title>
    <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/app.css"/>" type="text/css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <c:if test="${action=='addCart'}">
            <div class="row text-align-center">
                <div class="col-12 text-align-center">
                    <h4>Product Detail</h4>
                </div>
            </div>
        </c:if>
        <mvc:form action="${pageContext.request.contextPath}/order" method="post" modelAttribute="productDetails">
            <div class="row">
                <div class="col-6">
                    <table class="table-responsive">
                        <tr>
                            <label class="col-12">Product Name: ${product.name} </label>
                        </tr>
                        <tr>
                            <label class="col-12">Size:
                                <select name="size">
                                    <c:forEach items="${productDetails}" var="productDetail">
                                            <option value="${productDetail.size.id}">${productDetail.size.sizeE}</option>
                                    </c:forEach>
                                </select>
                            </label>
                        </tr>
                        <tr>
                            <label class="col-12">Color:
                                <select name="color">
                                    <c:forEach items="${productDetails}" var="productDetail">
                                        <option value="${productDetail.color.id}">
                                        </option>
                                    </c:forEach>
                                </select>
                            </label>
                        </tr>
                        <tr>

                        </tr>
                        <tr>

                        </tr>
                    </table>
                </div>
                <div class="col-6 td-with-200px">
                    <c:forEach items="${product.images}" var="image">
                        <img width="48%" class="padding-5px"
                             src="<c:url value="/resources/images/"/>${image.name}"/>
                    </c:forEach>
                </div>
            </div>

        </mvc:form>
    </div>
</body>
</html>
