<%-- 
    Document   : InsertarRepeuesto
    Created on : 10-20-2013, 08:00:37 PM
    Author     : VICTOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificando Registro</title>
        <link rel="stylesheet" href="estilos/estilo.css">

        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <script type="text/javascript" src="Mascaras.js"></script>
        <script type="text/javascript" src="jquery.js"></script>
        
</head>
<body style="height: 850px; background: linear-gradient(#D8D8D8, #39C, #39C)">

<%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
<%

String user="root";
String clave="";
String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
Connection conexion=null;
Statement Sentencias = null;
ResultSet tablaREsultado = null;

 int idunidad =Integer.parseInt(request.getParameter("idunidad"));
 
 Class.forName("com.mysql.jdbc.Driver").newInstance();
       
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        tablaREsultado = Sentencias.executeQuery("Select * From filtro Where Equipo="+idunidad);
        
        //hacemos esa consulta con filtro a la base de datos
         while(tablaREsultado.next())//soltamos los registros y combinamos el html con jsp objetos
             //con el value
            {
           
                
             %>
<p>&nbsp;</p>
        <center>
            <form method="post" action="UpdateRepuesto.jsp">
            
            
		 
<section class="container">
    <div class="login">
        <h1>Mantenimiento de Unidad: <%=idunidad%></h1>
      
        <p>Equipo<input type="text" name="idunidad" readonly value=<% out.println(tablaREsultado.getString(1));%>></p>       
        <p>Filtro Aceite<input type="text" name="Aceite"  value=<% out.println(tablaREsultado.getString(2));%>></p>
      
        <p>Filtro Aire<input type="text" name="Aire"  value=<% out.println(tablaREsultado.getString(3));%>></p>
        
         <p>Filtro Gasolina<input type="text" name="Combustible"  value=<% out.println(tablaREsultado.getString(4));%>></p>
         <p>Filtro Diesel<input type="text" autocomplete="on" name="Diesel"  value=<% out.println(tablaREsultado.getString(5));%>></p>
           <p>Aceite Suministrado<input type="text" name="Codigo_Aceite"  value=<% out.println(tablaREsultado.getString(8));%>></p>
             <p>Estado<input type="text" autocomplete="on" name="Estado"  value=<% out.println(tablaREsultado.getString(6));%>></p>
             
          <%
            }
        tablaREsultado.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>
          
        
          <p class="submit1"><input type="submit" name="commit" value="Modificar" ></p>
   <form action="HojadeRepuesto.jsp">  <p class="submit1"><input type="submit" name="commit" value="Cancelar" ></p>
   <form/> </div>    
  </section>
 
 
        </form>
      
           
           </center>
    
                
             <script type="text/javascript">
var patron = new Array(2,6);
var patron1 = new Array(8,1)
var patron2 = new Array(4,6,3,1)
function mascara(d,sep,pat,char){
if(d.valant != d.value){
	val = d.value
	largo = val.length
	val = val.split(sep)
	val2 = ''
	for(r=0;r<val.length;r++){
		val2 += val[r]	
	}
	if(char){
		for(z=0;z<val2.length;z++){
			if(isNaN(val2.charAt(z))){
				letra = new RegExp(val2.charAt(z),"g")
				val2 = val2.replace(letra,"")
			}
		}
	}
	val = ''
	val3 = new Array()
	for(s=0; s<pat.length; s++){
		val3[s] = val2.substring(0,pat[s])
		val2 = val2.substr(pat[s])
	}
	for(q=0;q<val3.length; q++){
		if(q ==0){
			val = val3[q]
		}
		else{
			if(val3[q] != ""){
				val += sep + val3[q]
				}
		}
	}
	d.value = val
	d.valant = val
	}
}
</script> 
       
    </body>
</html>
