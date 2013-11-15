<%@ page import="java.util.LinkedList" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.ConsultaUsuarios" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.Usuario" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Gestión de Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%@ include file="WEB-INF/jspf/datatable-usuario.jspf" %>
  </head>
  <body>
    
    <div class="container">
        <div class="panel panel-info">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Gestión de Usuarios</div>
            <div class="panel-body">
            
            <!-- Table -->
            <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Nivel</th>
                        <th>Usuario</th>
                        <th>Nombre</th>
                        <th>Contraseña</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        LinkedList<Usuario> lista = ConsultaUsuarios.getUsuarios();
                        for (int i = 0; i < lista.size(); i++) {
                            out.println("<tr>");
                            out.println("<td>" + lista.get(i).getNivel() + "</td>");
                            out.println("<td>" + lista.get(i).getUsuario() + "</td>");
                            out.println("<td>" + lista.get(i).getNombre() + "</td>");
                            out.println("<td>" + lista.get(i).getContraseña() + "</td>");
                            out.println("<td>" + "<a href=EliminarUsuario.jsp?cod=" + lista.get(i).getContraseña() + ">" + "Eliminar" + "</a>" + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div></div>
    </div>
    
  </body>
</html>