<%-- 
    Document   : ModificarActividad
    Created on : 13-oct-2013, 0:39:38
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilo-registro-actividad.css">
        <script type="text/javascript" src="js/validarActividades.js"></script>
        <title>Actualizar bitacora Actividades</title>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
<%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
     <%
String codigo= request.getParameter("numero");//capturamos el valor
String user="root";
String clave="";
String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
Connection conexion=null;
Statement Sentencias = null;
ResultSet tablaResultado = null;

 Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        tablaResultado = Sentencias.executeQuery("Select * From detallebitacoraactividades Where numero='"+codigo+"'");
        //hacemos esa consulta con filtro a la base de datos
         while(tablaResultado.next())//soltamos los registros y combinamos el html con jsp objetos
             //con el value
            {
             %>
    <center><strong><p style="font-size: 25px">Editando Actividad: <%= request.getParameter("numero")%></p></strong></center>             

<br><br>
    <div class="Registrar">
      <h1>Actualizar Actividad</h1>
      <form method="post" action="ActualizarAct.jsp">
       <p>Numero de Actividad <input type="text01" name="numero" maxlength="8" value="<% out.println(tablaResultado.getString(1));%>" 
                                     readonly placeholder="Codigo Actividad" onkeypress="return permite(event, 'caracteres')" required>
       </p>       
       <p>Fecha  
         <input type="date" name="fecha" required value="" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Correlativo 
         <input type="text01" name="correlativo" maxlength="8" required placeholder="Correlativo" 
                value="<% out.println(tablaResultado.getString(12));%>" readonly>
       </p>
       <p>Hora de Salida <input type="time" name="horasalida" required value="" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Hora de Retorno <input type="time" name="horaretorno" required value="" >
       </p>
       
       <p>Km de salida <input type="number" min="0" name="kmsalida" required placeholder="Km de salida" 
                             onkeypress="return permite(event, 'num')">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Km de retorno <input type="number" min="0" name="kmretorno" required placeholder="Km de retorno"
                               onkeypress="return permite(event, 'num')">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Km utilizados <input type="number" name="kmutilizados" required min="0" placeholder="Kmutilizados" 
                               onkeypress="return permite(event, 'num')"> </p>
       <p>Objetivo de la Mision
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          Lugar <br>
          <input type="text" name="objetivo" maxlength="100" value="<% out.println(tablaResultado.getString(5));%>" 
                 placeholder="Objetivo de la mision" onkeypress="return permite(event, 'num_car')" required>
          &nbsp;&nbsp;&nbsp;
         <input type="text" name="lugar" maxlength="50" required value="<% out.println(tablaResultado.getString(6));%>" 
                                placeholder="Lugar de la mision" onKeyPress="return permite(event, 'num_car')" >
       </p>
       <%
     Class.forName("com.mysql.jdbc.Driver").newInstance();
     conexion =DriverManager.getConnection(ruta,user,clave);
     Sentencias = conexion.createStatement();
     ResultSet tabla = Sentencias.executeQuery("Select * From solicitudtransporte");
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
           
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
       <p>Obsevaciones <input type="text" name="observaciones" maxlength="120" value="<% out.println(tablaResultado.getString(13));%>">
       </p>
       
       <p class="submit"><input type="submit" name="commit" value="Guardar Actividad"></p>        
      </form>
    </div>
<%
    }
    tablaResultado.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>
    </body>
</html>
