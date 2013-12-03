<%-- 
    Document   : ConsultarBitacora
    Created on : 26-oct-2013, 22:46:08
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.ConsultaBitacorasCombustible" %>
<%@ page import="sv.edu.ues.dsi215.login.dominio.BitacoraCombustible" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="estilos/table-style.css">
        <script type="text/javascript" src="jquery-ui/js/jquery-ui-1.10.3.custom.js"></script>
        <link rel="stylesheet" href="jquery-ui/css/cupertino/jquery-ui-1.10.3.custom.css">
        <title>Consultar Bitacoras</title>
    </head>
    <body>        
            <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
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
     
<center> <p style="font-size: 20px"><strong>CONSULTA DE BITACORAS</strong></h1></center><br>     
<br>
<table align=center>
<TR><td bgcolor=#D8D8D8>NUMERO DE BITACORA</td>
    <td bgcolor=White>MES ABARCADO</td>
    <td bgcolor=#D8D8D8>AÑO</td>
    <td bgcolor=White>EQUIPO</td>
    <td bgcolor=#D8D8D8>Opciones</td>    
<%
while(tabla.next()) {

out.println("<TR>");

out.println("<TD><a href=ConsultaBitacoraEspecifica.jsp?correlativo="+tabla.getString(1)+">"+tabla.getString(1)+"</TD>");

out.println("<TD>"+tabla.getString(2)+"</TD>");

out.println("<TD>"+tabla.getString(3)+"</TD>");

out.println("<TD>"+tabla.getString(4)+"</TD>");

out.println("<TD>"+"<a href=ModificarBitacora.jsp?numero="+tabla.getString(1)+">"+"Modificar"+"</a>"+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</Table>");
%>
</table>


<br><br>
<div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Reporte de Actividades</div>
              <div class="panel-body" style="text-align: center;">
                  <form class="form-inline" role="form" method="post">
                      <label for="fecha_inicial">Fecha Incial:</label>
                      <input type="text" name="fecha_inicial" id="fecha_inicial" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" required />
                      
                      <label for="fecha_final" style="margin-left: 20px;">Fecha Final:</label>
                      <input type="text" name="fecha_final" id="fecha_final" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" required />

                      <input type="submit" style="margin-left: 20px;" value="Generar Reporte >>" class="btn btn-primary" onclick="form.action='EnviarFechasReporteGC';" />
                      <input type="submit" value="Generar Reporte Estadístico >>" class="btn btn-success" onclick="form.action='AgregarDetalleBitacoraCombustibleController';">
                  </form>
              </div>
          </div>
</div>
        <script>
        $(function() {
          $("#fecha_inicial").datepicker({
            showOn: "button",
            buttonImage: "jquery-ui/calendar.gif",
            buttonImageOnly: true,
          });
          
          $("#fecha_final").datepicker({
            showOn: "button",
            buttonImage: "jquery-ui/calendar.gif",
            buttonImageOnly: true,
          });
        });
        </script>
    </body>
</html>
