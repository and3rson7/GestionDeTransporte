<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="estilos/estilosfull.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <% 
        
         String ID=request.getParameter("ide");
         int IDE=Integer.parseInt(ID);
         String Para=request.getParameter("para");
         String De=request.getParameter("de");
         String Fecha=request.getParameter("fecha");
         String Actividad=request.getParameter("actividad");
         String Dia=request.getParameter("dia");
         String Hora=request.getParameter("hora");
         String Lugar=request.getParameter("lugar");
         String unidad=request.getParameter("tipoUnida");  
         String duracion=request.getParameter("horaAprox");         
         String qry="update solicitudtransporte set Solicitante= '"+De+ "',EncargadoTransporte='"+Para+"',FechaSolicitud='"+Fecha+"',Descripcion='"+Actividad+"',hora='"+Hora+"',diarealizar='"+Dia+"',DireccionLugar='"+Lugar+"',tipoUnidad='"+unidad+"',tiempoAprox='"+duracion+"' where idsolicitud = "+IDE+";";
           sql.executeUpdate(qry);
           out.print("Actualizacion Exitosa!!!!");
           
        %>
        <br>
        <br>
        <a href="actualizar.jsp">Atras</a>
         
    </body>
</html>
