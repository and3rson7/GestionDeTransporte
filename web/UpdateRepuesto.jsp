<%-- 
    Document   : UpdateRepuesto
    Created on : 10-25-2013, 11:41:01 AM
    Author     : VICTOR
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<%

    try {
            Conexion prueba = new Conexion();
            Connection connection = null;
            ResultSet rs = null;
            PreparedStatement pst = null;

            String pHost = "localhost:3306";
            String pUser = "root";
            String pPassword = "";
            String sql = "";

            //String id_unidad = unidad.getId_unidad();
            int idunidad =Integer.parseInt(request.getParameter("idunidad")) ;
            String Aceite =request.getParameter("Aceite") ;
            String Aire = request.getParameter("Aire");
            String Combustible =request.getParameter("Combustible");
            String Diesel = request.getParameter("Diesel");
            String Estado=request.getParameter("Estado");
            String Codigo_Aceite=request.getParameter("Codigo_Aceite");
        
            
            connection = prueba.conectar(pHost, pUser, pPassword);
            out.print(Diesel);
            if (!connection.isClosed())
                
                 out.print(Diesel);
    %>

    <%       String e="";
                 
                 Calendar c1 = GregorianCalendar.getInstance();//Gestionar calendario actual



SimpleDateFormat format = new SimpleDateFormat("d/M/yyyy");

c1.add(Calendar.MONTH, 3);

//out.println("Fecha Formateada: "+format.format(c1.getTime()));//Fecha actual formateada

String Fecha_actual=format.format(c1.getTime());//Pasando a String fecha actual
 
            
            sql = "UPDATE filtro SET " + "Equipo=" + idunidad + ",Aceite='" + Aceite
                    + "',Aire='" + Aire + "',Combustible='" + Combustible + "',Diesel='"
                    + Diesel  +"',Estado='"+Estado+"',Fecha_Revision='"+Fecha_actual+"',Codigo_Aceite='"+Codigo_Aceite+ "' WHERE Equipo=" + request.getParameter("idunidad") ;
        pst = connection.prepareStatement(sql);
        
         
        //out.println(sql);
        
        pst.execute();
        connection.close();
        response.sendRedirect("HojadeRepuesto.jsp");

    } catch (Exception ex) {
    %>

    <%
            out.println("Unable to connect to database.");
            out.println("Error Message: " + ex.getMessage().toString());
        }
        //pageContext.include("");
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
 