<%-- 
    Document   : BitacoraActividades
    Created on : 23-oct-2013, 10:39:38
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="WEB-INF/jspf/global-libs.jspf" %>
        <script type="text/javascript" src="js/validarActividades.js"></script>        
        <title>Bitacora de Actividad</title>
</head>
<body>
        <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
    <br>
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Bitacora de Actividades</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" action="GuardarBitacoraVM.jsp">
                    
                    <div class="form-group">
                        <label for="correlativo" class="col-lg-4 control-label">Correlativo:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="correlativo" id="correlativo" maxlength="8" value="${correlativo}" 
                                   placeholder="Correlativo" required readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mes" class="col-lg-4 control-label">Mes:</label>
                        <div class="col-lg-4">
                            <select id="mes" name="mes" class="form-control">
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
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="year" class="col-lg-4 control-label">Año:</label>
                        <div class="col-lg-4">
                            <input type="number" class="form-control" name="year" maxlength="4" min="2000" max="2100" id="year" placeholder="Año" 
                                   onkeypress="return permite(event, 'num')" required />
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
                    tabla = Sentencias.executeQuery("Select * From unidad");
                    %>
                    <div class="form-group">
                        <label for="equipo" class="col-lg-4 control-label">Equipo:</label>
                        <div class="col-lg-4">
                            <select id="equipo" name="equipo" class="form-control">
                                <option value="">Seleccionar Equipo</option>
                                <%
                                while(tabla.next()){
                                out.print("<option value='"+tabla.getString(2)+"'>"+tabla.getString(2)+"</option>");
                                }                              
                                %> 
                            </select>
                        </div>
                    </div>
                    
                    <center>
                        <input type="submit" class="btn btn-success" value="Guardar" />
                    </center>
                </form>
            </div>
        </div>
    </div>     
</body>
</html>
