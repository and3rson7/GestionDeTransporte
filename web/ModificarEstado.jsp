<%-- 
    Document   : ModifcarEstado
    Created on : 11-28-2013, 12:36:33 AM
    Author     : VICTOR
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.*"%>
<%@page import="sv.edu.ues.dsi215.login.dominio.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
     String sql = "";

            //String id_unidad = unidad.getId_unidad();
            int idunidad =Integer.parseInt(request.getParameter("idunidad")) ;
           
            String Estado=request.getParameter("Estado");
            String pHost = "localhost:3306";
            String pUser = "root";
            String pPassword = "";    
 
    try {
            Conexion prueba = new Conexion();
            Connection connection = null;
            ResultSet rs = null;
            PreparedStatement pst = null;           
            
            connection = prueba.conectar(pHost, pUser, pPassword);
           // out.print(Diesel);
            if (!connection.isClosed())
                
             //    out.print(Diesel);
    %>

    <%                  
                        
            sql = "UPDATE filtro SET " + "Equipo=" + idunidad + ",Estado='"+Estado+"' WHERE Equipo=" + request.getParameter("idunidad") ;
        pst = connection.prepareStatement(sql);
           
        pst.execute();
        connection.close();
       response.sendRedirect("Estado.jsp");

                
    } 
    catch (Exception ex) {
    %>

    <%
            out.println("Unable to connect to database.");
            out.println("Error Message: " + ex.getMessage().toString());
        }
       
    %>

    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
