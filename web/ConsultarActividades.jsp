<%-- 
    Document   : ConsultarActividades
    Created on : 04-oct-2013, 16:11:00
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/table-style.css">
        <title>Consultar Actividades</title>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">        
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <center><p style="font-size: 20px"><strong>CONSULTA A ACTIVIDADES</strong></center><br>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
     <%

     String user="root";
     String clave="";
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null;
    Statement Sentencias = null;
    ResultSet tabla = null;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
         tabla = Sentencias.executeQuery("Select * From bitacoraactividades");

out.println("<TABLE Border=10 CellPadding=5 align=center>");

out.println("<TR><th bgcolor=gray>CODIGO</th><th bgcolor=White>FECHA</th><th bgcolor=White>HORA DE SALIDA</th><th bgcolor=White>HORA DE RETORNO</th>"+
        "<th bgcolor=White>OBJETIVO DE LA MISION</th><th bgcolor=White>LUGAR</th><th bgcolor=White>NOMBRE DEL SOLICITANTE</th><th bgcolor=White>MOTORISTA</th></TR>");

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

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

%>
    </body>
</html>
