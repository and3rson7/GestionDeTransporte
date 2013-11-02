<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>  	

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Motorista</title>
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <link rel="stylesheet" href="estilos/table-style.css">
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
     <%
     String estado = "Eliminado";
     String user="root";
     String clave="";
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null;
    Statement Sentencias = null;
    ResultSet tabla = null;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
         tabla = Sentencias.executeQuery("Select * From motorista where estado != '"+estado+"'");

out.println("<html><center><h1>REGISTROS EXISTENTES </h1></center><BR><html>");
out.println("<TABLE Border=10 CellPadding=5 align=center><TR>");

out.println("<th bgcolor=White>LICENCIA</th><th bgcolor=White>NOMBRES</th><th bgcolor=White>APELLIDOS</th><th bgcolor=White>DUI</th><th bgcolor=White>TELEFONO</th>"
 + "<th bgcolor=White>DIRECCION</th><th bgcolor=White>SEXO</th><th bgcolor=White>FECHA DE REGISTRO</th><th bgcolor=White>ESTADO</th><th bgcolor=White>OPERACION</th> </TR>");

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

out.println("<TD>"+"<a href=EliminarCampo.jsp?licencia="+tabla.getString(1)+">"+"Eliminar"+"</a>"+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

%>
    </body>
</html>
