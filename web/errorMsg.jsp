<%-- 
    Document   : errorAdministrador
    Created on : 10-17-2013, 09:39:23 AM
    Author     : anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Refresh" content="8;url=CerrarSesion.jsp">
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Oops...</title>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    </head>

    <body>

        <div class="container">

            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li><a href="#"></a></li>
                </ul>
                <h3 class="text-muted"></h3>
            </div>

            <div class="jumbotron">
                <h1>Oops... :(</h1>
                <p class="lead" style="margin-top: 20px">Lo sentimos, no se pudo procesar tu solicitud. Por favor espera mientras te redireccionamos...</p>
                <p><a class="btn btn-lg btn-success" href="CerrarSesion.jsp">Salir</a></p>
            </div>
                
            <% 
                if(request.getSession().getAttribute("errorLog") != null) {%>
                    <div class="panel panel-danger">
                        <div class="panel-heading">Error Log</div>
                        <div class="panel-body">
                            <%=request.getSession().getAttribute("errorLog")%>
                        </div>
                    </div>
                    <% request.getSession().removeAttribute("errorLog");
                }
            %> 
                
        </div> <!-- /container -->

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>