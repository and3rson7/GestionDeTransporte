<%-- 
    Document   : DeleteActividad
    Created on : 13-oct-2013, 22:10:01
    Author     : Michael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Actividad</title>
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

      String codigo= request.getParameter("numero"); //capturamos el valor del codigo
               Sentencias=conexion.createStatement();
              String consulta2= "delete from detallebitacoraactividades where numero='"+codigo+"'";
              //y borramos filtrando con el codigo a borrar
              int resultado = Sentencias.executeUpdate(consulta2);
               if(resultado==1)
                   {
                    out.println("<script>alert('Se elimino correctamente')</script>");
                    out.println("<meta http-equiv='refresh' content='0;url=ConsultarActividades.jsp'");
                   }
              %>
    </body>
</html>
