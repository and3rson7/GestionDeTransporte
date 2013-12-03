<%-- 
    Document   : estado1
    Created on : 12-02-2013, 12:25:15 PM
    Author     : VICTOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
 <%@ include file="WEB-INF/jspf/menu-jefe de taller.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estado Unidades</title>
    </head>
   
       
  <body>

      <div class="container">
          <div class="panel panel-info">
              <!-- Default panel contents -->
              <div class="panel-heading" style="text-align: center;">Consultar Estado Unidades de Transporte</div>
              <div class="panel-body">
                  <table id="mi_tabla" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
                      <thead>
                          <tr>
                             
                        <th bgcolor=White>Equipo</th>
                        <th bgcolor=White>Estado</th>
                        <th bgcolor=White>Fecha Revision</th>
                        
                          </tr>
                      </thead>
                      <tbody>
                          <%
    Date f=new Date();

/*int dia=f.getDate();
int mes=f.getMonth();
int año=f.getYear();*/
SimpleDateFormat format3 = new SimpleDateFormat("EEEE  d MMMMM yyyy");
String Fecha_ahora=format3.format(f);

%>
    
    
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
       
        //tabla = Sentencias.executeQuery("SELECT `Equipo`,`Estado`,`Fecha_Revision` FROM filtro where `Fecha_Revision`='"+Fecha_actual+"'");
        tabla = Sentencias.executeQuery("SELECT `Equipo`,`Estado`,`Fecha_Revision` FROM filtro");

%>   
                          <%
                            
        // ciclo de lectura del resultset

//Calendar c1 = GregorianCalendar.getInstance();


Calendar actual = Calendar.getInstance();  

//SimpleDateFormat format = new SimpleDateFormat("EEEE  d MMMMM yyyy");

//SimpleDateFormat format = new SimpleDateFormat("d/M/yyyy");
actual.add(Calendar.MONTH, 1);

c1.add(Calendar.MONTH, 3);
//String Fecha_actual=format.format(c1.getTime());
Date base=new Date();
while(tabla.next()) {

out.println("<TR>");

out.println("<TD bgcolor=White>"+tabla.getInt(1) +"</TD>");//Equipo

//out.println("<TD bgcolor=White>"+tabla.getString(2)+"</TD>");//Aceita

//out.println("<TD bgcolor=White>"+tabla.getString(3)+"</TD>");//Gasolina

//out.println("<TD bgcolor=White>"+tabla.getString(4)+"</TD>");//Diesel

//out.println("<TD bgcolor=White>"+tabla.getString(5)+"</TD>");//Aceite suministrado
out.println("<TD bgcolor=White>"+tabla.getString(2)+"</TD>");//Estado
//out.println("<TD bgcolor=White><select name='Estado'><option value='Disponible'>Disponible</option><option value='No Disponible'>No Disponible</option></select></TD>");
String fecha_base=tabla.getString("Fecha_Revision");//se obtiene de la base de datos
out.println("<TD bgcolor=White>"+fecha_base+"</TD>");

//out.println("<TD bgcolor=White>"+"<a href=ModificarEstado.jsp?idunidad="+tabla.getInt(1)+"&Estado="+tabla.getString(2)+">"+"Enviar Mantenimiento"+"</a>"+"</TD>");
 
out.println("</TR>"); }; // fin while
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
                  <form class="form-inline" role="form" method="post" onsubmit="return confirm('¿Estás seguro que quieres realizar esta acción?');" action="ModificarEstado.jsp">
                      <label for="placa">Equipo:</label>
                      <input type="text" name="idunidad" id="placa" class="form-control" style="width: 100px; margin-left: 20px; margin-right: 20px;" required>
                      <select name="Estado"> 
                          <option value="Disponible">Disponible
                              
                          </option>
                          
                          <option value="No Disponible">No Disponible </option>
                          
                    
                     </select> 
                        <input type="submit"  value="Modificar Estado >>" class="btn btn-warning" onclick="">
                  </form>
              </div>
          </div>
      </div>
  </body>
    </body>
</html>
