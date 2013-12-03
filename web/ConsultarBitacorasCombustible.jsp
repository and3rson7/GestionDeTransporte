<%-- 
    Document   : ConsultarBitacorasCombustible
    Created on : 10-23-2013, 08:47:01 PM
    Author     : anderson
--%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.ConsultaBitacorasCombustible" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.BitacoraCombustible" %>
<%@ page import="java.util.LinkedList" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Consultar Bitácoras de Combustible</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-bitacoracombustible.jspf" %>
    
    <script type="text/javascript" src="jquery-ui/js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="jquery-ui/css/cupertino/jquery-ui-1.10.3.custom.css">
  </head>
  <body>
    <div class="container">
        <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Consultar Bitácoras de Combustible</div>
              <div class="panel-body">
                  <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
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
        </div>
    </div>
                      
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Operaciones</div>
              <div class="panel-body" style="text-align: center;">
                  <form class="form-inline" role="form" method="post">
                      <label for="correlativo">Correlativo:</label>
                      <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required />

                      <input type="submit" value="Detalles >>" class="btn btn-primary" onclick="form.action='enviarCorrelativoDetalleBC';" />
                      <input type="submit" value="Agregar Suministro >>" class="btn btn-success" onclick="form.action='AgregarDetalleBitacoraCombustibleController';">
                      <input type="submit" value="Modificar Bitacora >>" class="btn btn-warning" onclick="form.action='EnviarBitacoraCombustible';" />
                  </form>
              </div>
          </div>
      </div>
      <% if(request.getSession().getAttribute("rol").equals("Administrador")){ %>
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Reporte de Gastos de Combustible</div>
              <div class="panel-body" style="text-align: center;">
                  <form class="form-inline" role="form" method="post">
                      <label for="fecha_inicial">Fecha Incial:</label>
                      <input type="text" name="fecha_inicial" id="fecha_inicial" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" required />
                      
                      <label for="fecha_final" style="margin-left: 20px;">Fecha Final:</label>
                      <input type="text" name="fecha_final" id="fecha_final" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" required />

                      <input type="submit" style="margin-left: 20px;" value="Generar Reporte >>" class="btn btn-primary" onclick="form.action='EnviarFechasReporteGC';" />
                  </form>
              </div>
          </div>
      </div>
      <script>
        $(function() {
          $("#fecha_inicial").datepicker({
            showOn: "button",
            buttonImage: "jquery-ui/calendar.gif",
            buttonImageOnly: true,
          });
          
          $("#fecha_final").datepicker({
            showOn: "button",
            buttonImage: "jquery-ui/calendar.gif",
            buttonImageOnly: true,
          });
        });
    </script>
    <% } %>
  </body>
</html>