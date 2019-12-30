<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="navbarBlu.jsp"></jsp:include>

<head>
<link rel="stylesheet" href="stiliCSS/stiliListaTirocini.css">
<meta charset="ISO-8859-1">

<script src="jquery-3.4.1.min.js"></script>
<title>Visualizza richieste tirocinio interno</title>
</head>

<div class="container">
	<div class="row">

		<div class="col-lg-3">

			<jsp:include page="menu.jsp"></jsp:include>

		</div>
		<div class="col-lg-9" id="col-9">

			<p id="titolo" class="text-center">Visualizza lista richieste
				tirocinio interno</p>
			<hr>
			<br> <br>

			<!-- SE L'UTENTE LOGGATO E' UNO STUDENTE ed � tirocinio ESTERNO  -->
			<c:if test="${type == 'studente' }">

				<!-- Se la lista di tirocini esterni � vuota esce che non c'� nulla -->
				<c:if test="${registroQueryEsterno.size() == 0}">
					<p>Nessuna richieste di tirocinio esterno � stata effettuata!</p>
				</c:if>

				<c:if test="${registroQueryEsterno.size() > 0}">
					<c:forEach items="${registroQueryEsterno}" var="esterno">

						<table class="table table-striped" id="tabella">
							<thead>
								<tr id="colonne" class="text-center">
									<th scope="col">ID Tirocinio</th>
									<th scope="col">Responsabile</th>
									<th scope="col">Status</th>
									<th scope="col">CFU</th>
									<th scope="col">Ore Max</th>
									<th scope="col">Tipo tirocinio</th>
									<th scope="col">Registro tirocinio</th>
									<th scope="col">Operazioni</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><c:out value="${esterno.ID_Tirocinio}" /></th>
									<td>#</td>
									<td><c:out value="${utenteLoggato.status}" /></td>
									<td><c:out value="${esterno.NumeroCFU}"/></td>
									<td><c:out value="${esterno.OreTotali}" /></td>
									<td>Esterno</td>
									<td class="form-inline">
										<a href="#">
											<i id="registro" class="fas fa-book"></i>
										</a>
										<a href="#">
											<i id="accettare" class="fas fa-check-square"></i>
										</a>
									</td>
									<td>
										<div class="form-group">
											<select class="form-control" id="select"
												onchange="getTutors(this.value)" name="sel1">
												<option selected>--select an option--</option>
												<option value="#">Visualizza progetto</option>
												<option value="questionarioS.jsp">Compila questionario</option>
											</select>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

					</c:forEach>
				</c:if>
			</c:if>

			<!-- SE L'UTENTE LOGGATO E' UNO TUTOR AZIENZALE  -->
			<c:if test="${type == 'tutoraziendale' }">
				<c:if test="${registroQueryEsterno.size() == 0}">
					<p>Nessuna richieste di tirocinio � stata effettuata!</p>
				</c:if>

				<c:forEach items="registroQueryEsterno" var="esterno">
				<table class="table table-striped" id="tabella">
					<thead>
						<tr id="colonne">
							<th scope="col">ID Tirocinio</th>
							<th scope="col">Responsabile</th>
							<th scope="col">CFU</th>
							<th scope="col">Ore Max</th>
							<th scope="col">Registro tirocinio</th>
							<th scope="col">Operazioni</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mario</td>
							<td>Verdi</td>
							<td>mario.verdi</td>
							<td>mario.verdi</td>
							<td class="form-inline text-center">
								<form>
									<i id="registro" class="fas fa-book"></i>
								</form>
								<form id="accettare">
									<i class="fas fa-check-square"></i>
								</form>
							</td>
							<td>
								<div class="form-group">
									<select class="form-control" id="select"
										onchange="getTutors(this.value)" name="sel1">
										<option selected>--select an option--</option>
										<option value="">Visualizza progetto</option>
										<option value="questionarioT.jsp">Compila questionario</option>
									</select>
								</div>
							</td>

						</tr>

					</tbody>
				</table>
				</c:forEach>
			</c:if>

			<!-- SE L'UTENTE LOGGATTO E' IL TUTOR ACCADEMICO -->
			<c:if test="${type == 'tutoraccademico' }">
				<table class="table table-striped" id="tabella">
					<thead>
						<tr id="colonne">
							<th scope="col">ID Tirocinio</th>
							<th scope="col">Responsabile</th>
							<th scope="col">CFU</th>
							<th scope="col">Ore Max</th>
							<th scope="col">Tipo tirocinio</th>
							<th scope="col">Registro tirocinio</th>
							<th scope="col">Operazioni</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mario</td>
							<td>Verdi</td>
							<td>mario.verdi</td>
							<td>mario.verdi</td>
							<td class="form-inline text-center">
								<form>
									<i id="registro" class="fas fa-book"></i>
								</form>
								<form id="accettare">
									<i class="fas fa-check-square"></i>
								</form>
							</td>
							<td>
								<div class="form-group">
									<select class="form-control" id="select"
										onchange="getTutors(this.value)" name="sel1">
										<option selected>--select an option--</option>
										<option value="">Visualizza progetto</option>
										<option value="questionarioT.jsp">Compila questionario</option>
									</select>
								</div>
							</td>

						</tr>

					</tbody>
				</table>
			</c:if>

		</div>

	</div>
</div>
<br>
<jsp:include page="footer.jsp"></jsp:include>



<!-- <script>
	$(document).ready(function() {
		$("#accetta").click(function() {
			$(this).css("background-color", "green");
			$(this).css("color", "white");
			$(this).css("outline", "none");
			$(this).val("selezionato");
			$("#rifiuta").attr("disabled", "true");

		});
	});
</script> -->

