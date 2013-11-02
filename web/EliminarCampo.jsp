<%@ page language="java" contentType="text/html"  pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
 
<!DOCTYPE html >

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Eliminando Registro</title>
        <script type="text/javascript">
var patron = new Array(4,4)
var patron1 = new Array(8,1)
var patron2 = new Array(4,6,3,1)
function mascara(d,sep,pat,nums){
if(d.valant != d.value){
	val = d.value
	largo = val.length
	val = val.split(sep)
	val2 = ''
	for(r=0;r<val.length;r++){
		val2 += val[r]	
	}
	if(nums){
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
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <script type="text/javascript" src="js/validarMotoristas.js"></script>
        <link rel="stylesheet" type="text/css" href="tcal.css" />
        <script type="text/javascript" src="tcal.js"></script>       
</head>
<body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
 <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>
     <%
String codigo= request.getParameter("licencia");//capturamos el valor
String user="root";
String clave="";
String ruta="jdbc:mysql://localhost:3306/gestiontransporte";
Connection conexion=null;
Statement Sentencias = null;
ResultSet tabla = null;

 Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion =DriverManager.getConnection(ruta,user,clave);
        Sentencias = conexion.createStatement();
        tabla = Sentencias.executeQuery("Select * From motorista Where Licencia='"+codigo+"'");
        //hacemos esa consulta con filtro a la base de datos
         while(tabla.next())//soltamos los registros y combinamos el html con jsp objetos
             //con el value
            {
         String licencia = tabla.getString("licencia"); 
         String nombres = tabla.getString("nombres"); 
         String apellidos = tabla.getString("apellidos");
         String dui = tabla.getString("dui");
         String telefono = tabla.getString("telefono");
         String direccion = tabla.getString("direccion");
         String sexo = tabla.getString("sexo");
         Date fecha1 = tabla.getDate("fechaingreso");
         String estado = tabla.getString("estado");
             %>
<p>&nbsp;</p>
<table width="575" height="109" border="0"align="center">
  <tr>
    <td width="399">&nbsp;</td>
    <td width="166" rowspan="4"><img src="cuscatancingo.jpg" width="110" height="105" align="right" /></td>
  </tr>
  <tr>
    <td><div align="center">ALCALDIA MUNICIPAL DE CUSCATANCINGO</div></td>
  </tr>
  <tr>
    <td><div align="center">ELIMINAR REGISTRO DE MOTORISTA</div></td>
  </tr>
 
</table>

        <center>
      
           <form action="EliminarM.jsp" method="post" name="FormElimnar">
            <table align="center">
                <tr>
                  <td width="179"><span class="">Informacion Basica Requerida</span></td>
                  <td width="767">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Licencia</span></div></th>                    
                 <td><input type="text" value="<%= licencia %>" style="background-color:#AAFBFC" name="licencia" maxlength="17" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" required />Sin espacios, ni guiones</td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Nombres</span></div></th>                    
                 <td><input type="text" value="<%= nombres %>" style="background-color:#AAFBFC" name="nombres" maxlength="30" onkeypress="return permite(event, 'carac')" required /></td>
                </tr>

                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Apellidos</span></div></th>
               <td><input type="text" value="<%= apellidos %>" style="background-color:#AAFBFC" name="apellidos" maxlength="30" onkeypress="return permite(event, 'carac')" required  /></td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Dui</span></div></th>
                <td><input type="text" value="<%= dui %>" style="background-color:#AAFBFC" name="dui" maxlength="9" onkeyup="mascara(this,'-',patron1,true)" onkeypress="return permite(event, 'num')" required/>Sin espacios, ni guiones</td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Telefono</span></div></th>
                <td><input type="text" value="<%= telefono %>" style="background-color:#AAFBFC" name="telefono" maxlength="9" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" required/>Sin espacios, ni guiones</td>
                </tr>
                 <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Direccion</span></div></th>
                <td><input type="text" value="<%= direccion %>" style="background-color:#AAFBFC" name="direccion" maxlength="200" required/></td>
                </tr>           
                 <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Sexo</span></div></th>
                <td><input type="text" value="<%= sexo %>" style="background-color:#AAFBFC" name="sexo" maxlength="9" onkeypress="return permite(event, 'carac')" required/></td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Fecha de Registro</span></div></th>
                <td><input type="text" value="<%= fecha1 %>" class="tcal" style="background-color:#AAFBFC" name="fecha" maxlength="12" required/></td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Estado</span></div></th>
                <td><input type="text" value="<%= estado %>" style="background-color:#AAFBFC" name="estado" maxlength="13" onkeypress="return permite(event, 'carac')" required/></td>
                </tr>
                <tr>
                <td colspan="2"><center class="">
                  <p class="">Nota Importante: Antes de guardar la informacion, revise que todos los campos hayan sido llenados correctamente.</p>
                  </center></td>
                </tr>
            </table>
                    <center>
            <p>
                <input type="submit" value="Eliminar"/> 
           </p>
                    </center>
        </form>
           </center>
                    <center><form action="EliminarMotorista.jsp"><p><input type="submit" value="Cancelar"></p></form></center>
                
             <%
            }
        tabla.close();//cerramos la conexion y listo ya tenemos los registros a modificar
%>
  </body>
</html>