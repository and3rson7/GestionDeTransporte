<%@ page import="java.util.LinkedList" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Consultar Unidades de Transporte</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-unidad.jspf" %>
  </head>
  
  <body>
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Consultar Unidades de Transporte</div>
              <div class="panel-body">
                  <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
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
          </div>
      </div>
      
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Operaciones</div>
              <div class="panel-body" style="text-align: center;">
                  <form class="form-inline" role="form" method="post" onsubmit="return confirm('�Est�s seguro que quieres realizar esta acci�n?');">
                      <label for="placa">Placa:</label>
                      <input type="text" name="placa" id="placa" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>

                      <input type="submit" value="Modificar Unidad >>" class="btn btn-warning" onclick="form.action='enviarUnidadServlet';">
                      <input type="submit" value="Eliminar Unidad" class="btn btn-danger" onclick="form.action='EliminarUnidadController';">
                  </form>
              </div>
          </div>
      </div>
  </body>
</html>