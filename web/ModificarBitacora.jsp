<%-- 
    Document   : ModificarBitacora
    Created on : 29-oct-2013, 23:31:36
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilo-registro-actividad.css">
        <script type="text/javascript" src="js/validarActividades.js"></script>
        <title>Modificar Bitacora</title>
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
        tablaResultado = Sentencias.executeQuery("Select * From bitacoraactividades Where correlativo='"+codigo+"'");
        //hacemos esa consulta con filtro a la base de datos
         while(tablaResultado.next())//soltamos los registros y combinamos el html con jsp objetos
             //con el value
         {
%>
<center><strong><p style="font-size: 25px">Editando Bitacora: <%= request.getParameter("numero")%></p></strong></center>
<br>
<div class="RegistrarBitacora">
      <h1>Bitacora de Actividad</h1>
      <form method="post" action="ActualizarBitacora.jsp">
          <strong>   
       <p>Número de Bitacora <input type="text" name="correlativo" maxlength="8" readonly
                                    value="<% out.println(tablaResultado.getString(1));%>" placeholder="Correlativo" required></p>       
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mes
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <select name="mes" required>
                    <option value="">Seleccionar mes</option>
                    <option value="Enero" >Enero</option>
                    <option value="Febrero">Febrero</option>
                    <option value="Marzo">Marzo</option>
                    <option value="Abril">Abril</option>
                    <option value="Mayo">Mayo</option>
                    <option value="Junio">Junio</option>
                    <option value="Julio">Julio</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Septiembre">Septiembre</option>
                    <option value="Octubre">Octubre</option>
                    <option value="Noviembre">Noviembre</option>
                    <option value="Diciembre">Diciembre</option>
           </select></p>
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Año   
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="number" name="year" maxlength="4" min="2000" max="2100" required value="<% out.println(tablaResultado.getString(3));%>" 
                  placeholder="Año" onkeypress="return permite(event, 'num')"></p>
       <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Equipo 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
    }
    tablaResultado.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>
    <%     
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
