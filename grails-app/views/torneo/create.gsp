<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'torneo.label', default: 'Torneo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-torneo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifAllGranted roles="ROLE_ADMIN"><li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li></sec:ifAllGranted>
			</ul>
		</div>
		<div id="create-torneo" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.params.error}">
				<div class="login_message" role="status">${flash.params.error}</div>
			</g:if>
			<g:hasErrors bean="${torneoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${torneoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
		
			<g:form action="torneo" action="generarPlayers" name="createTorneo" id="createTorneo">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
			<div id="crearTorneo_div" style="display:block">	
				<fieldset class="buttons">
					<g:submitButton name="create" id="buttonCreate" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</div>			
			</g:form>
		
		<div id="registracionTorneo">
		</div>
		</div>
		<script>
		$("#buttonCreate").click(function() {
			if(document.querySelector('#nombre').validity.valid && document.querySelector('#cantidadPlayer').validity.valid && document.querySelector('#descripcion').validity.valid){
				document.getElementById('createTorneo').onsubmit = function() {
					var cantidadPlayer = $("#cantidadPlayer").val();
					var descripcion = $("#").val();
					var nombre = $("#nombre").val();
					var password = $("#password").val();
					<g:remoteFunction controller="torneo" action="registracionTorneo"  params="\'cantidadPlayer=\' + cantidadPlayer +  \'&nombre=\' + nombre + \'&descripcion=\' + descripcion + \'&password=\' + password" update="registracionTorneo"/>
					document.getElementById("crearTorneo_div").style.display = "none";
					waitingDialog.show('Cargando...', {dialogSize: 'sm', progressType: 'success'});
					setTimeout(function () {waitingDialog.hide();}, 1500);
					 $("#nombre").prop("readonly", true);
					 $("#cantidadPlayer").prop("readonly", true);
					 $("#descripcion").prop("readonly", true);
					 $("#password").prop("readonly", true);
					 
				    return false;
				}
			}
		});

		$('#guardarTorneo').submit(function() {
		    $('#owner').removeAttr('disabled');
		});


		$("#buttonCreateResumen").click(function() {
			alert("Boton Actualizar");
			if(document.querySelector('#resumenNombre').validity.valid && document.querySelector('#resumenCantidadPlayer').validity.valid && document.querySelector('#resumenDescripcion').validity.valid){
				document.getElementById('resumenCreateTorneo').onsubmit = function() {
					var cantidadPlayer = $("#resumenCantidadPlayer").val();
					var descripcion = $("#resumenDescripcion").val();
					var nombre = $("#resumenNombre").val();
					var password = $("#resumenPassword").val();
					<g:remoteFunction controller="torneo" action="registracionTorneo"  params="\'cantidadPlayer=\' + cantidadPlayer +  \'&nombre=\' + nombre + \'&descripcion=\' + descripcion + \'&password=\' + password" update="registracionTorneo"/>
					document.getElementById("crearTorneo_div").style.display = "none";
				    return false;
				}
			}
		});

		function validarRegistracion(){
			var selects = $(".selectPlayer");
			for(var i=0; i<selects.length; i++){
				for(var j=0; j<selects.length; j++){
					if(i != j){
						if($(".selectPlayer")[i].value == $(".selectPlayer")[j].value && $(".selectPlayer")[i].value != 'null'){
							$(".selectPlayer")[i].setCustomValidity("Repetido");
							$(".selectPlayer")[j].setCustomValidity("Repetido");
							$(".errorRepetido")[i].style.display = "block";
							$(".errorRepetido")[j].style.display = "block";
							return false;
						}
					}
				
				$(".selectPlayer")[i].setCustomValidity("");
				$(".selectPlayer")[j].setCustomValidity("");
				$(".errorRepetido")[i].style.display = "none";
				$(".errorRepetido")[j].style.display = "none";
				}
			}
		}
		
		function checkInput(){
			var aux = false;
			var selects = $(".selectPlayer");
			for(var i=0; i<selects.length; i++){
				if(selects[i].validity.valid){
						aux = true;
					}else{
						aux = false;
						return;
					}
				}
				if(aux){
					waitingDialog.show('Cargando...', {dialogSize: 'sm', progressType: 'success'});
				}
			}
			
		</script>
	</body>
</html>
