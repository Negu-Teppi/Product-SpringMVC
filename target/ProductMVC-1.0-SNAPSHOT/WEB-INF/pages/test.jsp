<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/28/2021
  Time: 1:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<html>
<head>
    <title>HTML dynamic table using JavaScript</title>
<%--    <link href="<c:url value="/resources/js/app.js"/>"/>--%>
    <style>
        table {
            width: 70%;
        }

        table,
        th,
        td {
            border: solid 1px #DDD;
            border-collapse: collapse;
            padding: 2px 3px;
            text-align: center;
        }
    </style>
</head>
<body onload="createTable()">
    <table>
        <tr>
            <td>
                Quantity
                <input type="text" id="quantity">
            </td>
            <td>
                Price
                <input type="text" id="price">
            </td>
        </tr>
        <tr>
            <td>
                Color
                <input type="text" id="color">
            </td>
            <td>
                Size
                <input type="text" id="size">
            </td>
        </tr>
    </table>
    <p>
        <input type="button" id="addRow" value="Add" onclick="addRow()" />
    </p>
    <div id="cont"></div>
    <!--the container to add the table.-->

    <mvc:form action="${pageContext.request.contextPath}/test" method="post">

        <button type="submit" id="bt" name="submit" onclick="submit()">Submit</button>
    </mvc:form>
</body>

<script>
    var arrHead = new Array();
    arrHead = ['Name', 'Price', 'Quantity', 'Price', 'Color', 'Action']; // table headers.

    // first create a TABLE structure by adding few headers.
    function createTable() {
        var empTable = document.createElement('table');
        empTable.setAttribute('id', 'empTable'); // table id.

        var tr = empTable.insertRow(-1);

        for (var h = 0; h < arrHead.length; h++) {
            var th = document.createElement('th'); // the header object.
            th.innerHTML = arrHead[h];
            tr.appendChild(th);
        }

        var div = document.getElementById('cont');
        div.appendChild(empTable); // add table to a container.
    }

    // function to add new row.
    function addRow() {
        var empTab = document.getElementById('empTable');

        var rowCnt = empTab.rows.length; // get the number of rows.
        var tr = empTab.insertRow(rowCnt); // table row.
        tr = empTab.insertRow(rowCnt);

        var quantity = document.getElementById("quantity").value;
        var price = document.getElementById("price").value;
        var color = document.getElementById("color").value;
        var size = document.getElementById("size").value;

        for (var c = 0; c < arrHead.length; c++) {
            var td = document.createElement('td'); // TABLE DEFINITION.
            td = tr.insertCell(c);

            switch (c) {
                case 0:
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', quantity);

                    td.appendChild(ele);
                    break;
                case 1:
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', quantity);

                    td.appendChild(ele);
                    break;
                case 2:
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', price);

                    td.appendChild(ele);
                    break;
                case 3:
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', color);

                    td.appendChild(ele);
                    break;
                case 4:
                    var ele = document.createElement('input');
                    ele.setAttribute('type', 'text');
                    ele.setAttribute('value', size);

                    td.appendChild(ele);
                    break;
                case arrHead.length - 1:
                    var button = document.createElement('input');

                    // set the attributes.
                    button.setAttribute('type', 'button');
                    button.setAttribute('value', 'Remove');

                    // add button's "onclick" event.
                    button.setAttribute('onclick', 'removeRow(this)');

                    td.appendChild(button);
                    break;

            }

            // if (c == arrHead.length - 1) { // if its the first column of the table.
            //     // add a button control.
            //     var button = document.createElement('input');

            //     // set the attributes.
            //     button.setAttribute('type', 'button');
            //     button.setAttribute('value', 'Remove');

            //     // add button's "onclick" event.
            //     button.setAttribute('onclick', 'removeRow(this)');

            //     td.appendChild(button);
            // } else {
            //     // the 2nd, 3rd and 4th column, will have textbox.
            //     var ele = document.createElement('input');
            //     ele.setAttribute('type', 'text');
            //     ele.setAttribute('value', quantity);

            //     td.appendChild(ele);
            // }
        }
    }

    // function to delete a row.
    function removeRow(oButton) {
        var empTab = document.getElementById('empTable');
        empTab.deleteRow(oButton.parentNode.parentNode.rowIndex); // buttton -> td -> tr
    }

    // function to extract and submit table data.
    function submit() {
        var myTab = document.getElementById('empTable');
        var arrValues = new Array();

        // loop through each row of the table.
        for (row = 1; row < myTab.rows.length - 1; row++) {
            // loop through each cell in a row.
            for (c = 0; c < myTab.rows[row].cells.length; c++) {
                var element = myTab.rows.item(row).cells[c];
                if (element.childNodes[0].getAttribute('type') == 'text') {
                    arrValues.push("'" + element.childNodes[0].value + "'");
                }
            }
        }

        // finally, show the result in the console.
        console.log(arrValues);
    }
</script>

</html>
