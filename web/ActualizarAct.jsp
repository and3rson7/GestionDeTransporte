<%-- 
    Document   : ActualizarAct
    Created on : 13-oct-2013, 21:37:21
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
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
               

        Sentencias=conexion.createStatement();
        String sql = " UPDATE detallebitacoraactividades SET fecha ='" + fecha + "', horasalida='" + horasalida + "', kmsalida='"+ kmsalida
                + "', objetivomision='" + objetivo + "', lugar='" + lugar + "',horaretorno='" + horaretorno 
                + "', kmretorno='" + kmretorno + "', kmutilizados='" + kmutilizados + "' motorista='" + motorista 
                + "', id_solicitud='" + id_solicitud + "', correlativo='"+correlativo+"', observaciones='"+observaciones
                +"' WHERE numero='"+numero+"' ";
        
        int res = Sentencias.executeUpdate(sql);
              if (res == 1) {
              out.println("<script>alert('El registro se modifico correctamente')</script>");
              out.println("<meta http-equiv='refresh' content='0;url=ConsultarBitacora.jsp'");
              } else {
                 out.println("<script>alert('Error! no se pudo realizar la operacion')</script>");
                 out.println("<meta http-equiv='refresh' content='0;url=ConsultarBitacora.jsp'");
    }
%>
     
    </body>
</html>