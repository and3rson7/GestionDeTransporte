<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes de Transporte</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <link rel="stylesheet" href="estilos/estilosfull.css">
        <script type="text/javascript">
          
function Solo_Numerico(variable){
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        return Numer;
    }
    function ValNumero(Control){
        Control.value=Solo_Numerico(Control.value);
    }
</script>
        <style type="text/css" align="center">
#iframe
    {
    overflow:auto;
    width:740px;
    height:300px;
     }
.style8 {font-family: Arial, Helvetica, sans-serif; font-size: 10px; }
.fondo-texto {font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; }
</style>
    </head>
    <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
<br><center><p style="font-size: 25px"><strong>ACTUALIZAR SOLICITUDES DE TRANSPORTE</strong></p></center><br><br>
 
        
        <%
        try{
        ResultSet rs;
        String con="select * from solicitudtransporte";
        rs=sql.executeQuery(con);
        %>
        
        
 <form name="formactulizar" method="post" align="center" action="Updat.jsp">
     <b>Digite el ID de la solicitud:</b><input type="text" name="texto" onkeyUp="return ValNumero(this);">
            
           <input type="submit" value="Modificar" class="btn btn-success"/>
        <%
        out.print("<table border=\"1\" align=\"center\"><tr><td bgcolor=2E9AFE>ID</td><td bgcolor=2E9AFE>De</td><td bgcolor=2E9AFE>Para</td><td bgcolor=2E9AFE>Fecha de Solicitud</td><td bgcolor=2E9AFE>Actividad</td><td bgcolor=2E9AFE>Hora</td><td bgcolor=2E9AFE>Dia a realizarse</td><td bgcolor=2E9AFE>Lugar a realizarse</td><td bgcolor=2E9AFE>Tipo Unidad</td><td bgcolor=2E9AFE>Duracion</td></tr>"); 
        %>
                
        <%
        while (rs.next())
      {
            
         out.println("<tr>");
         out.println("<td>"+rs.getObject("idsolicitud")+"</td>");
         out.println("<td>"+rs.getObject("Solicitante")+"</td>");
         out.println("<td>"+rs.getObject("EncargadoTransporte")+"</td>");
         out.println("<td>"+rs.getObject("Fechasolicitud")+"</td>");
         out.println("<td>"+rs.getObject("Descripcion")+"</td>");
         out.println("<td>"+rs.getObject("Hora")+"</td>");           
         out.println("<td>"+rs.getObject("diarealizar")+"</td>");
         out.println("<td>"+rs.getObject("DireccionLugar")+"</td>");
         out.println("<td>"+rs.getObject("tipoUnidad")+"</td>");
         out.println("<td>"+rs.getObject("tiempoAprox")+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");

      // cierre de la conexion
      rs.close();
   }catch (Exception e){
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}      
                    
  %>
  </form>
     
</body>
</html>
