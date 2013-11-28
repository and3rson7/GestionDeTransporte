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
    <title>Consultar Registros De Motoristas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-motorista.jspf" %>
  </head>
  
  <body>
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Consultar Registros De Motoristas</div>
              <div class="panel-body">
                  <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                      <thead>
                          <tr>
                              <th>N° de Licencia</th>
                              <th>Nombres</th>
                              <th>Apellidos</th>
                              <th>N° de DUI</th>
                              <th>Telefono</th>
                              <th>Direccion</th>
                              <th>Sexo</th>
                              <th>Fecha de Registro</th>
                              <th>Estado Actual</th>
                          </tr>
                      </thead>
                      <tbody>
                          <%
                              LinkedList<Motorista> lista = ConsultaMotorista.getMotorista();
                              for (int i = 0; i < lista.size(); i++) {
                                  out.println("<tr>");
                                  out.println("<td>" + lista.get(i).getLicencia() + "</td>");
                                  out.println("<td>" + lista.get(i).getNombres() + "</td>");
                                  out.println("<td>" + lista.get(i).getApellidos() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getDui() + "</td>");
                                  out.println("<td>" + lista.get(i).getTelefono() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getDireccion() + "</td>");
                                  out.println("<td>" + lista.get(i).getSexo() + "</td>");
                                  
                                  out.println("<td>" + lista.get(i).getFecha() + "</td>");
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
                      <label for="licencia">Licencia:</label>
                      <input type="text" name="licencia" id="licencia" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>

                      <input type="submit" value="Modificar Motorista >>" class="btn btn-warning" onclick="form.action='enviarMotoristaServlet';">
                      <input type="submit" value="Eliminar Motorista >>" class="btn btn-danger" onclick="form.action='EliminarMotoristaServlet';">
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