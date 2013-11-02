<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Eliminar</title>
        <link rel="stylesheet" href="estilos/estilos.css">
    </head>
    <body>

        <%
               String user="root";
               String clave="";
               String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
               Connection conexion=null;
               Statement Sentencias = null;

               Class.forName("com.mysql.jdbc.Driver").newInstance();
               conexion =DriverManager.getConnection(ruta,user,clave);
               Sentencias = conexion.createStatement();

             String codigo= request.getParameter("cod"); //capturamos el valor del codigo
                      Sentencias=conexion.createStatement();
                     String consulta2= "delete from login where contraseña='"+codigo+"'";
                     //y borramos filtrando con el codigo a borrar
                     int resultado = Sentencias.executeUpdate(consulta2);
                      if(resultado==1)
                          {
                           out.println("<script>alert('Se elimino el usuario correctamente')</script>");
                           out.println("<meta http-equiv='refresh' content='0;url=GestionarUsuarios.jsp'");
                          }
        %>

    </body>
</html>