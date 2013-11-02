<%-- 
    Document   : BitacoraActividades
    Created on : 23-oct-2013, 10:39:38
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilo-registro-actividad.css">
        <script type="text/javascript" src="js/validarActividades.js"></script>        
        <title>Bitacora de Actividad</title>
</head>
<body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
    <br><br>    
		 
    <div class="RegistrarBitacora">
      <h1>Bitacora de Actividad</h1>
      <form method="post" action="GuardarBitacora.jsp">
          <strong>   
       <p>Número de Bitacora <input type="text" name="correlativo" maxlength="8" value="" placeholder="Correlativo" required></p>       
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mes
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" maxlength="10" name="mes" required value="" placeholder="Mes" onkeypress="return permite(event, 'carac')"></p>
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Año   
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="number" name="year" maxlength="4" min="2000" max="2100" required value="" placeholder="Año" onkeypress="return permite(event, 'num')"></p>
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Equipo 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
     tabla = Sentencias.executeQuery("Select * From unidad");
     %>
        <td><select name="equipo" >
        <option value=""></option> 
        <%
        while(tabla.next()){
        out.print("<option value='"+tabla.getString(2)+"'>"+tabla.getString(2)+"</option>");
        }                              
                 %> 
        </select></td>
            
       <p class="submit"><input type="submit" name="commit" value="Guardar Bitacora"></p>        
          </strong>
      </form>
    </div>     
</body>
</html>
