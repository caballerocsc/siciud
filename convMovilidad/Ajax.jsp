<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>

	function borrar_combo(combo){
		for(var i = combo.length - 1; i >= 0; i--) {
			if(navigator.appName == "Netscape")
				combo.options[i] = null;
			else
				combo.remove(i);
		}
		combo.options[0] = new Option("--------------","0");
	}
	borrar_combo(parent.document.nuevo.proyectoinv);
 
  	<c:forEach begin="0" items="${sessionScope.ajaxProyectos}" var="proyectos" varStatus="st">
  		<c:if test="${sessionScope.movilidad.proyectoinv!=proyectos.idActividad}">
			parent.document.nuevo.proyectoinv.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${proyectos.actividad}"/>', '<c:out value="${proyectos.idActividad}"/>');
		</c:if>
		<c:if test="${sessionScope.movilidad.proyectoinv==proyectos.idActividad}">
			parent.document.nuevo.proyectoinv.options[<c:out value="${st.count}"/>] = new Option('<c:out value="${proyectos.actividad}"/>', '<c:out value="${proyectos.idActividad}"/>','selected');
		</c:if>
	</c:forEach>
</script>