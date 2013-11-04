<!DOCTYPE html>
<html>
  <head>
    <title>Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="WEB-INF/jspf/global-libs.jspf" %>
    
    <link rel="stylesheet" href="estilos/style.css">
    <link rel="stylesheet" href="estilos/foundation.css">
  </head>
  <body style="height:650px; background: linear-gradient(#D8D8D8, #39C, #39C);">
      <%@ include file="WEB-INF/jspf/menu-index.jspf" %>
      
      <br><p style="font-family:Cambria;color:black;font-size:35px;text-align: center;">
          <strong>Ingreso al Sistema de Gestión de Transporte <br>
              de Alcaldía Municipal de Cuscatancingo
          </strong>
      </p>

      <div class="image1">   
          <img src="images/signup.png">
      </div> 
  
      <section class="container">
          <div class="login">
              <h1>Iniciar Sesión</h1>
              <form method="post" action="check.jsp">
                  <p>Usuario<input type="text" name="username" required value="" placeholder="Username"></p>
                  <p>Contraseña<input type="password" name="password" required  value="" placeholder="Password"></p>

                  <p class="submit"><input type="submit" name="commit" value="Ingresar al Sistema">
              </form>
          </div>
      </section>  
    
      <% if (request.getParameter("error") != null) {%>
        <script type="text/javascript" >
          alert("Su sesión ha expirado, por favor identifíquese");
        </script>
      <% } %>
  </body>
</html>