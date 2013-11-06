<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes de Transporte</title>
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
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
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
        out.println("<table bgcolor=04F7EF border=\"1\" align=\"center\"><tr><td bgcolor=FA5FB9>ID</td><td bgcolor=FA5FB9>De</td><td bgcolor=FA5FB9>Para</td><td bgcolor=FA5FB9>Fecha de Solicitud</td><td bgcolor=FA5FB9>Actividad</td><td bgcolor=FA5FB9>Hora</td><td bgcolor=FA5FB9>Dia a realizarse</td><td bgcolor=FA5FB9>Lugar a realizarse</td><td bgcolor=FA5FB9>Tipo de Unidad</td><td bgcolor=FA5FB9>Duracion Aproximado</td><td bgcolor=FA5FB9 size=90 >Estado</td></tr>"); 
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
  <td width="67"><input type="submit" value="Guardar Cambios" align="center" />
  </form>

    </body>
</html>
