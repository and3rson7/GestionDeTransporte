<%@  page import="java.io.*,java.util.*"  language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE HTML >
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Gestion de Transporte</title>
        <link rel="stylesheet" href="estilos/foundation.css">
        <link rel="stylesheet" href="estilos/style.css">

        <link href="themes/js-image-slider.css" rel="stylesheet" type="text/css" />
        <script src="themes/js-image-slider.js" type="text/javascript"></script> 	
    </head>

    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
        
        <br><br>
        <center>
        <p style="font-family:Cambria;color:black;font-size:50px;">
            <strong>Alcaldia Municipal de Cuscatancingo</strong>
        </p>
        </center>
        <br><br>
        <div id="sliderFrame">
            <div id="slider">
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
                <img src="images/escudo.jpg" alt="" />
            </div>
        </div><br>

        <%@ include file="WEB-INF/jspf/pie-pagina.jspf" %>
    </body>
</html>