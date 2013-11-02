<%-- 
    Document   : RegistrarActividades
    Created on : 02-oct-2013, 22:33:38
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilo-registro-actividad.css">
        <script type="text/javascript" src="js/validarActividades.js"></script>        
        <title>Registrar Bitacora de Actividades</title> 
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">           
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <center> <p style="font-size:25px "><strong>Registro de Actividades de Motoristas</strong></p> </center>
    
<%--  <div class="fondo1">	--%>
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
     tabla = Sentencias.executeQuery("SELECT correlativo FROM bitacoraactividades");     
     %>
<br><br>
    <div class="Registrar">
      <h1>Registrar Actividad</h1>
      <form method="post" action="RegistrarAct.jsp">
       <p>Codigo de la Actividad <input type="text01" name="numero" maxlength="8" value="${correlativo}" placeholder="Codigo Actividad" 
                                       onkeypress="return permite(event, 'caracteres')" required>
       </p>       
       <p>Fecha  
         <input type="date" name="fecha" required value="" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Correlativo &nbsp;&nbsp;&nbsp;&nbsp;
            <select id="Field1" name="correlativo" required>
            <option value=""></option> 
            <%
            while(tabla.next()){
            out.print("<option value='"+tabla.getString(1)+"'>"+tabla.getString(1)+"</option>");
            }                              
                     %> 
            </select>
       </p>
       <p>Hora de Salida <input type="time" name="horasalida" required value="" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Hora de Retorno &nbsp;&nbsp;<input type="time" name="horaretorno" required value="" >
       </p>
       
       <p>Km de salida <input type="number" min="0" name="kmsalida" required placeholder="Km de salida" onkeypress="return permite(event, 'num')">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Km de retorno <input type="number" min="0" name="kmretorno" required placeholder="Km de retorno" onkeypress="return permite(event, 'num')">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Km utilizados <input type="number" name="kmutilizados" required min="0" placeholder="Kmutilizados" onkeypress="return permite(event, 'num')"</p>
          
       <p>Objetivo de la Mision
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Lugar <br>
          <input type="text" name="objetivo" maxlength="100" value="" placeholder="Objetivo de la mision" 
                                onkeypress="return permite(event, 'num_car')" required>
          &nbsp;&nbsp;&nbsp;
         <input type="text" name="lugar" maxlength="50" required value="" 
                                placeholder="Lugar de la mision" onKeyPress="return permite(event, 'num_car')" >
       </p>
     <%
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     conexion =DriverManager.getConnection(ruta,user,clave);
     Sentencias = conexion.createStatement();
     tabla = Sentencias.executeQuery("Select * From solicitudtransporte");
     %>
       <p>Codigo de la solicitud
            <select id="Field1" name="solicitud" required>
            <option value=""></option> 
            <%
            while(tabla.next()){
            out.print("<option value='"+tabla.getString(1)+"'>"+tabla.getString(1)+"</option>");
            }                              
                     %> 
            </select>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <%
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     conexion =DriverManager.getConnection(ruta,user,clave);
     Sentencias = conexion.createStatement();
     tabla = Sentencias.executeQuery("Select * From motorista");
     %>
       Nombre del Motorista
       <select id="Field2" name="motorista" required>
            <option value=""></option> 
            <%
            while(tabla.next()){
            out.print("<option value='"+tabla.getString(3)+"'>"+tabla.getString(3)+"</option>");
            }                              
                     %> 
            </select>
       </p>
       <p>Obsevaciones <input type="text" name="observaciones" maxlength="120"></p>
       <p class="submit"><input type="submit" name="commit" value="Guardar Actividad"></p>        
      </form>
    </div>    
  
<%-- </div> --%>
</body>
    
</html>