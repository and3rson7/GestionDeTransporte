<%-- 
    Document   : RegistrarActividad
    Created on : 02-oct-2013, 22:37:06
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>


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

        String numero = request.getParameter("numero");
        String fecha = request.getParameter("fecha");
        String horasalida = request.getParameter("horasalida");
        String kmsalida = request.getParameter("kmsalida");
        String objetivo = request.getParameter("objetivo");
        String lugar = request.getParameter("lugar");
        String horaretorno = request.getParameter("horaretorno");
        String kmretorno = request.getParameter("kmretorno");
        String kmutilizados = request.getParameter("kmutilizados");
        String motorista = request.getParameter("motorista");
        String id_solicitud = request.getParameter("solicitud");
        String correlativo = request.getParameter("correlativo");
        String observaciones = request.getParameter("observaciones");

        connection = prueba.conectar(pHost, pUser, pPassword);
        if (!connection.isClosed())
%>

<%
        sql = "INSERT INTO detallebitacoraactividades " + "VALUES" + " ('" + numero + "','" + fecha + "','" + horasalida
                        + "','" + kmsalida + "','" + objetivo + "','" + lugar + "','" + horaretorno + "','" + kmretorno
                        + "','" + kmutilizados + "','" + motorista + "','" + id_solicitud + "','"
                        + correlativo + "','" + observaciones + "')";
        
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
    pageContext.include("RegistrarActividadesVM.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript" >
            alert("Registro Exitoso !!!");
        </script>      
    </body>
</html>