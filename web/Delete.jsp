<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<%@include file="conexion.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </head>
    <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
   <form name="frminsertar" method="post" action="" >
       <br><br><br><br>      
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
        
        

    </body>
</html>
