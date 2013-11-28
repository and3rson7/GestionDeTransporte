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
        <script type="text/javascript" src="js/validarActividades.js"></script>        
        <title>Registrar Bitacora de Actividades</title>
        
        <script> 
        function restar(){ 
        <!-- Resta --> 
        n1 = parseInt(Registrar.kmretorno.value); 
        n2 = parseInt(Registrar.kmsalida.value); 
        Registrar.kmutilizados.value=n1-n2;
        } 
        </script>
    </head>
    <body>           
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registro de Actividades</div>
            <div class="panel-body">
                <form name="Registrar" class="form-horizontal" method="post" action="RegistrarAct.jsp">
                    
                    <div class="form-group">
                        <label for="numero" class="col-lg-4 control-label">Codigo de la Actividad:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="numero" id="numero" maxlength="8" value="${correlativo}"required readonly/>
                        </div>
                    </div>
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
                    <div class="form-group">
                        <label for="correlativo" class="col-lg-4 control-label">Correlativo de Bitacora:</label>
                        <div class="col-lg-4">
                            <select id="correlativo" name="correlativo" class="form-control">
                                <option value="">Seleccionar Bitacora</option>
                                <%
                                while(tabla.next()){
                                out.print("<option value='"+tabla.getString(1)+"'>"+tabla.getString(1)+"</option>");
                                }                              
                                %> 
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Fecha de la Actividad:</label>
                        <div class="col-lg-4">
                            <input type="date" class="form-control" name="fecha" id="fecha" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="horasalida" class="col-lg-4 control-label">Hora de Salida:</label>
                        <div class="col-lg-4">
                            <input type="time" class="form-control" name="horasalida" id="horasalida" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="horaretorno" class="col-lg-4 control-label">Hora de Retorno:</label>
                        <div class="col-lg-4">
                            <input type="time" class="form-control" name="horaretorno" id="horaretorno" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="kmsalida" class="col-lg-4 control-label">Kilometraje de Salida:</label>
                        <div class="col-lg-4">
                            <input type="number" min="0" class="form-control" name="kmsalida" id="kmsalida" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="kmretorno" class="col-lg-4 control-label">Kilometraje de Retorno:</label>
                        <div class="col-lg-4">
                            <input type="number" min="0" class="form-control" name="kmretorno" id="kmretorno" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="kmutilizados" class="col-lg-4 control-label">Kilometraje Utilizado:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="kmutilizados" id="kmutilizados" readonly onclick="restar()" required/>
                        </div>
                    </div>
                    <%
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion =DriverManager.getConnection(ruta,user,clave);
                    Sentencias = conexion.createStatement();
                    tabla = Sentencias.executeQuery("Select * From solicitudtransporte where estado='Aprobada' ");
                    %>
                    <div class="form-group">
                        <label for="solicitud" class="col-lg-4 control-label">Codigo de la Solicitud:</label>
                        <div class="col-lg-4">
                            <select id="solicitud" name="solicitud" class="form-control" required>
                                <option value="">Seleccionar Solicitud</option>
                                <%
                                while(tabla.next()){
                                out.print("<option value='"+tabla.getString(1)+"'>"+tabla.getString(1)+"</option>");
                                }                              
                                %> 
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="objetivo" class="col-lg-4 control-label">Objetivo de la Misión:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="objetivo" id="objetivo" onkeypress="return permite(event, 'num_car')" 
                                   maxlength="100" placeholder="Objetivo de la mision" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lugar" class="col-lg-4 control-label">Lugar:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="lugar" id="lugar" maxlength="50" 
                                   placeholder="Lugar de la mision" onkeypress="return permite(event, 'num_car')" required/>
                        </div>
                    </div>
                    <%
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion =DriverManager.getConnection(ruta,user,clave);
                    Sentencias = conexion.createStatement();
                    tabla = Sentencias.executeQuery("Select * From motorista");
                    %>
                    <div class="form-group">
                        <label for="motorista" class="col-lg-4 control-label">Nombre del Motorista:</label>
                        <div class="col-lg-4">
                            <select id="motorista" name="motorista" class="form-control" required>
                                <option value="">Seleccionar nombre</option>
                                <%
                                while(tabla.next()){
                                out.print("<option value='"+tabla.getString(2)+"'>"+tabla.getString(2)+"</option>");
                                }                              
                                %> 
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="observaciones" class="col-lg-4 control-label">Observaciones:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="observaciones" id="observaciones" maxlength="120" 
                                   placeholder="Observaciones" onkeypress="return permite(event, 'num_car')" />
                        </div>
                    </div>
                    <center>
                        <input type="submit" class="btn btn-success" value="Guardar Actividad" />
                    </center>
                </form>
            </div>
        </div>
    </div>
</body>
    
</html>