<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="controller.CheckSession"%>



<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/navbarBlu.jsp"></jsp:include>

</head>

<body onLoad="showData()">
	<div class="page-wrapper">

		<!-- Preloader -->
		<!--  <div class="preloader"></div> -->
		
		<div class="container">
	<br><br>
		<div class="row">

			<div class="col-lg-3">
				<jsp:include page="/WEB-INF/menu.jsp"></jsp:include>
			</div>
			<div class="col-lg-9" id="" style="border: 1px solid #d7d7d7; background-color: white;">



		<div class="sidebar-page-container basePage viewRequestSecretary">
			<div class="auto-container">
				<div class="row clearfix">
					<div class="content-side col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="content">
							<div class="news-block-seven">
								<table id="bodySegretaryTable" class="display data-results table table-striped table-hover table-bordered" style="overflow-x: auto;
    display: block;">
									<thead>
										<tr>
											<th class="text-center">ID</th>
											<th class="text-center">Allegati</th>
											<th class="text-center">Matricola</th>
											<th class="text-center">Nome</th>
											<th class="text-center">Cognome</th>
											<th class="text-center">Cod. Cert.</th>
											<th class="text-center">CFU Conv.</th>
											<th class="text-center">Inoltra</th>
										</tr>
									</thead>
									<tbody id="bodySegretaryBody">

									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			</div>
	</div>
	</div>
	
		
	</div>
	<!--End pagewrapper-->

	<jsp:include page="/partials/includes.jsp" />
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	<script>
			jQuery(document).ready(function($){
				$('#bodySegretaryTable').DataTable( {
			        "order": [[ 0, "desc" ]],
			        "lengthMenu": [[10, -1], [10, "Tutti"]],
			        "autoWidth": false,
			        "bAutoWidth": false,
			        "language": {
						    "sEmptyTable":     "Nessuna Richiesta Presente",
						    "sInfo":           "Vista da _START_ a _END_ di _TOTAL_ elementi",
						    "sInfoEmpty":      "Vista da 0 a 0 di 0 elementi",
						    "sInfoFiltered":   "(filtrati da _MAX_ elementi totali)",
						    "sInfoPostFix":    "",
						    "sInfoThousands":  ".",
						    "sLengthMenu":     "Visualizza _MENU_ elementi",
						    "sLoadingRecords": "Caricamento...",
						    "sProcessing":     "Elaborazione...",
						    "sSearch":         "Cerca:",
						    "sZeroRecords":    "La ricerca non ha portato alcun risultato.",
						    "oPaginate": {
						        "sFirst":      "Inizio",
						        "sPrevious":   '<i class="fa fa-caret-left"></i>',
						        "sNext":       '<i class="fa fa-caret-right"></i>',
						        "sLast":       "Fine"
						    },
						    "oAria": {
						        "sSortAscending":  ": attiva per ordinare la colonna in ordine crescente",
						        "sSortDescending": ": attiva per ordinare la colonna in ordine decrescente"
						    }
			        }        
			    } );
			});
		</script>
	<script
		src="<%= request.getContextPath() %>/js/pages/scripts_viewRequestsSegretary.js"></script>
</body>
</html>
