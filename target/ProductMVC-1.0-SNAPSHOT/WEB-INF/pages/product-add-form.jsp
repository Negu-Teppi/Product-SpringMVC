<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/16/2021
  Time: 6:40 PM
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
        <c:if test="${action=='add'}">
            <div class="row text-align-center">
                <div class="col-12 text-align-center">
                    <h4>Add Product</h4>
                </div>
            </div>
        </c:if>

        <mvc:form action="${pageContext.request.contextPath}/result" method="post" modelAttribute="product"
                  enctype="multipart/form-data">
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <td><mvc:label path="">Name</mvc:label></td>--%>
<%--                    <td><mvc:input path="name"/></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><mvc:label path="description">Description</mvc:label></td>--%>
<%--                    <td><mvc:textarea path="description"/></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><mvc:label path="category.id">Category</mvc:label></td>--%>
<%--                    <td><mvc:select path="category.id">--%>
<%--                        <c:forEach items="${categories}" var="category">--%>
<%--                            <mvc:option value="${category.id}">${category.name}</mvc:option>--%>
<%--                        </c:forEach>--%>
<%--                    </mvc:select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><label for="image">Image</label></td>--%>
<%--                    <td><input type="file" name="files" id="image" multiple="multiple"/></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td colspan="2"><mvc:button type="submit">Submit</mvc:button></td>--%>
<%--                </tr>--%>
<%--            </table>--%>

            <div class="form-group">
                <mvc:label for="name" path="name">Name</mvc:label>
                <mvc:input path="name" type="text" class="form-control" id="name"/>
            </div>
            <div class="form-group">
                <mvc:label for="description" path="description">Description</mvc:label>
                <mvc:textarea path="description" class="form-control" rows="5" id="description"/>
            </div>
            <div class="form-group">
                <mvc:label path="category.id">Category</mvc:label>
                <mvc:select path="category.id" class="form-control" >
                    <c:forEach items="${categories}" var="category">
                        <mvc:option value="${category.id}">${category.name}</mvc:option>
                    </c:forEach>
                </mvc:select>
            </div>
            <div class="form-group">
                <label for="image">Image</label>
                <input type="file" name="files" id="image" multiple="multiple" class="form-control-file"/>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </mvc:form>
    </div>

    <script src="<c:url value="/resources/js/jquery.min.js"/> "/>
    <script src="<c:url value="/resources/js/popper.min.js"/> "/>
    <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js"/>"/>
</body>
</html>
