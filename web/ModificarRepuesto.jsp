<%-- 
    Document   : InsertarRepeuesto
    Created on : 10-20-2013, 08:00:37 PM
    Author     : VICTOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="WEB-INF/jspf/menu-jefe de taller.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificando Registro</title>    
        <script type="text/javascript" src="Mascaras.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        
</head>

<body >
<div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registro de Actividades</div>
            <div class="panel-body">
                <form name="Registrar" class="form-horizontal" method="post" action="UpdateRepuesto.jsp">
                    
                   
       
<%

String user="root";
String clave="";
String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
Connection conexion=null;
Statement Sentencias = null;
ResultSet tablaREsultado = null;
String nolectura="readonly";
String lectura1=" ";
String lectura2=" ";
 int idunidad =Integer.parseInt(request.getParameter("idunidad"));
 
 Class.forName("com.mysql.jdbc.Driver").newInstance();
       
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        tablaREsultado = Sentencias.executeQuery("Select * From filtro Where Equipo="+idunidad);
        
        //hacemos esa consulta con filtro a la base de datos
         while(tablaREsultado.next())//soltamos los registros y combinamos el html con jsp objetos
             //con el value
            {
           if(tablaREsultado.getString("Gasolina").isEmpty()){
           lectura1="readonly";
           }
         
           else
               if(tablaREsultado.getString("Diesel").isEmpty()){
                   lectura2="readonly";
               }
           
                
             %>
<p>&nbsp;</p>
        
            <form method="post" action="UpdateRepuesto.jsp">

                <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Equipo</label>
                        <div class="col-lg-4">
                          <h2>Mantenimiento de Unidad: <%=idunidad%></h2>
                        </div>
                    </div>
                       
         <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Equipo</label>
                        <div class="col-lg-4">
                         <input type="text" name="idunidad" <%=nolectura%> value=<% out.println(tablaREsultado.getString(1));%>>  
                        </div>
                    </div>
                   
      
         <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Filtro Aceite</label>
                        <div class="col-lg-4">
                        <input type="text" name="Aceite"  value="<% out.println(tablaREsultado.getString(2));%>">
                        </div>
                    </div>
       
      
          <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Filtro Gasolina</label>
                        <div class="col-lg-4">
                         <input type="text" name="Gasolina"  <%=lectura1%> value="<% out.println(tablaREsultado.getString(3));%>">
                        </div>
                    </div>
       
        
         <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Filtro Diesel</label>
                        <div class="col-lg-4">
                         <input type="text" autocomplete="on" name="Diesel"  <%=lectura2%> value="<% out.println(tablaREsultado.getString(4));%>">
                        </div>
                    </div>
       <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Aceite Suministrad</label>
                        <div class="col-lg-4">
                          <input type="text" name="Codigo_Aceite"  value="<% out.println(tablaREsultado.getString(5));%>">
                        </div>
                    </div>
         
           <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Estado</label>
                        <div class="col-lg-4">
                         <select name="Estado">
                 <option value="Disponible">Disponible</option>
                 <option value="No Disponible">No Disponible</option>
              </select>
                        </div>
                    </div>
                     
    
          <%
            }
        tablaREsultado.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>
          
        
           <div class="form-group">
                        <label for="observaciones" class="col-lg-4 control-label">Observaciones:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="observaciones" id="observaciones" maxlength="120" 
                                   placeholder="Observaciones" onkeypress="return permite(event, 'num_car')" />
                        </div>
                    </div>
                    <center>
                        <input type="submit" class="btn btn-success" value="Guardar Cambios" />
                    </center>
                </form>
            </div>
        </div>
    </div>            
      
    </body>
</html>
