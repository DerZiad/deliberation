<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Liste des inscriptions en lignes</h5>
				<input type="text" onkeyup="myFunction()" id="myInput">
				
				<input type="checkbox" id="filtercheck" name="accepter"/>
				
				
				<table class="mb-0 table table-striped" id="myTable">
					<thead>
						<tr>
							<th class="th-sm">CNE</th>
							<th class="th-sm">Nom</th>
							<th class="th-sm">Prénom</th>
							<th class="th-sm">Sexe</th>
							<th class="th-sm">Nationalité</th>
							<th class="th-sm">Date de naissance</th>
							<th class="th-sm">Type du Bac</th>
							<th class="th-sm">Mention</th>
							<th class="th-sm">Accepté</th>
							<th class="th-sm">Inscription Administrative</th>
							<th class="th-sm">Action</th>
						</tr>
					</thead>
					<tbody id="inscriptions">
						<c:forEach var="etudiant" items="${inscriptions}">
							<tr>
								<td><a style="color: black" href="#">${etudiant.cne}</a></td>
								<td><a style="color: black" href="#">${etudiant.last_name_fr}</a></td>
								<td><a style="color: black" href="#">${etudiant.first_name_fr}</a></td>
								<td><a style="color: black" href="#">${etudiant.gender}</a></td>
								<td><a style="color: black" href="#">${etudiant.nationality}</a></td>
								<c:set var="date" value="${etudiant.birth_date}"></c:set>
								<c:set var="birth_date" value="${fn:substring(date,0,10)}"></c:set>
								<td><a style="color: black" href="#">${birth_date}</a></td>
								<td><a style="color: black" href="#">${etudiant.bac_type}</a></td>
								<td><a style="color: black" href="#">${etudiant.mention}</a></td>
								<td style="color: black"><c:if test="${etudiant.acceptedParAdmin eq 1}">Accepté</c:if><c:if test="${etudiant.acceptedParAdmin eq 0}">Non Accepté</c:if></td>
								<td><a
									href="/admin/inscription/InscriptionAdministrative/${etudiant.id_inscription_en_ligne}"
									style="font-size: 20px;"><i class="fas fa-plus-square"
										aria-hidden="true" title="edit"></i></a></td>
								<td><a href="/admin/inscriptionenligne/accept/${etudiant.id_inscription_en_ligne}"><c:if test="${etudiant.acceptedParAdmin eq 0}">Accepter</c:if></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("myTable");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[1];
      y = rows[i + 1].getElementsByTagName("TD")[1];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
		<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
  sortTable();
}
sortTable();
</script>

	</layout:put>
</layout:extends>