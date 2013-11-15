<%@ page import="sv.edu.ues.dsi215.login.dominio.Constantes" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Gestión de Transporte</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
  </head>
  <body>
    
    <%
        Connection conexion = null;
        Statement Sentencias = null;

        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion = DriverManager.getConnection(Constantes.pUrl, Constantes.pUser, Constantes.pPassword);
        Sentencias = conexion.createStatement();

        String codigo = request.getParameter("cod"); //capturamos el valor del codigo
        Sentencias = conexion.createStatement();
        String consulta2 = "DELETE FROM login WHERE contraseña='" + codigo + "'";
        
        //y borramos filtrando con el codigo a borrar
        int resultado = Sentencias.executeUpdate(consulta2);
        pageContext.include("GestionarUsuarios.jsp");
        if (resultado == 1) {
            out.println("<script>alert('Se eliminó el usuario correctamente')</script>");
            out.println("<meta http-equiv='refresh' content='0;url=GestionarUsuarios.jsp'");
        }
    %>
    
  </body>
</html>