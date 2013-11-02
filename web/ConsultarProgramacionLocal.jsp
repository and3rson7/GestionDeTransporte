<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Programacion Local</title>
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <link rel="stylesheet" href="estilos/table-style.css">
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
     <%
     String estado = "Programada";
     String user="root";
     String clave="";
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null;
    Statement Sentencias = null;
    ResultSet tabla = null;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
         tabla = Sentencias.executeQuery("Select * From programacionlocal where estado = '"+estado+"'");

out.println("<html><center><h1>REGISTROS EXISTENTES </h1></center><br><html>");
out.println("<TABLE Border=10 CellPadding=5 align=center><TR>");

out.println("<th bgcolor=White>CORRELATIVO</th><th bgcolor=White>MOTORISTA</th><th bgcolor=White>UNIDAD ASIGNADA</th>"+
        "<th bgcolor=White>NUMERO DE EQUIPO</th><th bgcolor=White>ACTIVIDAD</th>"
 + "<th bgcolor=White>FECHA DE LA ACTIVIDAD</th><th bgcolor=White>DURACION</th><th bgcolor=White>UNIDAD REQUERIDA</th><th bgcolor=White>ESTADO</th><th bgcolor=White>FECHA DE REGISTRO</th></TR>");

// ciclo de lectura del resultset

while(tabla.next()) {

out.println("<TR>");

out.println("<TD>"+tabla.getString(1)+"</TD>");

out.println("<TD>"+tabla.getString(2)+"</TD>");

out.println("<TD>"+tabla.getString(3)+"</TD>");

out.println("<TD>"+tabla.getString(4)+"</TD>");

out.println("<TD>"+tabla.getString(5)+"</TD>");

out.println("<TD>"+tabla.getString(6)+"</TD>");

out.println("<TD>"+tabla.getString(7)+"</TD>");

out.println("<TD>"+tabla.getString(8)+"</TD>");

out.println("<TD>"+tabla.getString(9)+"</TD>");

out.println("<TD>"+tabla.getString(10)+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

%>
    </body>
</html>
