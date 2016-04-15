<%@ page import="com.torneo.fifa.Player" %>



<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="player.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${playerInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="player.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${playerInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="player.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${playerInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="player.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${playerInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="player.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${playerInstance?.apellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="player.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${playerInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="player.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${playerInstance?.fechaCreacion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="player.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${playerInstance?.fechaNacimiento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="player.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${playerInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playerInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="player.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${playerInstance?.passwordExpired}" />

</div>

