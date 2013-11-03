<%-- 
    Document   : ActualizarBitacora
    Created on : 29-oct-2013, 23:37:22
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Bitacora</title>
    </head>
    <body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
      
<%   String user="root"; //nombre root de la base de datos
     String clave="";//por default nada
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
//esto lo podemos hallar manual pero lo unico que cambia es /jsp es el nombre
//de tu  base
    Connection conexion=null; // esto lo llenamos mas adelante
    Statement Sentencias = null;

     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        
        String numero = request.getParameter("correlativo");
        String mes = request.getParameter("mes");
        String year = request.getParameter("year");
        String equipo = request.getParameter("equipo");
        
        Sentencias=conexion.createStatement();
              String sql = "UPDATE bitacoraactividades SET mes='"+mes+"', año='"+year+"',"
                           + "equipo='"+equipo+"'  WHERE correlativo='"+numero+"'";
              
        int res = Sentencias.executeUpdate(sql);
              if (res == 1) {
              out.println("<script>alert('La Bitacora se modifico correctamente')</script>");
              out.println("<meta http-equiv='refresh' content='0;url=ConsultarBitacora.jsp'");
              } else {
                 out.println("<script>alert('Error! no se pudo realizar la operacion')</script>");
                 out.println("<meta http-equiv='refresh' content='0;url=ConsultarBitacora.jsp'");
              }
        %>
    </body>
</html>
