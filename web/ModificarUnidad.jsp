<%-- 
    Document   : ModificarUnidad
    Created on : 10-18-2013, 11:18:05 AM
    Author     : anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Unidad de Transporte</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        
        <script type="text/javascript" src="js/validarUnidades.js"></script>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <jsp:useBean id="unidad" scope="request" class="sv.edu.ues.dsi215.login.dominio.Unidad" />
        
        <center>
        <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
            <strong>Modificar Unidad de Transporte</strong>
        </p>
        </center>
        
        <div class="well container">
            <form class="form-horizontal" role="form" id="modificar_unidad" method="post" action="ModificarUnidadController">
                
                <div class="form-group">
                    <label for="placa" class="col-lg-4 control-label">Placa</label>
                    <div class="col-lg-4">
                        <input type="text" name="placa" class="form-control" id="placa" value="<jsp:getProperty name="unidad" property="placa" />" readonly />
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="num_equipo" class="col-lg-4 control-label">N&ordm; Equipo</label>
                    <div class="col-lg-4">
                        <input type="text" name="num_equipo" class="form-control" id="num_equipo" maxlength="4" value="<jsp:getProperty name="unidad" property="num_equipo" />" onkeypress="return permite(event, 'num')" readonly />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="clase" class="col-lg-4 control-label">Clase</label>
                    <div class="col-lg-4">
                        <input type="text" name="clase" class="form-control" id="clase" value="<jsp:getProperty name="unidad" property="clase" />" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="marca" class="col-lg-4 control-label">Marca</label>
                    <div class="col-lg-4">
                        <input type="text" name="marca" class="form-control" id="marca" value="<jsp:getProperty name="unidad" property="marca" />" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="modelo" class="col-lg-4 control-label">Modelo</label>
                    <div class="col-lg-4">
                        <input type="text" name="modelo" class="form-control" id="modelo" value="<jsp:getProperty name="unidad" property="modelo" />" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-lg-4 control-label">Color</label>
                    <div class="col-lg-4">
                    <input type="text" name="color" class="form-control" id="color" value="<jsp:getProperty name="unidad" property="color" />" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="anio" class="col-lg-4 control-label">A&ntilde;o</label>
                    <div class="col-lg-4">
                    <input type="text" name="anio" class="form-control" id="anio" value="<jsp:getProperty name="unidad" property="anio" />" maxlength="4" onkeypress="return permite(event, 'num')" onblur="validarAnio(this)" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="capacidad" class="col-lg-4 control-label">Capacidad</label>
                    <div class="col-lg-4">
                    <input type="text" name="capacidad" class="form-control" id="capacidad" value="<jsp:getProperty name="unidad" property="capacidad" />" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="dominio" class="col-lg-4 control-label">Dominio</label>
                    <div class="col-lg-4">
                    <input type="text" name="dominio" class="form-control" id="dominio" value="<jsp:getProperty name="unidad" property="dominio" />" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_motor" class="col-lg-4 control-label">N&ordm; Motor</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_motor" class="form-control" id="num_motor" value="<jsp:getProperty name="unidad" property="num_motor" />" maxlength="22" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_chasis_grabado" class="col-lg-4 control-label">N&ordm; Chasis Grabado</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_chasis_grabado" class="form-control" id="num_chasis_grabado" value="<jsp:getProperty name="unidad" property="num_chasis_grabado" />" maxlength="17" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_chasis_vin" class="col-lg-4 control-label">N&ordm; Chasis VIN</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_chasis_vin" class="form-control" id="num_chasis_vin" value="<jsp:getProperty name="unidad" property="num_chasis_vin" />" maxlength="17" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="en_calidad" class="col-lg-4 control-label">En Calidad</label>
                    <div class="col-lg-4">
                    <input type="text" name="en_calidad" class="form-control" id="en_calidad" value="<jsp:getProperty name="unidad" property="en_calidad" />" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <center>
                    <input class="btn btn-success" type="submit" value="Modificar Unidad" />
                    <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='vistaAdministrador.jsp'">
                </center>
            </form>
        </div>
            <%@ include file="WEB-INF/jspf/validate-unidad.jspf" %>
    </body>
</html>