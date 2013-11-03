<%-- 
    Document   : ModificarBitacoraCombustible
    Created on : 10-26-2013, 09:19:00 PM
    Author     : anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Bitacora de Combustible</title>
        
        <script type="text/javascript" src="datatables/media/js/jquery.js"></script>
        <script type="text/javascript" src="datatables/media/js/jquery-ui-1.10.3.custom.js"></script>
        
        <link rel="stylesheet" href="datatables/media/css/cupertino/jquery-ui-1.10.3.custom.css">
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        <jsp:useBean id="bitacoracombustible" scope="request" class="sv.edu.ues.dsi215.login.dominio.BitacoraCombustible" />
        
        <center>
            <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
                <strong>Modificar Bitacora de Combustible</strong>
            </p>
        </center>
        
        <center>
            <div class="well">
                <form class="form-inline" id="modificar_bitacora_combustible" method="post" action="ModificarBitacoraCombustibleController">
                    <label for="fecha">Fecha:</label>
                    <input type="text" name="fecha" id="fecha" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" value="<jsp:getProperty name="bitacoracombustible" property="fecha" />" readonly />

                    <label for="hora" style="margin-left: 20px;">Hora:</label>
                    <input type="time" name="hora" id="hora" class="form-control" style="width: 140px; margin-left: 10px; margin-right: 10px;" value="<jsp:getProperty name="bitacoracombustible" property="hora" />" required />

                    <label for="gasolinera" style="margin-left: 10px;">Gasolinera:</label>
                    <input type="text" name="gasolinera" id="gasolinera" class="form-control" style="width: 430px; margin-left: 10px; margin-right: 10px;" maxlength="50" value="<jsp:getProperty name="bitacoracombustible" property="gasolinera" />" required />

                    <label for="correlativo">Correlativo:</label>
                    <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" value="<jsp:getProperty name="bitacoracombustible" property="correlativo" />" readonly />

                    <input type="submit" class="btn btn-success" value="OK" />
                </form>
            </div>
        </center>
        
        <script>
            $(function() {
              $("#fecha").datepicker({
                showOn: "button",
                buttonImage: "datatables/media/images/calendar.gif",
                buttonImageOnly: true,
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