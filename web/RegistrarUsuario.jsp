<%@ page language="java" contentType="text/html"  pageEncoding="ISO-8859-1"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registrar Usuario</title>
        <link rel="stylesheet" href="estilos/style.css">
        <link rel="stylesheet" href="estilos/foundation.css">
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
            <section class="container">
                <div class="login">
                    <h1>Registrar Usuario</h1>
                    <form method="post" action="Registro.jsp">
                        <p>Nombre<input type="text" name="nombre" required="required" value="" placeholder="Nombre"></p>       
                        <p>Usuario<input type="text" name="username" required="required" value="" placeholder="Username"></p>
                        <p>Contraseña<input type="password" name="password" required="required" value="" placeholder="Password"></p>
                        <p>Nivel<input type="text" name="nivel" required="required" value="" placeholder="Nivel"></p>      
                        <p class="submit1"><input type="submit" name="commit" value="Registrar"></p>
                    </form>
                </div>
            </section>
        
    </body>
</html>