<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programacion de Actividades Locales</title>
        
        <script type="text/javascript" src="datatables/media/js/jquery.js"></script>
                <link rel="stylesheet" href="datatables/media/css/cupertino/jquery-ui-1.10.3.custom.css">
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>

        <center>
            <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
                <strong>Registrar Programacion de Actividades Locales</strong>
            </p>
        </center>

        <center>
            <div class="well">
                <form class="form-inline" id="registrar_bitacora_combustible" method="post" action="RegistrarProgramacionLocalController">
                    <label for="correlativo">Correlativo:</label>
                    <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" value="${correlativo}" readonly />

                    <input type="submit" class="btn btn-success" value="OK >>" />
                </form>
            </div>
        </center>
 </body>
</html>