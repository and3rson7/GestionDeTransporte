<%-- 
    Document   : ConsultarBitacora
    Created on : 26-oct-2013, 22:46:08
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="WEB-INF/jspf/global-libs.jspf" %>
        <link rel="stylesheet" href="estilos/table-style.css">
        <title>Consultar Bitacoras</title>
    </head>
    <body>        
            <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
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
     %>
     
<center> <p style="font-size: 20px"><strong>CONSULTA DE BITACORAS</strong></p></center><br>     
<br>
<table align=center>
<TR><td bgcolor=#D8D8D8>NUMERO DE BITACORA</td>
    <td bgcolor=White>MES ABARCADO</td>
    <td bgcolor=#D8D8D8>AÑO</td>
    <td bgcolor=White>EQUIPO</td>
        
<%
while(tabla.next()) {

out.println("<TR>");

out.println("<TD><a href=ConsultaBitaEspecVM.jsp?correlativo="+tabla.getString(1)+">"+tabla.getString(1)+"</TD>");

out.println("<TD>"+tabla.getString(2)+"</TD>");

out.println("<TD>"+tabla.getString(3)+"</TD>");

out.println("<TD>"+tabla.getString(4)+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</Table>");
%>
</table>
      
    </body>
</html>
