<%-- 
    Document   : ConsultaBitacoraEspecifica
    Created on : 26-oct-2013, 23:11:59
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/table-style.css">
        <title>Consultar Actividades</title>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">        
         <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
         <%     
String codigo= request.getParameter("correlativo");//capturamos el valor
String user="root";
String clave="";
String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
Connection conexion=null;
Statement Sentencias = null;
ResultSet tabla = null;

 Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        tabla = Sentencias.executeQuery("Select * From detallebitacoraactividades Where correlativo='"+codigo+"'");
        //hacemos esa consulta con filtro a la base de datos
                    
     %>
     <p style="margin-left: 120px; font-size:20px"><strong> Actividades de Bitacora: 
             <%= request.getParameter("correlativo")%></strong></p><br>
<table align=center>
<TR><td bgcolor=#D8D8D8>CODIGO</td>
    <td bgcolor=White>FECHA</td>
    <td bgcolor=#D8D8D8>HORA DE SALIDA</td>
    <td bgcolor=White>KM SALIDA</td>
    <td bgcolor=#D8D8D8>OBJETIVO DE LA MISION</td>
    <td bgcolor=White>LUGAR</td>
    <td bgcolor=#D8D8D8>HORA DE RETORNO</td>
    <td bgcolor=White>KM DE RETORNO</td>
    <td bgcolor=#D8D8D8>KM UTILIZADOS</td>
    <td bgcolor=White>MOTORISTA</td>
    <td bgcolor=#D8D8D8>SOLICITUD</td>
    <td bgcolor=White>OBSERVACIONES</td>

<%
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

out.println("<TD>"+tabla.getString(12)+"</TD>");

out.println("<TD>"+tabla.getString(13)+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</Table>");

%>

</table>
      
    </body>
</html>

