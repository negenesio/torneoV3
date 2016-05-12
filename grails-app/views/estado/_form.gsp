<%@ page import="com.torneo.fifa.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="estado.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${estadoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="estado.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${estadoInstance?.fecha}"  />

</div>

