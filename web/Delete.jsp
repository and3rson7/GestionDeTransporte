<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
String usuario =" ";
String usuario1 =" ";

usuario1=(String)session.getAttribute("usuario");


if (usuario1 == null) {
%>

<jsp:forward page="Login.jsp">
<jsp:param name="error" value="Es
obligatorio identificarse"/>

</jsp:forward>
<%
} else {
usuario = (String)session.getAttribute("usuario");
}
%>
<%
response.setHeader( "Pragma", "no-cache" );
response.addHeader( "Cache-Control", "must-revalidate" );
response.addHeader( "Cache-Control", "no-cache" );
response.addHeader( "Cache-Control", "no-store" );
response.setDateHeader("Expires", 0);
%>
<%@include file="conexion.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <title>JSP Page</title>
    </head>
    <body>
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
              <li class="has-dropdown">
                <a href="#">Solicitudes</a>
                <ul class="dropdown">
                  <li><a href="insertar.jsp">Registrar solicitud</a></li>
                  <li><a href="consultar.jsp">Consultar solicitud</a></li>
                  <li><a href="eliminar.jsp">Eliminar solicitudes</a></li>
                  <li><a href="actualizar.jsp">Actualizar datos</a></li>                  
                </ul>
              </li>
              <li class="divider hide-for-small"></li>              
              <li class="has-dropdown">
                <a href="#">Inicio</a>
                <ul class="dropdown">
                  <li><a href="vistaAdministrador.jsp">Menu Principal</a></li>
                  <li><a href="CerrarSesion.jsp">Cerrar Sesion</a></li>                  
                </ul>
              </li>              
            </ul>
          </section>
</nav>
        
   <form name="frminsertar" method="post" action="" >
                
        <%
        String text=request.getParameter("texto");
        ResultSet ver;
        boolean existe=false;
        String idleido="";
        String verifica="select idsolicitud from solicitudtransporte";
        ver=sql.executeQuery(verifica);
        while(ver.next()){
          idleido=(ver.getObject("idsolicitud")).toString();
          if(idleido.equals(text)){
             existe=true;
          }          
        }
        if(existe){
       try{        
        
        String delet="delete from solicitudtransporte where idsolicitud="+text+";";
        sql.executeUpdate(delet);
        out.print("REGISTRO ELIMINADO");
                                 
               
        }catch (Exception e){
         // Error en algun momento.
        out.println("Excepcion "+e);
        e.printStackTrace();
        }   

       }else{
               out.print("El ID que digito no existe");
               }                 
        %> 
        
        
   </form> 
        <br>
        <br>
        <a href="eliminar.jsp" style="margin-left: 25px">Atras</a>
        
        
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer"><!-- CONTENEDOR DE TODO EL PIE-->
			<div id="pie">
				<p>
					El Salvador 2013<br>
					
				</p>
				
			</div>
</div>
    </body>
</html>
