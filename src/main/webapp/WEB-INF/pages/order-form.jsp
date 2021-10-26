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
<head>
    <title>Order Pages</title>
    <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value="/resources/css/app.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value="/resources/js/jquery.min.js"/>">
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</head>
<body>
    <div class="container">
    <c:if test="${action=='addCard'}">
        <div class="row text-align-center">
            <div class="col-12 text-align-center">
                <h4>Product Detail</h4>
            </div>
        </div>
    </c:if>
<%--    <mvc:form action="${pageContext.request.contextPath}/order" method="post" modelAttribute="productDetail">--%>
        <div class="row">
            <div class="col-6">
                    <%--                    <div class="row">--%>
                    <%--                        <label class="col-4">Product Name:</label> ${product.name}--%>
                    <%--                    </div>--%>
                    <%--                    <div class="row">--%>
                    <%--                        <label for="size" class="col-2">Size:</label>--%>
                    <%--                        <select name="size" id="size">--%>
                    <%--                            <c:forEach items="${productDetailsOfSize}" var="sizeProductDetail">--%>
                    <%--                                <c:if test="${sizeName eq sizeProductDetail.size.sizeE}">--%>
                    <%--                                    <option selected value="${sizeProductDetail.size.id}">${sizeProductDetail.size.sizeE}</option>--%>
                    <%--                                </c:if>--%>
                    <%--                                <c:if test="${sizeName ne sizeProductDetail.size.sizeE}">--%>
                    <%--                                    <option value="${sizeProductDetail.size.id}">${sizeProductDetail.size.sizeE}</option>--%>
                    <%--                                </c:if>--%>
                    <%--                            </c:forEach>--%>
                    <%--                        </select>--%>
                    <%--                    </div>--%>
                    <%--                    <div class="row">--%>
                    <%--                        <label for="color" class="col-2">Color:</label>--%>
                    <%--                        <select name="color" id="color">--%>
                    <%--                            <c:forEach items="${productDetail_ColorOfSize}" var="colorOfSize">--%>

                    <%--                                <option value="${colorOfSize.color.id}">${colorOfSize.color.colorE}</option>--%>
                    <%--                            </c:forEach>--%>
                    <%--                        </select>--%>
                    <%--                    </div>--%>
                <table class="table-responsive">
                    <tr>
                        <label class="col-12">Product Name: ${product.name} </label>
                    </tr>
                    <tr>
                        <label class="col-12" for="s">Size:</label>
                        <select name="size" id="s">
                            <c:forEach items="${productDetailsOfSize}" var="sizeProductDetail">
                                <c:if test="${sizeName eq sizeProductDetail.size.sizeE}">
                                    <option selected value="${sizeProductDetail.size.id}">${sizeProductDetail.size.sizeE}</option>
                                </c:if>
                                <c:if test="${sizeName ne sizeProductDetail.size.sizeE}">
                                    <option value="${sizeProductDetail.size.id}">${sizeProductDetail.size.sizeE}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </tr>
                    <tr>
                        <label class="col-12" for="color">Color:
                            <select name="color" id="color">
                                <c:forEach items="${productDetail_ColorOfSize}" var="colorOfSize">

                                    <option value="${colorOfSize.color.id}">${colorOfSize.color.colorE}</option>
                                </c:forEach>
                            </select>
                        </label>
                    </tr>
                    <tr>
                        <label class="col-12">Price:
                                ${productDetail_ColorAndSize.price}
                        </label>
                    </tr>
                    <tr>
                        <label class="col-12" for="quantity">Quantity <input type="number" name="quantityPurchased" value="0" id="quantity"/></label>

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
        <div class="row">
            <div class="col-12 text-align-center">
                <button type="submit" class="btn btn-success">Add Card</button>
            </div>
        </div>
<%--    </mvc:form>--%>
    </div>

<%--&lt;%&ndash;    <script src="<c:url value="/resources/js/jquery.min.js"/> "/>&ndash;%&gt;--%>
<%--    <script src="<c:url value="/resources/js/popper.min.js"/> "/>--%>
<%--    <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"/>"/>--%>
    <script>
        $(document).ready(function () {
            $('#s').on('change',function() {
                var selectVal = $(this).val();
                alert(selectVal);
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/order",
                    data:{'sizeId' : selectVal},
                    success: function(data){ alert('Successfully called');},
                    error:function(exception){alert('Exeption:'+exception);}
                });
            });
        });
    </script>
</body>
</html>