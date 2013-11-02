<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" session="true" %>
   
<!DOCTYPE html >
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inicio de Sesion</title>
<link rel="stylesheet" href="estilos/style.css">
<link rel="stylesheet" href="estilos/foundation.css">
</head>
<body style="height:650px; background: linear-gradient(#D8D8D8, #39C, #39C);">
    
<nav class="top-bar hide-for-small" style="">
          <ul class="title-area">
            <!-- Title Area -->
            <li class="name">
              <h1>
                <a href="http://www.cuscatancingo.gob.sv">
                  Alcaldia de Cuscatancingo
                </a>
              </h1>
            </li>
            <li class="toggle-topbar"><a href="#"></a></li>
          </ul>

          <section class="top-bar-section">
          
            <!-- Right Nav Section -->
            
            <ul class="right">
              <li><a href="#">Ayuda</a></li>              
              <li><a href="Login.jsp">Iniciar Sesión</a>
              </li>
              
            </ul>
          </section>
        </nav>
        

<br><center><p style="font-family:Cambria;color:black;font-size:35px;"><strong>Ingreso al Sistema de Gestion de Transporte <br>
                        de Alcaldia Municipal de Cuscatancingo</strong></p></center>

<div class="image1">   
  	<img src="images/signup.png">
</div> 
		 
<section class="container">
    <div class="login">
      <h1>Login</h1>
      <form method="post" action="check.jsp">
        <p>Usuario<input type="text" name="username" required value="" placeholder="Username"></p>
        <p>Contraseña<input type="password" name="password" required  value="" placeholder="Password"></p>
       
        <p class="submit"><input type="submit" name="commit" value="Ingresar al Sistema">
      </form>
  </div>
</section>  
      
    <% if(request.getParameter("error")!=null){ %>
<script type="text/javascript" >
  
 
  alert("Su sesion ha expirado Es obligacion Identificarse ");
</script>
<% }%>	
				
</body>
</html>