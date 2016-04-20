<%@ page import="com.torneo.fifa.Player" %>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="player.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" id="username" required="" value="${playerInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="player.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<input type="password" id="password" name="password" required="" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="player.password.label" default="Confirm Password" />
		<span class="required-indicator">*</span>
	</label>
	<input type="password" name="confirm_password" id="confirm_password" required="" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'accountExpired', 'error')}" style="display:none">
	<label for="accountExpired">
		<g:message code="player.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${playerInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'accountLocked', 'error')} " style="display:none">
	<label for="accountLocked">
		<g:message code="player.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${playerInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="player.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" id="nombre" required="" value="${playerInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="player.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" id="apellido" required="" value="${playerInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'enabled', 'error')} " style="display:none">
	<label for="enabled">
		<g:message code="player.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${playerInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'fechaCreacion', 'error')} required" style="display:none">
	<label for="fechaCreacion">
		<g:message code="player.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${playerInstance?.fechaCreacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="player.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<input type="email" name="email" id="email" required="" value="${playerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="player.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" id="fechaNacimiento" precision="day"  value="${playerInstance?.fechaNacimiento}"  required=""/> 
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'passwordExpired', 'error')} " style="display:none">
	<label for="passwordExpired">
		<g:message code="player.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${playerInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'codigoDesbloqueo', 'error')} required" style="display:none">
	<label for="codigoDesbloqueo">
		<g:message code="player.codigoDesbloqueo.label" default="Codigo Desbloqueo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoDesbloqueo" value="none" />
</div>

<script>
function checkInput(){
	if(document.querySelector('#username').validity.valid && document.querySelector('#password').validity.valid && document.querySelector('#confirm_password').validity.valid && document.querySelector('#nombre').validity.valid && document.querySelector('#apellido').validity.valid && $("#fechaNacimiento").val() != ""){
		waitingDialog.show('Cargando...', {dialogSize: 'sm', progressType: 'success'});
	}
}

var password = document.getElementById("password");
var confirm_password = document.getElementById("confirm_password");

function validatePassword(){
if(password.value != confirm_password.value) {
  confirm_password.setCustomValidity("Las contraseñas no coinciden.");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>

