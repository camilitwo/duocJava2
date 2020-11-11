<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<script language="JavaScript" type="text/JavaScript">

	function volver(){
		document.GestionBicicletaForm.action = "/Mobike/GestionBicicleta.do?do=prueba";
		document.GestionBicicletaForm.submit();
	}
	
	
	function actualizarEstado(id, estado){
		document.GestionBicicletaForm.action = "/Mobike/GestionBicicleta.do?do=actualizarEstado&id="+id+"&estado="+estado;
		document.GestionBicicletaForm.submit();
	}
</script>


<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mobike</title>
</head>
<body>
<html:form action="/GestionBicicleta" enctype="multipart/form-data" method="post">
	
	<table class="table table-striped" style=" width: 50%; overflow: auto;" align="center">
		<thead>
			<tr align="center">
				<th  scope="col"><bean:message key="gestionBicicleta.detalle.numeroBicicleta"/></th>
				<th  scope="col"><bean:message key="gestionBicicleta.detalle.estado"/></th>
				<th  scope="col">
			</tr>
		</thead>
		<logic:iterate name="listaBicicletas" id="indice">
			<tr>
				<th scope="row">
					<bean:write name="indice" property="idBicicleta"/>
				</th>
				<td>
					<bean:write name="indice" property="estado"/>
				</td>
				<logic:equal name="indice" property="estado" value="BLOQUEADO">
					<td>
						<input type="button" value="Desbloquear" 
						onclick='javascript:actualizarEstado("<bean:write name='indice' property='idBicicleta'/>", 
						"<bean:write name='indice' property='estado'/>");return false;'>
					</td>
				</logic:equal>
				<logic:equal name="indice" property="estado" value="DESBLOQUEADO">
					<td>
						<input type="button" value="Bloquear" 
						onclick='javascript:actualizarEstado("<bean:write name='indice' property='idBicicleta'/>", 
						"<bean:write name='indice' property='estado'/>");return false;'>
					</td>
				</logic:equal>
			</tr>
		</logic:iterate>
	</table>
</html:form>
</body>
</html:html>