function filter(campo, id) {
  // Declare variables 
  var input, filter,tables, table, tr, td, i;
  input = document.getElementById(id);
  filter = input.value.toUpperCase();
  tables = document.getElementsByClassName("table");
  table = tables[0];
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[campo];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}