<%-- 
    Document   : ConsultarDetallesBitacoraCombustible
    Created on : 10-23-2013, 10:49:03 PM
    Author     : anderson
--%>

<%@page import="sv.edu.ues.dsi215.login.dominio.DetalleBitacoraCombustible"%>
<%@page import="java.util.LinkedList"%>
<%@page import="sv.edu.ues.dsi215.login.dominio.ConsultaDetallesBitacoraCombustible"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles de Bitacora de Combustible</title>
        
        <%-- datatable --%>
        <%@ include file="WEB-INF/jspf/datatable-detallebitacoracombustible.jspf" %>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
        
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <center>
        <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
            <strong>Detalles de Bitacora de Combustible</strong>
        </p>
        </center>
    
        <div class="container">
            <table id="mi_tabla">
                <thead>
                    <tr>
                        <th>Vale</th>
                        <th>Placa</th>
                        <th>Nº Equipo</th>
                        <th>Motorista</th>
                        <th>Tipo Combustible</th>
                        <th>Precio Galón $</th>
                        <th>Total Galones</th>
                        <th>Valor Total $</th>
                        <th>Actividades</th>
                        <th>Correlativo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        LinkedList<DetalleBitacoraCombustible> lista = ConsultaDetallesBitacoraCombustible.getDetallesBitacoraCombustible(request.getSession().getAttribute("correlativo").toString());
                            for (int i = 0; i < lista.size(); i++) {
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getVale() + "</td>");
                                out.println("<td>" + lista.get(i).getPlaca() + "</td>");
                                out.println("<td>" + lista.get(i).getNum_equipo() + "</td>");
                                out.println("<td>" + lista.get(i).getMotorista() + "</td>");
                                out.println("<td>" + lista.get(i).getTipo_combustible() + "</td>");
                                out.println("<td>" + lista.get(i).getPrecio_galon() + "</td>");
                                out.println("<td>" + lista.get(i).getTotal_galones() + "</td>");
                                out.println("<td>" + lista.get(i).getValor_total() + "</td>");
                                out.println("<td>" + lista.get(i).getActividades() + "</td>");
                                out.println("<td>" + lista.get(i).getCorrelativo() + "</td>");
                                out.println("</tr>");
                            }
                        %>
                </tbody>
            </table>
        </div>
        <center>
            <div class="well container" style="margin-top: 30px;">
                <form  class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');">
                    <label for="vale">Vale:</label>
                    <input type="text" name="vale" id="vale" class="form-control" maxlength="10"  style="width: 125px; margin-left: 20px; margin-right: 20px;" required>
                    
                    <%-- <input type="submit" value="Modificar >>" class="btn btn-warning" onclick="form.action='';" style="margin-left: 20px;"> --%>
                    <input type="submit" value="Eliminar" class="btn btn-danger" onclick="form.action='EliminarDetalleBitacoraCombustibleController';">
                </form>
            </div>
        </center>             
    </body>
</html>