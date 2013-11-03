<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE HTML >

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    </head>
    <body>
          <%
     String user="root"; //nombre root de la base de datos
     String clave="";//por default nada
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
//esto lo podemos hallar manual pero lo unico que cambia es /jsp es el nombre
//de tu  base
    Connection conexion=null; // esto lo llenamos mas adelante
    Statement Sentencias = null;

     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
              String licencia = request.getParameter("licencia");
              String nombres = request.getParameter("nombres");
              String apellidos = request.getParameter("apellidos");
              String dui = request.getParameter("dui");
              String telefono = request.getParameter("telefono");
              String direccion= request.getParameter("direccion");
              String sexo = request.getParameter("sexo");
              String fecha= request.getParameter("fecha");
              String estado= "Eliminado";
              //capturamos todos los valores a modificar.
              
              Sentencias=conexion.createStatement();
              String sql = "UPDATE motorista SET Licencia='"+licencia+"', Nombres='"+nombres+"',"
                           + "Apellidos='"+apellidos+"', Dui='"+dui+"', Telefono='"+telefono+"', "
                           + "Direccion='"+direccion+"', Sexo='"+sexo+"', FechaIngreso='"+fecha+"', Estado='"+estado+"'   WHERE Licencia='"+licencia+"'";
              int res = Sentencias.executeUpdate(sql);
              if (res == 1) {
              out.println("<script>alert('El registro se elimino correctamente')</script>");
              out.println("<meta http-equiv='refresh' content='0;url=EliminarMotorista.jsp'");
              } else {
                 out.println("<script>alert('Error! no se pudo realizar la operacion')</script>");
                 out.println("<meta http-equiv='refresh' content='0;url=ModificarMotorista.jsp'");
    }

            

%>
    </body>
</html>
