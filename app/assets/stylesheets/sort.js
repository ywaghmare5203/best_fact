function sortTable(col, myTable){
    var cell = col + myTable.cols;
    var totalRows = myTable.rows.length;
    var tSort = 0;
    var columns = new Array();
    var index = new Array();
    var indexArray = new Array();
    var array = new Array();
    var newRow;
    var newCell;
    var i,j,k;
        for (i=1; i < myTable.rows.length; i++) {
        columns[i - 1] = myTable.cells(cell).innerText;
        cell = cell + myTable.cols;
      }
      for (i=0; i < columns.length; i++){
        array[i] = columns[i];
      }
      columns.sort();
      for (i=0; i < columns.length; i++){
        indexArray[i] = (i+1);
        for(j=0; j < array.length; j++){ 
            if (columns[i] == array[j]){ 
                for (k=0; k<i; k++){
                    if ( index[k] == (j+1) ){
                      tSort = 1;
                    }
                      }
                      if (tSort == 0){
                          index[i] = (j+1);
                        }
                          tSort = 0;
                        }
          }
   }
    for (i=0; i<index.length; i++) {
      newRow = myTable.insertRow();
      for (k=0; k<myTable.cols; k++) {
          newCell = newRow.insertCell();
          newCell.innerHTML = myTable.rows(index[i]).cells(k).innerHTML;
        }
      }
   for (i=1; i<totalRows; i++){
      myTable.moveRow((myTable.rows.length -1),1);
    }
   for (i=1; i<totalRows; i++){
      myTable.deleteRow();
    }
  }