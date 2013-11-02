<%@  page import="java.io.*,java.util.*"  language="java" contentType="text/html; charset=ISO-8859-1"
          pageEncoding="ISO-8859-1"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Consultar Unidades de Transporte</title>
        
        <%-- datatable --%>
        <%@ include file="WEB-INF/jspf/datatable-unidad.jspf" %>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>

    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <center>
        <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
            <strong>Consultar Unidades de Transporte</strong>
        </p>
        </center>
        
        <div class="container">
            <table id="mi_tabla">
                <thead>
                    <tr>
                        <th>Placa</th>
                        <th>N&ordm; Equipo</th>
                        <th>Clase</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Color</th>
                        <th>A&ntilde;o</th>
                        <th>Capacidad</th>
                        <th>Dominio</th>
                        <th>N&ordm; de motor</th>
                        <th>N&ordm; de chasis grabado</th>
                        <th>N&ordm; de chasis VIN</th>
                        <th>En Calidad</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        LinkedList<Unidad> lista = ConsultaUnidades.getUnidades();
                            for (int i = 0; i < lista.size(); i++) {
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getPlaca() + "</td>");
                                out.println("<td>" + lista.get(i).getNum_equipo() + "</td>");
                                out.println("<td>" + lista.get(i).getClase() + "</td>");

                                out.println("<td>" + lista.get(i).getMarca() + "</td>");
                                out.println("<td>" + lista.get(i).getModelo() + "</td>");

                                out.println("<td>" + lista.get(i).getColor() + "</td>");
                                out.println("<td>" + lista.get(i).getAnio() + "</td>");

                                out.println("<td>" + lista.get(i).getCapacidad() + "</td>");
                                out.println("<td>" + lista.get(i).getDominio() + "</td>");

                                out.println("<td>" + lista.get(i).getNum_motor() + "</td>");
                                out.println("<td>" + lista.get(i).getNum_chasis_grabado() + "</td>");
                                out.println("<td>" + lista.get(i).getNum_chasis_vin() + "</td>");
                                out.println("<td>" + lista.get(i).getEn_calidad() + "</td>");

                                out.println("<td>" + lista.get(i).getEstado() + "</td>");
                                out.println("</tr>");
                            }
                        %>
                </tbody>
            </table>
        </div>
        
        <center>
            <div class="well container" style="margin-top: 30px;">
                <form class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');">
                    <label for="placa">Placa:</label>
                    <input type="text" name="placa" id="placa" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>
                    
                    <input type="submit" value="Modificar Unidad >>" class="btn btn-warning" onclick="form.action='enviarUnidadServlet';">
                    <input type="submit" value="Eliminar Unidad" class="btn btn-danger" onclick="form.action='EliminarUnidadController';">
                </form>
            </div>
        </center>
    </body>
</html>