<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes de Transporte</title>
        
	<script type="text/javascript" src="tcal.js"></script>
        <script type="text/javascript">
        function checkAddress()
    {
        if (checkAddress.checked == true)
        {
            alert("a");
        }
    }
    </script>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <body>
               <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %> 
              
     <form name="form1" method="post" align="center" action="">
         <td colspan="3" bgcolor="red"><div align="center">
           
          <h2>CONSULTAR SOLICITUDES DE TRANSPORTE</h2>
          
      </div></td>
      
      <br>
      <%
        try{
        ResultSet rs;
        String con="select * from solicitudtransporte";
        rs=sql.executeQuery(con);
        out.println("<table font color='white' border=\"1\" align=\"center\"><tr><td font color=white bgcolor=2E9AFE>ID</td><td bgcolor=2E9AFE>De</td><td bgcolor=2E9AFE>Para</td><td bgcolor=2E9AFE>Fecha de Solicitud</td><td bgcolor=2E9AFE>Actividad</td><td bgcolor=2E9AFE>Hora</td><td bgcolor=2E9AFE>Dia a realizarse</td><td bgcolor=2E9AFE>Lugar a realizarse</td><td bgcolor=2E9AFE>Tipo de Unidad</td><td bgcolor=2E9AFE>Duracion Aproximado</td><td bgcolor=2E9AFE size=90 >Estado</td></tr>"); 
        //String estad,aprobadas,estaActivada="",ides="";
        int contador=0;
        int i=1;
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
         out.println("<td>"+rs.getObject("estado")+"</td>");
        
         %>
         
         <td><input type="checkbox" name="checkBoxes" value="<%=i%>"/></td> 
         <%
        i++;
          }
      out.println("</tr>");
      out.println("</table>");
     // cierre de la conexion
      rs.close(); 
   }catch (Exception e){
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}      
  
  %>
         
                        <%if(request.getParameter("checkBoxes") != null){%>
			<%! String[] ItemNames;%>
			<%
				ItemNames = request.getParameterValues("checkBoxes");
				for(int i = 0; i < ItemNames.length; i++){
			%>
				
				<%= ItemNames[i] %>
                                <% 
                                String apro="Aprobada";
                                String estad="update solicitudtransporte set estado='"+apro+"' where idsolicitud = "+ItemNames[i]+";";
                                sql.executeUpdate(estad);
                             
                                %>
				
			<%}%>
		<%}%>
  <br><br><a href="vistaAdministrador.jsp">REGRESAR</a><br><br>
  <td width="67"><input type="submit" class="btn btn-success" value="Guardar Cambios" align="center" />
  </form>
  <br><br><br>
    </body>
</html>
