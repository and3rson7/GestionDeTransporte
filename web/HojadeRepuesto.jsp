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
 
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoja de Repuestos</title>
        <link rel="stylesheet" href="estilos/tabla-style.css">
</head>
<body style="height: 750px; background: linear-gradient(#D8D8D8, #39C, #39C)">
<%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <form>
       
<%
    Date f=new Date();

/*int dia=f.getDate();
int mes=f.getMonth();
int año=f.getYear();*/
SimpleDateFormat format3 = new SimpleDateFormat("EEEE  d MMMMM yyyy");
String Fecha_ahora=format3.format(f);

%>

<TABLE>
    
<TR><TD>Para  :</TD><TD><input type="text" name="Receptor" required="required" value=></TD></TR>
<TR><TD>De    :</TD><TD><input type="text" width="1000" name="Emisor" required="required" value=></TD></TR>
<TR><TD>Asunto:</TD><TD><input type="text" name="Asunto" required="required" value=></TD></TR>
<TR><TD>Fecha :</TD><TD> <input type="text" name="Fecha" required="required" value='<%=Fecha_ahora%>'></TD></TR>
</TABLE>
</form>
       
       <%
      String e="";
     String user="root";
     String clave="";
     String ruta="jdbc:mysql://localhost:3306/gestiontransporte";

    Connection conexion=null;
    Statement Sentencias = null;
    ResultSet tabla = null;
     Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
         tabla = Sentencias.executeQuery("SELECT * FROM filtro ");
%>
<center><p style="font-size: 20px">Registros Existentes </p></center><br>
<TABLE align=center>
<TR>
<th bgcolor=White>Equipo</th><th bgcolor=White>Aceite</th>
<th bgcolor=White>Aire</th><th bgcolor=White>Combustible</th>
<th bgcolor=White>Diesel</th><th bgcolor=White>Aceite Suministrado</th>
<th bgcolor=White>Estado</th><th bgcolor=White>Fecha Revision</th>
<th bgcolor=White>OPERACION</th> </TR>
<%
// ciclo de lectura del resultset

Calendar c1 = GregorianCalendar.getInstance();


Calendar actual = Calendar.getInstance();  

//Date f=new Date();

/*int dia=f.getDate();
int mes=f.getMonth();
int año=f.getYear();*/
//SimpleDateFormat format = new SimpleDateFormat("EEEE  d MMMMM yyyy");

SimpleDateFormat format = new SimpleDateFormat("d/M/yyyy");


actual.add(Calendar.MONTH, 1);
c1.add(Calendar.MONTH, 3);

//out.println("Fecha Formateada: "+format.format(c1.getTime()));
String Fecha_actual=format.format(c1.getTime());
//out.println( format.format(now));
Date base=new Date();
//tabla.next();
//base =tabla.getDate("Fecha_Revision");
/*if(base!=null){

//out.println(base);//2013-10-27

SimpleDateFormat format1 = new SimpleDateFormat("d/M/yyyy");
String s2=format1.format(base);
out.println( s2);
}*/

while(tabla.next()) {

out.println("<TR>");

out.println("<TD bgcolor=White>"+tabla.getInt(1) +"</TD>");

out.println("<TD bgcolor=White>"+tabla.getString(2)+"</TD>");

out.println("<TD bgcolor=White>"+tabla.getString(3)+"</TD>");

out.println("<TD bgcolor=White>"+tabla.getString(4)+"</TD>");

out.println("<TD bgcolor=White>"+tabla.getString(5)+"</TD>");
out.println("<TD bgcolor=White>"+tabla.getString(8)+"</TD>");
out.println("<TD bgcolor=White>"+tabla.getString(6)+"</TD>");
//out.println("<TD>"+tabla.getString(7)+"</TD>");

//out.println("<TD>"+Fecha_actual+"</TD>"); //10-27-2013
//SimpleDateFormat format1 = new SimpleDateFormat("d/M/yyyy");
String fecha_base=tabla.getString("Fecha_Revision");//se obtiene de la base de datos
out.println("<TD bgcolor=White>"+fecha_base+"</TD>");

out.println("<TD bgcolor=White>"+"<a href=ModificarRepuesto.jsp?idunidad="+tabla.getInt(1)+">"+"Aplicar Mantenimiento"+"</a>"+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE>");


%>
  </table>      
<br><br><br>
<center><p style="font-size: 15px"><strong>Observaciones</strong></p></center><br>
    <center><textarea rows="5" cols="100" name="texto"></textarea></center>
    

   </body>
</html>
