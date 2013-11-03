<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>
<%@ page import="javax.*" %>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes de Transporte</title>
       <script type="text/javascript">
        function seleccionar_todo(){ 
   for (i=0;i<document.programa.elements.length;i++) 
      if(document.programa.elements[i].type == "checkbox")	
         document.programa.elements[i].checked=1 
      }
   function deseleccionar_todo(){ 
   for (i=0;i<document.programa.elements.length;i++) 
      if(document.programa.elements[i].type == "checkbox")	
         document.programa.elements[i].checked=0 
} 

    </script>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
                <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
       <%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
    
         <td colspan="3" bgcolor="red"><div align="center">
           
          <h2>PROGRAMACIONES</h2>
          
             </div>
       <br>
       <form name="programa">
      <%
        try{
            Conexion prueba = new Conexion();
            Connection conex2 = null; 
            ResultSet tabla2 = null;
            PreparedStatement pst = null;
            String pHost="localhost:3306";
            String pUser="root";
            String pPassword="";
            String sql = "";
            
            sql = "SELECT * FROM solicitudtransporte WHERE estado='Aprobada'";
            System.out.println(sql);
           int n=1;
       conex2 = prueba.conectar(pHost, pUser, pPassword);
       
       if(!conex2.isClosed()){
           System.out.println("Conexion establecida!!!!");
           pst = conex2.prepareStatement(sql);
           tabla2 = pst.executeQuery();
       }
       
       out.println("<table align=\"center\"><tr><td bgcolor=FA5FB9>ID</td><td bgcolor=FA5FB9>Solicitante</td><td bgcolor=FA5FB9>Hora</td><td bgcolor=FA5FB9>Dia a realizar</td><td bgcolor=FA5FB9>Direccion</td><td bgcolor=FA5FB9>Unidad Solicitada</td><td bgcolor=FA5FB9>Motorista</td><td bgcolor=FA5FB9>Unidad</td><td bgcolor=FA5FB9>Programar</td>");   
       %><%
         
            
        while(tabla2.next()){
         out.println("<tr>");
         out.println("<td>"+tabla2.getString("idsolicitud")+"</td>"); 
         out.println("<td>"+tabla2.getString("Solicitante")+"</td>");
         out.println("<td>"+tabla2.getString("Hora")+"</td>");           
         out.println("<td>"+tabla2.getString("diarealizar")+"</td>");
         out.println("<td>"+tabla2.getString("DireccionLugar")+"</td>");
         out.println("<td>"+tabla2.getString("tipoUnidad")+"</td>");    
         %>
         <td><select name="motorista" >
        <option value=""></option> 
        <%
            Conexion prueba2 = new Conexion();
            Connection conex = null; 
            ResultSet tabla = null;
            PreparedStatement pst2 = null;
            String sql2 = "";
            sql2 = "SELECT Idmotorista,Nombres FROM motorista WHERE estado='Disponible'";
            conex = prueba2.conectar(pHost, pUser, pPassword);
         if(!conex.isClosed()){
                System.out.println("Conexion 2 establecida!!!!");
                pst2 = conex.prepareStatement(sql2);
                tabla = pst2.executeQuery();
       }
             while(tabla.next()){ 
            out.print("<option value='"+tabla.getString(1)+"'>"+tabla.getString(2)+"</option>");
        }
            
            
            tabla.close();
            pst2.close();
            conex.close();
%>
             </select>
        <td><select name="tipoUnidad" >
        <option value=""></option> 
        <%
            Conexion prueba3 = new Conexion();
            Connection conex3 = null; 
            ResultSet tabla3 = null;
            PreparedStatement pst3 = null;
            String sql3 = "";
            sql3 = "SELECT id_unidad,clase FROM unidades WHERE estado='Disponible'";
            conex3 = prueba3.conectar(pHost, pUser, pPassword);
         if(!conex3.isClosed()){
                System.out.println("Conexion 3 establecida!!!!");
                pst3 = conex3.prepareStatement(sql3);
                tabla3 = pst3.executeQuery();
       }
             while(tabla3.next()){ 
            out.print("<option value='"+tabla3.getString(1)+"'>"+tabla3.getString(2)+"</option>");
        }
            
           
            tabla3.close();
            pst3.close();
            conex3.close();
%>
         </select></td>
         <td><input type="checkbox" name="checkBoxes" value="<%=n%>"/></td> 
             
        <%    
        
        n++;
        //result.close();        
          }
        
       tabla2.close();
            pst.close();
            conex2.close();
      out.println("</tr>");
      
      out.println("</table>");
       
     // cierre de la conexion
      //rs.close(); 
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
                                //sql.executeUpdate(estad);
                             
                                %>
				
			<%}%>
		<%}%>
                       
                <br><a style="margin-left: 1000px"href="javascript:seleccionar_todo()">Marcar todos</a><a style="margin-left: 25px"href="javascript:deseleccionar_todo()">Desmarcar todos</a><br><br>
  <td width="67"><input style="margin-left: 577px" type="submit" value="Guardar Cambios" align="center" /><br><br><br><br><a style="margin-left: 600px"href="vistaAdministrador.jsp">REGRESAR</a><br><br>
 
  </form>

    </body>
</html>
