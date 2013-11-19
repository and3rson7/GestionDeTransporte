<%-- 
    Document   : GuardarBitacora
    Created on : 26-oct-2013, 22:40:12
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<%
    try {
        Conexion prueba = new Conexion();
        Connection connection = null;
        //ResultSet rs = null;
        PreparedStatement pst = null;

        String pHost = "localhost:3306";
        String pUser = "root";
        String pPassword = "";
        String sql = "";

        String numero = request.getParameter("correlativo");
        String mes = request.getParameter("mes");
        String year = request.getParameter("year");
        String equipo = request.getParameter("equipo");
        connection = prueba.conectar(pHost, pUser, pPassword);
        if (!connection.isClosed())
%>

<%
        sql = "INSERT INTO bitacoraactividades " + "VALUES" + " ('" + numero 
                + "','" + mes + "','" + year + "','" + equipo + "')";
        
        pst = connection.prepareStatement(sql);
        //out.println(sql);
        
        pst.execute();  
        connection.close();
        
    } catch (Exception ex) {
    %>

<%
        out.println("Unable to connect to database.");
        out.println("Error Message: " + ex.getMessage().toString());
    }
    pageContext.include("BitacoraActividadesVM.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje</title>
    </head>
    <body>
        <script type="text/javascript" >
            alert("Bitacora Guardada con Exito");
        </script>      
    </body>
</html>
