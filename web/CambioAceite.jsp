<%-- 
    Document   : HojadeRepuesto
    Created on : 10-20-2013, 12:40:39 PM
    Author     : VICTOR
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>
 <%@ page import="java.io.*,java.util.*,java.util.Date,java.net.*,java.sql.*" %>
 <%@ include file="WEB-INF/jspf/menu-jefe de taller.jspf" %>
 <%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<!DOCTYPE html>
<html>
   <head>
        <title>Cambio de Aceite</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
<div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Cambio de Aceite Unidades de Transporte</div>
              <div class="panel-body">
           
<%
    Date f=new Date();

/*int dia=f.getDate();
int mes=f.getMonth();
int año=f.getYear();*/
SimpleDateFormat format3 = new SimpleDateFormat("EEEE  d MMMMM yyyy");
String Fecha_ahora=format3.format(f);

%>

<TABLE>
    <br><br><br>   
<TR><TD>Para  :</TD><TD><input type="text" name="Receptor" required="required" value="MARICRUZ RODRIGUEZ"></TD></TR>
<TR><TD>De    :</TD><TD><input type="text"  name="Emisor" required="required" value="ROBERTO MENJIVAR"></TD></TR>
<TR><TD>Asunto:</TD><TD><input type="text" name="Asunto" required="required" value="Cambio de Aceite"></TD></TR>
<TR><TD>Fecha :</TD><TD> <input type="text" name="Fecha" required="required" value='<%=Fecha_ahora%>'></TD></TR>
</TABLE>   
<br><br>
       <%
      
          String e="";
        Calendar c1 = GregorianCalendar.getInstance();//Gestionar calendario actual
        
        SimpleDateFormat format = new SimpleDateFormat("d/M/yyyy");
        //c1.add(Calendar.MONTH, 3);
        //out.println("Fecha Formateada: "+format.format(c1.getTime()));//Fecha actual formateada
        
        String Fecha_actual=format.format(c1.getTime());//Pasando a String fecha actual
        

     String user="root";
     String clave="";
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null;
    Statement Sentencias = null;
    ResultSet tabla = null;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
         tabla = Sentencias.executeQuery("SELECT * FROM filtro WHERE (Estado='No Disponible' And Fecha_Revision='"+Fecha_actual+"')");
%> 
                
<table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                      <thead>
                          <tr>
<th bgcolor=White>Equipo</th>
<th bgcolor=White>Aceite</th>
<th bgcolor=White>Gasolina</th>
<th bgcolor=White>Diesel</th>
<th bgcolor=White>Aceite Suministrado</th>
<th bgcolor=White>Estado</th>
<th bgcolor=White>Fecha Revision</th>
 </tr>
  </thead>
 <tbody>
<%

while(tabla.next()) {

out.println("<TR>");

out.println("<TD bgcolor=White>"+tabla.getInt(1) +"</TD>");//Equipo

out.println("<TD bgcolor=White>"+tabla.getString(2)+"</TD>");//Aceita

out.println("<TD bgcolor=White>"+tabla.getString(3)+"</TD>");//Gasolina

out.println("<TD bgcolor=White>"+tabla.getString(4)+"</TD>");//Diesel

out.println("<TD bgcolor=White>"+tabla.getString(5)+"</TD>");//Aceite suministrado
out.println("<TD bgcolor=White>"+tabla.getString(6)+"</TD>");//Estado

String fecha_base=tabla.getString("Fecha_Revision");//se obtiene de la base de datos
out.println("<TD bgcolor=White>"+fecha_base+"</TD>");

//out.println("<TD bgcolor=White>"+"<a href=ModificarRepuesto.jsp?idunidad="+tabla.getInt(1)+">"+"Aplicar Mantenimiento"+"</a>"+"</TD>");

out.println("</TR>"); }; // fin while

//out.println("</TABLE>");
%>
   </tbody>
                  </table>
              </div>
          </div>
      </div>
      
      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Operaciones</div>
              <div class="panel-body" style="text-align: center;">
                  <form class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');" action="ModificarRepuesto.jsp">
                      <label for="placa">Equipo:</label>
                      <input type="text" name="idunidad" id="placa" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>
                      <input type="submit"  value="Aplicar Mantenimiento >>" class="btn btn-warning" onclick="">
                  </form>
              </div>
          </div>
      </div>
  </body>
    
</html>
