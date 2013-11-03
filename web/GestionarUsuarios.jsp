<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Gestionar Usuarios</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <%
            String user = "root";
            String clave = "";
            String ruta = "jdbc:mysql://localhost:3306/gestiontransporte";

            Connection conexion = null;
            Statement Sentencias = null;
            ResultSet tabla = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conexion = DriverManager.getConnection(ruta, user, clave);
            Sentencias = conexion.createStatement();
            tabla = Sentencias.executeQuery("select * from login");

            out.println("<html><center><h1>Usuarios Registrados</h1></center><html>");
            out.println("<TABLE Border=10 CellPadding=5 align=center><TR>");

            out.println("<th bgcolor=White>NIVEL</th><th bgcolor=White>USUARIO</th><th bgcolor=White>NOMBRE</th>"
                    + "<th bgcolor=White>CONTRASEÑA</th><th bgcolor=White>Eliminar</th></TR>");

   
            // ciclo de lectura del resultset
            while (tabla.next()) {
                out.println("<TR>");
                out.println("<TD>" + tabla.getString(1) + "</TD>");
                out.println("<TD>" + tabla.getString(2) + "</TD>");
                out.println("<TD>" + tabla.getString(3) + "</TD>");
                out.println("<TD>" + tabla.getString(4) + "</TD>");
                out.println("<TD>" + "<a href=EliminarUsuario.jsp?cod=" + tabla.getString(4) + ">" + "Eliminar" + "</a>" + "</TD>");
                out.println("</TR>");
            }; // fin while
            out.println("</TABLE></CENTER></DIV> </HTML>");
        %>
    </body>
</html>