<%@ page import="java.io.*,java.util.*,java.util.Date,java.net.*,java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Gesti�n de Transporte</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body language="javascript" onbeforeunload="return window_onbeforeunload()" style="background: linear-gradient(#D8D8D8, #39C, #39C)">
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    
    <p style="font-family:Cambria;color:black;font-size:50px;text-align: center;">
        <strong>Alcald�a Municipal de Cuscatancingo</strong>
    </p>
    
    <%@ include file="WEB-INF/jspf/slide.jspf" %>
    
    <%@ include file="WEB-INF/jspf/pie-pagina.jspf" %>
    
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
        //out.println(Fecha_actual);
        tabla = Sentencias.executeQuery("SELECT `Equipo`,`Fecha_Revision` FROM filtro where `Fecha_Revision`='"+Fecha_actual+"'");
         
        /*tabla.next();
         * out.println(tabla.getString("Fecha_Revision"));
         */
        
        int j = 0;
        String Fecha_base = "";
        String Revisiones = "";
        String Revisiones1 = "";
        int equipo = 0;
        int[] Array = new int[100];
        
        while (tabla.next()) {
            Fecha_base = tabla.getString("Fecha_Revision");//Formateando fecha de la base
            equipo = tabla.getInt("Equipo");
            //String Fecha_base1=Fecha_base;
            Array[j] = equipo;
            Revisiones = "" + Array[j] + ",";
            Revisiones1 = Revisiones1.concat(Revisiones);
            Revisiones = Revisiones1;
            j++;
        };
        
            Revisiones = "Los Equipos:" + Revisiones + "necesita mantenimiento ";
            //conexion.close();
            //out.println(equipo);
            //out.println(Revisiones);
        
        //Comaparando fechas
        if(Fecha_base.equals(Fecha_actual)){
            HttpSession sesion = request.getSession();
            Date acceso = new Date(sesion.getLastAccessedTime());
            //out.println("�ltimo acceso: " + acceso + "<br>");
            SimpleDateFormat format1 = new SimpleDateFormat(" d M yyyy H mm");
            String Fecha_acceso = format1.format(acceso);
            //out.println("<br>" + Fecha_acceso);
            
            Date actual = new Date();
           // out.println("<br>�ltimo actual: " + actual + "<br>");
            SimpleDateFormat format3 = new SimpleDateFormat(" d M yyyy H mm");
            String Fecha_ahora = format3.format(actual);
           // out.println("<br>" + Fecha_ahora);
            
            if(Fecha_ahora.equals(Fecha_acceso)){
            //if(actual.equals(acceso)){
    %>
                <script>
                    //var array reisiones[]=new array[10];
                    var rev='<%=Revisiones%>';
                    var l=<%=equipo%>
                    alert(rev);
                </script>
    <% 
            }
            conexion.close();
        }
    %>    
    
  </body>
</html>