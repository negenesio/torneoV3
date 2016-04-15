<%@ page import="com.torneo.fifa.Torneo" %>



<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'cantidadPlayer', 'error')} required">
	<label for="cantidadPlayer">
		<g:message code="torneo.cantidadPlayer.label" default="Cantidad Player" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadPlayer" type="number" value="${torneoInstance.cantidadPlayer}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'descripcioon', 'error')} required">
	<label for="descripcioon">
		<g:message code="torneo.descripcioon.label" default="Descripcioon" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcioon" required="" value="${torneoInstance?.descripcioon}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'fechaCreacion', 'error')} required">
	<label for="fechaCreacion">
		<g:message code="torneo.fechaCreacion.label" default="Fecha Creacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCreacion" precision="day"  value="${torneoInstance?.fechaCreacion}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: torneoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="torneo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${torneoInstance?.nombre}"/>

</div>

