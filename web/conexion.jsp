<%-- 
    Document   : conexion
    Created on : 09-09-2013, 02:03:48 PM
    Author     : Equinoccio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.ResultSet"
        import="java.sql.SQLException"
        %>
<% 
Connection conex=null;
Statement sql=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/gestiontransporte","root","");
sql=conex.createStatement();
//out.print("Conexion establecida");
}catch(Exception e){
out.print("Error en la conexion "+e);
}
%>