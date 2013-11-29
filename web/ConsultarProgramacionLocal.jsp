<%-- 
    Document   : ConsultarMotorista1
    Created on : 11-25-2013, 07:56:51 PM
    Author     : Elmer Arnoldo Menjivar Ramos
--%>

<%@ page import="java.util.LinkedList" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Consultar Programacion Local</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-programacionlocal.jspf" %>
  </head>
  
  <body>
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Consultar Programacion Local</div>
              <div class="panel-body">
                  <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                      <thead>
                          <tr>
                              <th>Correlativo</th>
                              <th>Motorista</th>
                              <th>Unidad</th>
                              <th>N° de Equipo</th>
                              <th>Actividad</th>
                              <th>Fecha de la Actividad</th>
                              <th>Hora de Inicio</th>
                              <th>Duracion Estimada</th>
                              <th>Unidad Asignada</th>
                              <th>Estado</th>
                          </tr>
                      </thead>
                      <tbody>
                          <%
                              LinkedList<ProgramacionLocal> lista = ConsultaProgramacionLocal.getProgramacion();
                              for (int i = 0; i < lista.size(); i++) {
                                  out.println("<tr>");
                                  out.println("<td>" + lista.get(i).getCorrelativo() + "</td>");
                                  out.println("<td>" + lista.get(i).getMotorista() + "</td>");
                                  out.println("<td>" + lista.get(i).getUnidad() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getNumequipo() + "</td>");
                                  out.println("<td>" + lista.get(i).getActividad() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getFechaactividad() + "</td>");
                                  out.println("<td>" + lista.get(i).getHorainicio() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getDuracionactividad() + "</td>");
                                  out.println("<td>" + lista.get(i).getUnidadrequerida() + "</td>");
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
                  <form class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');">
                      <label for="correlativo">Correlativo:</label>
                      <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>

                      <input type="submit" value="Modificar Programacion >>" class="btn btn-warning" onclick="form.action='enviarProgramacionLocalServlet';">
                      <input type="submit" value="Eliminar Programacion >>" class="btn btn-danger" onclick="form.action='EliminarMotoristaServlet';">
                  </form>
              </div>
          </div>
      </div>
      <%
        if(request.getSession().getAttribute("message") != null) {%>
            <script type="text/javascript">
                alert('<%=request.getSession().getAttribute("message")%>');
            </script>
            <% request.getSession().removeAttribute("message");
        }
    %>
  </body>
</html>