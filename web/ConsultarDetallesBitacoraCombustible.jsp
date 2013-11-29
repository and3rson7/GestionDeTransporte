<%-- 
    Document   : ConsultarDetallesBitacoraCombustible
    Created on : 10-23-2013, 10:49:03 PM
    Author     : anderson
--%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.DetalleBitacoraCombustible" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.ConsultaDetallesBitacoraCombustible" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Detalle de Suministros de Combustible</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-detallebitacoracombustible.jspf" %>
    
  </head>
  <body>
    <div class="container">
        <div class="panel panel-info">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Detalle de Suministros de Combustible</div>
            <div class="panel-body">
                <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Correlativo</th>
                            <th>Vale</th>
                            <th>Placa</th>
                            <th>Nº Equipo</th>
                            <th>Motorista</th>
                            <th>Tipo Combustible</th>
                            <th>Precio Galón $</th>
                            <th>Total Galones</th>
                            <th>Valor Total $</th>
                            <th>Actividades</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            LinkedList<DetalleBitacoraCombustible> lista = ConsultaDetallesBitacoraCombustible.getDetallesBitacoraCombustible(request.getSession().getAttribute("correlativo").toString());
                            for (int i = 0; i < lista.size(); i++) {
                                out.println("<tr>");
                                out.println("<td>" + lista.get(i).getCorrelativo() + "</td>");
                                out.println("<td>" + lista.get(i).getVale() + "</td>");
                                out.println("<td>" + lista.get(i).getPlaca() + "</td>");
                                out.println("<td>" + lista.get(i).getNum_equipo() + "</td>");
                                out.println("<td>" + lista.get(i).getMotorista() + "</td>");
                                out.println("<td>" + lista.get(i).getTipo_combustible() + "</td>");
                                out.println("<td>" + lista.get(i).getPrecio_galon() + "</td>");
                                out.println("<td>" + lista.get(i).getTotal_galones() + "</td>");
                                out.println("<td>" + lista.get(i).getValor_total() + "</td>");
                                out.println("<td>" + lista.get(i).getActividades() + "</td>");
                                out.println("</tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="panel panel-info">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Operaciones</div>
            <div class="panel-body" style="text-align: center;">
                <form  class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');">
                    <label for="vale">Vale:</label>
                    <input type="text" name="vale" id="vale" class="form-control" maxlength="10"  style="width: 125px; margin-left: 20px; margin-right: 20px;" required>
                    <input type="submit" value="Eliminar" class="btn btn-danger" onclick="form.action='EliminarDetalleBitacoraCombustibleController';">
                </form>
            </div>
        </div>
    </div>
  </body>
</html>