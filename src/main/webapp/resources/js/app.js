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

