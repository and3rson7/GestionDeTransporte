<%-- 
    Document   : RegistrarBitacoraCombustible
    Created on : 10-20-2013, 09:27:19 AM
    Author     : anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de Suministro de Combustible a Vehiculos Municipales</title>
        
        <script type="text/javascript" src="datatables/media/js/jquery.js"></script>
        <script type="text/javascript" src="datatables/media/js/jquery-ui-1.10.3.custom.js"></script>
        
        <link rel="stylesheet" href="datatables/media/css/cupertino/jquery-ui-1.10.3.custom.css">
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>

        <center>
            <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
                <strong>Registrar Bitacora de Combustible</strong>
            </p>
        </center>

        <center>
            <div class="well">
                <form class="form-inline" id="registrar_bitacora_combustible" method="post" action="RegistrarBitacoraCombustibleController">
                    <label for="fecha">Fecha:</label>
                    <input type="text" name="fecha" id="fecha" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" readonly />

                    <label for="hora" style="margin-left: 20px;">Hora:</label>
                    <input type="time" name="hora" id="hora" class="form-control" style="width: 140px; margin-left: 10px; margin-right: 10px;" required />

                    <label for="gasolinera" style="margin-left: 10px;">Gasolinera:</label>
                    <input type="text" name="gasolinera" id="gasolinera" class="form-control" style="width: 430px; margin-left: 10px; margin-right: 10px;" maxlength="50" required />

                    <label for="correlativo">Correlativo:</label>
                    <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" value="${correlativo}" readonly />

                    <input type="submit" class="btn btn-success" value="OK >>" />
                </form>
            </div>
        </center>
    
        <script>
            $(function() {
              $("#fecha").datepicker({
                showOn: "button",
                buttonImage: "datatables/media/images/calendar.gif",
                buttonImageOnly: true;
              });
              
              $("#fecha").change(function (){
                  $("#fecha").focus();
                  $("#hora").focus();
              });
            });
        </script>
        
        <%@ include file="WEB-INF/jspf/validate-bitacora-combustible.jspf" %>
    </body>
</html>