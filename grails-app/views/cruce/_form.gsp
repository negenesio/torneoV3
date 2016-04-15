<%@ page import="com.torneo.fifa.Cruce" %>



<div class="fieldcontain ${hasErrors(bean: cruceInstance, field: 'equipoA', 'error')} required">
	<label for="equipoA">
		<g:message code="cruce.equipoA.label" default="Equipo A" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoA" name="equipoA.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${cruceInstance?.equipoA?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cruceInstance, field: 'equipoB', 'error')} required">
	<label for="equipoB">
		<g:message code="cruce.equipoB.label" default="Equipo B" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="equipoB" name="equipoB.id" from="${com.torneo.fifa.Player.list()}" optionKey="id" required="" value="${cruceInstance?.equipoB?.id}" class="many-to-one"/>

</div>

