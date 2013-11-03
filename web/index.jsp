<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Gestion de Transporte</title>        
        <link href="themes/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="themes/js-image-slider.js" type="text/javascript"></script>
    </head>

    <body style="background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-index.jspf" %>
        
        <center>
            <p style="font-family:Cambria;color:black;font-size:50px;">
                <strong>Alcaldia Municipal de Cuscatancingo</strong>
            </p>
        </center>
        
        <div id="sliderFrame">
            <div id="slider">
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
                
                <%-- he agregado este comentario :D --%>
                
            </div>
        </div>

        <br>
        <div>
            <center>
                <p style="margin-top: 17px; font-family:Cambria;color:green;font-size:20px;">
                    <strong>Sistema  para  el  control  de  las 
                        actividades y gestión del equipo 
                        de  transporte  de  la  alcaldía 
                        municipal de Cuscatancingo</strong>
                </p>
                <p style="font-family:Cambria;color:red;font-size:15px;">
                    <strong>Usted no se ha identificado</strong></p>
            </center>
        </div>

        <%@ include file="WEB-INF/jspf/pie-pagina.jspf" %>
    </body>
</html>