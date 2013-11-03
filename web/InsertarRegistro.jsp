<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %> 

<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardando Registro</title>
    </head>
    <body>
       <%
     String user="root"; //nombre root de la base de datos
     String clave="";//por default nada
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null; // esto lo llenamos mas adelante
    Statement Sentencias = null;
    ResultSet tabla = null;
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
              String estado= request.getParameter("estado");
              Sentencias=conexion.createStatement();
              tabla = Sentencias.executeQuery("Select * From motorista WHERE licencia='"+licencia+"'");
              if (tabla.next() == true) {
                 out.println("<script>alert('El Codigo de Registro ya existe en la base de datos')</script>");
                 out.println("<meta http-equiv='refresh' content='0;url=InsertarMotorista.jsp'");
              }//Fin del primer if 
              else {
                   
                    Sentencias=conexion.createStatement();
                    String consulta= "Insert Into motorista (licencia,nombres,apellidos,dui,telefono,direccion,sexo,fechaingreso,estado) values('"+licencia+"','"+nombres+"','"+apellidos+"','"+dui+"','"+telefono+"','"+direccion+"','"+sexo+"','"+fecha+"','"+estado+"')";
                    int resultado = Sentencias.executeUpdate(consulta);
                    if(resultado==1)
                     {
                      out.println("<script>alert('El registro se guardo correctamente')</script>");
                      out.println("<meta http-equiv='refresh' content='0;url=InsertarMotorista.jsp'");
                      }//Fin del segundo if
                   else
                    {
                     out.println("error");
                 }//Fin del segundo else
           
             }//Fin del primer else
%>
    </body>
</html>
