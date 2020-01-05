<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navbarBlu.jsp"></jsp:include>

<head>
<link rel="stylesheet" href="stiliCSS/stiliRicoscimentoAttivita.css">
<meta charset="ISO-8859-1">

<script src="jquery-3.4.1.min.js"></script>
<title>Visualizza richieste riconoscimento attivit� lavorative</title>
</head>

<div class="container">
	<div class="row">

		<div class="col-lg-3">

			<jsp:include page="menu.jsp"></jsp:include>

		</div>
		<div class="col-lg-9" id="col-9">

			<p id="titolo1" class="text-center">Richieste di riconoscimento
				attivit� lavorative</p>
			
			<hr>
			<c:if test="${elencoRiconoscimento.size() == 0 }">
				<p>Non ci sono richieste di riconoscimento attivit�!</p>
			</c:if>


			<c:if test="${elencoRiconoscimento.size() > 0 }">
				<!-- inizio lista richieste riconoscimento da parte dello STUDENTE -->
				<c:if test="${type== 'studente' }">
					<table class="table table-striped" id="tabella">
						<thead>
							<tr id="colonne" class="text-center">
								<th scope="col">Numero richiesta</th>
								<th scope="col">Status</th>
								<th scope="col">CFU totali</th>
								<th scope="col">PDF</th>
								<!-- 	<th scope="col">Status</th> -->
							</tr>
						</thead>
						<c:if test="${elencoRiconoscimento.size() > 0 }">
							<c:forEach items="${elencoRiconoscimento}" var="ricon">
								<tbody>
									<tr class="text-center">
										<th><c:out value="${ricon.idRiconoscimento}" /></th>

										<th><i id="status" class="far fa-circle"
											title="<c:out value="${ricon.stato}"/>"></i></th>

										<td><c:out
												value="${ricon.CFUTirocinioEsterno + ricon.CFUAccompagnamentoLavoro + ricon.CFUTirocinioObbligatorio}" /></td>
										<td><button
												onclick="location.href='VisualizzaModuloRiconoscimento?idRiconoscimento=${ricon.idRiconoscimento}'">
												<i class="fas fa-file-pdf"></i>
											</button></td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>
				</c:if>
			</c:if>
			<!-- fine parte STUDENTEeee -->



			<!--  inizio lista richieste riconoscimento da parte dello PDCD e UFF-CARR -->
			<c:if test="${elencoRiconoscimento.size() > 0 }">
				<c:if test="${type=='pdcd'}">
					<!-- da agiungere l'uff carr -->
					<table class="table table-striped" id="tabella">
						<thead>
							<tr id="colonne" class="text-center">
								<th scope="col">Numero richiesta</th>
								<th scope="col">Studente</th>
								<th scope="col">Matricola</th>
								<th scope="col">Status</th>
								<!-- 	<th scope="col">CFU totali</th> -->
								<th scope="col">PDF</th>
								<th scope="col">Info richiesta</th>
								<th scope="col">Valuta</th>
							</tr>
						</thead>
						<!-- PARTIRE DA QUI CON IN C:FOR -->
						<c:forEach items="${elencoRiconoscimento}" var="ricon">
							<tbody>
								<tr class="text-center">
									<th><c:out value="${ricon.idRiconoscimento}" /></th>
									<th></th>
									<th></th>
									<th><i id="status" class="far fa-circle"
										title="<c:out value="${ricon.stato}"/>"></i></th>

									<td><button>
											<i class="fas fa-file-pdf"></i>
										</button></td>
									<td>#</td>


									<!-- c:if test="${ricon.stato eq 'V'}"> -->
									<!-- � sttao messo nel commento in quanto se ci fosse non fa apparire i bottoni, nonostatnte 
									lo status fosse V  -->
									<td>
										<button class="bottone"
											onclick="windows.location='ApprovaRifiutoModuloRiconoscimento?modifica=approva'"
											id="accetta">
											<i class="fas fa-check-square"></i>
										</button>

										<button class="bottone"
											onclick="windows.location='ApprovaRifiutoModuloRiconoscimento?modifica=rifiuta'"
											id="rifiuta">
											<i class="far fa-times-circle"></i>
										</button>
									</td>

								</tr>
							</tbody>
						</c:forEach>
					</table>
				</c:if>
			</c:if>


		</div>
	</div>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>

<script>
	/* status: riferito allo status di riconoscimento attivit� */
	$(document).ready(function() {
		if ($('i:contains(V)')) {
			$("#status").css("background-color", "yellow");
			$("#status").css("color", "black");
			$("#status").css("border-radius", "22px");
		} else if ($('i:contains(A)')) {
			$("#status").css("background-color", "green");
			$("#status").css("color", "black");
			$("#status").css("border-radius", "22px");
		} else if ($('i:contains(R)')) {
			$("#status").css("background-color", "red");
			$("#status").css("color", "black");
			$("#status").css("border-radius", "22px");
		}

	});
</script>




