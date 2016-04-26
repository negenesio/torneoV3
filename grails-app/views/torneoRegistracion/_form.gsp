<%@ page import="com.torneo.fifa.TorneoRegistracion" %>



<div class="fieldcontain ${hasErrors(bean: torneoRegistracionInstance, field: 'cantidadRegistrados', 'error')} required">
	<label for="cantidadRegistrados">
		<g:message code="torneoRegistracion.cantidadRegistrados.label" default="Cantidad Registrados" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadRegistrados" type="number" value="${torneoRegistracionInstance.cantidadRegistrados}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: torneoRegistracionInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="torneoRegistracion.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${torneoRegistracionInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: torneoRegistracionInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="torneoRegistracion.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${torneoRegistracionInstance?.fechaCreacion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: torneoRegistracionInstance, field: 'players', 'error')} ">
	<label for="players">
		<g:message code="torneoRegistracion.players.label" default="Players" />
		
	</label>
	<g:select name="players" from="${com.torneo.fifa.Player.list()}" multiple="multiple" optionKey="id" size="5" value="${torneoRegistracionInstance?.players*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: torneoRegistracionInstance, field: 'torneo', 'error')} required">
	<label for="torneo">
		<g:message code="torneoRegistracion.torneo.label" default="Torneo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="torneo" name="torneo.id" from="${com.torneo.fifa.Torneo.list()}" optionKey="id" required="" value="${torneoRegistracionInstance?.torneo?.id}" class="many-to-one"/>

</div>

