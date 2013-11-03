<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registrar Unidad de Transporte</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        
        <script type="text/javascript" src="js/validarUnidades.js"></script>
    </head>
    
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <%@ include file="WEB-INF/jspf/mask-unidad.jspf" %>
        
        <center>
        <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
            <strong>Registrar Unidad de Transporte</strong>
        </p>
        </center>
    
        <div class="well container">
            <form class="form-horizontal" role="form" id="registrar_unidad" method="post" action="RegistrarUnidadController">
                
                <div class="form-group">
                    <label for="placa" class="col-lg-4 control-label">Placa:</label>
                    <div class="col-lg-4">
                        <input type="text" name="placa" class="form-control" id="placa" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_equipo" class="col-lg-4 control-label">N&ordm; Equipo:</label>
                    <div class="col-lg-4">
                        <input type="text" name="num_equipo" class="form-control" id="num_equipo" maxlength="4" onkeypress="return permite(event, 'num')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="clase" class="col-lg-4 control-label">Clase:</label>
                    <div class="col-lg-4">
                        <input type="text" name="clase" class="form-control" id="clase" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="marca" class="col-lg-4 control-label">Marca:</label>
                    <div class="col-lg-4">
                        <input type="text" name="marca" class="form-control" id="marca" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="modelo" class="col-lg-4 control-label">Modelo:</label>
                    <div class="col-lg-4">
                        <input type="text" name="modelo" class="form-control" id="modelo" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="color" class="col-lg-4 control-label">Color:</label>
                    <div class="col-lg-4">
                    <input type="text" name="color" class="form-control" id="color" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="anio" class="col-lg-4 control-label">A&ntilde;o:</label>
                    <div class="col-lg-4">
                    <input type="text" name="anio" class="form-control" id="anio" maxlength="4" onkeypress="return permite(event, 'num')" onblur="validarAnio(this)" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="capacidad" class="col-lg-4 control-label">Capacidad:</label>
                    <div class="col-lg-4">
                    <input type="text" name="capacidad" class="form-control" id="capacidad" maxlength="30" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="dominio" class="col-lg-4 control-label">Dominio:</label>
                    <div class="col-lg-4">
                    <input type="text" name="dominio" class="form-control" id="dominio" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_motor" class="col-lg-4 control-label">N&ordm; Motor:</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_motor" class="form-control" id="num_motor" maxlength="22" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_chasis_grabado" class="col-lg-4 control-label">N&ordm; Chasis Grabado:</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_chasis_grabado" class="form-control" id="num_chasis_grabado" maxlength="17" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="num_chasis_vin" class="col-lg-4 control-label">N&ordm; Chasis VIN:</label>
                    <div class="col-lg-4">
                    <input type="text" name="num_chasis_vin" class="form-control" id="num_chasis_vin" maxlength="17" onkeypress="return permite(event, 'num_car')" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="en_calidad" class="col-lg-4 control-label">En Calidad:</label>
                    <div class="col-lg-4">
                    <input type="text" name="en_calidad" class="form-control" id="en_calidad" maxlength="30" onkeypress="return permite(event, 'car')" />
                    </div>
                </div>
                
                <center>
                    <input class="btn btn-success" type="submit" value="Registrar Unidad" />
                    <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='vistaAdministrador.jsp'">
                </center>
            </form>
        </div>
        
        <% 
            if(request.getSession().getAttribute("message") != null) {%>
                <script type="text/javascript">
                    alert('<%=request.getSession().getAttribute("message")%>');
                </script>
                <% request.getSession().removeAttribute("message");
            }
        %>
    
        <%@ include file="WEB-INF/jspf/validate-unidad.jspf" %>
    </body>
</html>