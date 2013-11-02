<%-- 
    Document   : ConsultarBitacorasCombustible
    Created on : 10-23-2013, 08:47:01 PM
    Author     : anderson
--%>

<%@page import="sv.edu.ues.dsi215.login.dominio.ConsultaBitacorasCombustible"%>
<%@page import="sv.edu.ues.dsi215.login.dominio.BitacoraCombustible"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1.0">
        <title>Consultar Bitacoras de Combustible</title>
        
        <%-- datatable --%>
        <%@ include file="WEB-INF/jspf/datatable-bitacoracombustible.jspf" %>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <center>
        <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
            <strong>Consultar Bitacoras de Combustible</strong>
        </p>
        </center>
    
        <div class="container">
            <table id="mi_tabla">
                <thead>
                    <tr>
                        <th>Correlativo</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Gasolinera</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        LinkedList<BitacoraCombustible> lista = ConsultaBitacorasCombustible.getBitacorasCombustible();
                            for (int i = 0; i < lista.size(); i++) {
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getCorrelativo() + "</td>");
                                out.println("<td>" + lista.get(i).getFecha() + "</td>");
                                out.println("<td>" + lista.get(i).getHora() + "</td>");
                                out.println("<td>" + lista.get(i).getGasolinera() + "</td>");
                                out.println("</tr>");
                            }
                        %>
                </tbody>
            </table>
        </div>
    
        <div class="well container" style="margin-top: 30px;">
            <center>
                <form class="form-inline" role="form" method="post">
                    <label for="correlativo">Correlativo:</label>
                    <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required />
                    
                    <input type="submit" value="Detalles >>" class="btn btn-primary" onclick="form.action='enviarCorrelativoDetalleBC';" />
                    <input type="submit" value="Agregar Detalles >>" class="btn btn-success" onclick="form.action='AgregarDetalleBitacoraCombustibleController';">
                    <input type="submit" value="Modificar Bitacora >>" class="btn btn-warning" onclick="form.action='EnviarBitacoraCombustible';" />
                </form>
            </center>
        </div>
    </body>
</html>