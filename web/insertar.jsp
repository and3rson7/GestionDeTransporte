<%@page import="java.util.Date"%> 
<%@page import="java.util.GregorianCalendar"%> 
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
	
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="conexion.jsp" %>


<title>Solicitud de Transporte </title>
        <link rel="stylesheet" href="estilos/estilos-plantilla.css">
        <link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script>
        <script type="text/javascript">
           function valida_envia(){

     //valido el tarjeta
   
         if (document.form1.para.value.length==0){
       alert("Falta el nombre del encargado")
       document.form1.para.focus()
       return 0;
    }

     //valido el matricula
    if (document.form1.de.value.length==0){
       alert("Tiene que escribir remitente")
       document.form1.de.focus()
       return 0;
    }

    //valido el nombre
    if (document.form1.fecha.value.length==0){
       alert("Tiene que escribir una fecha de solicitud")
       document.form1.fecha.focus()
       return 0;
    }

     //valido el turno
    if (document.form1.actividad.value.length==0){
       alert("Tiene que seleccionar una actividad")
       document.form1.actividad.focus()
       return 0;
    }
    
     //valido el horario
    if (document.form1.dia.value.length==0){
       alert("Tiene que seleccionar un dia")
       document.form1.dia.focus()
       return 0;
    }
    
    if (document.form1.lugar.value.length==0){
       alert("Seleccione un lugar")
       document.form1.lugar.focus()
       return 0;
    }
    if (document.form1.hora.value==00){
       alert("Seleccione Hora")
       document.form1.hora.focus()
       return 0;
    }
    if (document.form1.tipoUnidad.value==1){
       alert("Seleccione El tipo de Unidad solicitada")
       document.form1.tipoUnidad.focus()
       return 0;
    }
    if (document.form1.horaAprox.value==00){
       alert("Digite la duracion aproximada de la actividad")
       document.form1.horaAprox.focus()
       return 0;
    } 
    var dif_dias;
    var fecha1=document.form1.fecha.value
    var dia1=document.form1.dia.value
    
    var dif_fecha =new Date(Date.parse(dia1)-Date.parse(fecha1)).toLocaleDateString();
    var acomodar_dias=dif_fecha.toString().substring(0, 2);
    var ultimoValor_dia=acomodar_dias.substring(1, 2);
    if(ultimoValor_dia=='/'){
        dif_dias=acomodar_dias.substring(0, 1);
        }
     else{
         dif_dias=acomodar_dias;
        }
    if(dif_dias<=3){
        alert("Lo sentimos, NO es posible enviar una solicitud con solo "+dif_dias+" dias para realizarse...\nLe sugerimos presentarse con el encargado de transporte");
        document.form1.dia.focus()
        return 0;
    }        
    if(fecha1==dia1){
         alert("Lo sentimos, NO es posible enviar una solicitud para realizarse el mismo dia...\nLe sugerimos presentarse con el encargado de transporte");
         document.form1.dia.focus()
         return 0;
        }
    if(fecha1>dia1){
         alert("La fecha de realizacion de la actividad no puede ser menor a la fecha actual");
         document.form1.dia.focus()
         return 0;
        }
    
    //el formulario se envia
    alert("SOLICITUD REGISTRADA EXITOSAMENTE!!!\nPresione Aceptar para continuar...");
    document.form1.submit().de.focus();
}
function avisoreset()//Función
{
document.form1.reset()//se borrarán los campos del formulario
}
    function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
    function soloNumeros(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = "12345678";
       especiales = [];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
    function LetrasYnumeros(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " 0123456789áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
    function ValNumero(Control){
        Control.value=Solo_Numerico(Control.value);
    }
   
</script>


</head>

<body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
            <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
            
    
        <% 
        Calendar c = new GregorianCalendar();
        String dia,mes,annio,fecha_actual="";
        dia = Integer.toString(c.get(Calendar.DATE));
        mes = Integer.toString(c.get(Calendar.MONTH)+1);
        annio = Integer.toString(c.get(Calendar.YEAR));
        fecha_actual=annio+"-"+mes+"-"+dia;
        
        String Para=request.getParameter("para");
        String De=request.getParameter("de");
        String Dia=request.getParameter("dia");
        String Lugar=request.getParameter("lugar");
        String Actividad=request.getParameter("actividad");
        String Fecha=request.getParameter("fecha");
        String hor=request.getParameter("hora");
        String tipoUni=request.getParameter("tipoUnidad");
        String duracion=request.getParameter("horaAprox");
                       
      if(Para!=null&&De!=null&&Fecha!=null&&Actividad!=null&&Dia!=null&&Lugar!=null){
          
       String qry="insert into solicitudtransporte(Solicitante,EncargadoTransporte,Fechasolicitud,Descripcion,hora,diarealizar,DireccionLugar,tipoUnidad,tiempoAprox,estado) "
           + "values('"+De+"','"+Para+"','"+Fecha+"','"+Actividad+"','"+hor+"','"+Dia+"','"+Lugar+"','"+tipoUni+"','"+duracion+"','Pendiente')";
       sql.executeUpdate(qry);
      //out.print("Solicitud registrada!!!!");
      
      %>
      
      
     <%
   }
        
  // {
           
            %> 

            
            
            
            
<form name="form1" method="get" align="center" action="insertar.jsp">
  <table width="662" border="0" align="center"> 
    <tr>
      <td colspan="2"><div align="center"> 
          <br>
<br><center><p style="font-size: 25px"><strong>REGISTRAR SOLICITUDES DE TRANSPORTE</strong></p></center><br><br>
 
           <br><br>
      </div></td> 
       
    </tr> 
    <tr>
      <th width="264" scope="row"><div align="left">Para</div></th> 
      <td width="178">
        
      <label align="left"> 
       
          <input type="text" maxlength="100" name="para" value="Nelson Marroquin" align="left" onkeypress="return soloLetras(event)"/> 
        
      </label>
          
      <td width="194" align="left">(Encargado de transporte)</td> 
      <td width="8"></td>
    </tr> 
    <tr>
      <th width="264" scope="row"><div align="left">De</div></th> 
      <td><label> 
        <input type="text" maxlength="100" name="de" required onkeypress="return soloLetras(event)"/> 
      </label></td> 
      <td>&nbsp;</td> 
    </tr> 
    <tr>
      <th width="264" scope="row"><div align="left">Fecha de Solicitud</div></th> 
      <td>
          <div><input name="fecha" type="text" readonly="true" value="<%= fecha_actual%>"   /></div> 
      </td>
      
    </tr>
    <tr>
      <th width="264" scope="row"><div align="left">Transporte para la actividad de</div></th>
      <td><label>
        <input type="text" maxlength="250" name="actividad" onkeypress="return LetrasYnumeros(event)"/>
      </label></td>
      
    </tr> 
    <tr> 
        <th width="264" scope="row"><div align="left">Dia a realizarse</div></th>
        <td> 
        <div><input name="dia" type="text" class="tcal" value="" readonly="readonly"/></div>
        
       </td>
        <td>
        <label scope="row"><strong>Hora</strong></label>
      <input type= "time" name="hora" /><br>  
           (Ejemplo: 10:30 p.m)</td>
        
    </tr>
    <tr>
      <th width="264" scope="row"><div align="left">Lugar a realizarse</div></th>
      <td><label>
        <input type="text" maxlength="250" name="lugar" onkeypress="return LetrasYnumeros(event)"/>
      </label></td>
    </tr> 
        <tr>
         <th width="264" height="48" scope="row"><div align="left">Tipo de Unidad Solicitada</div></th>
        <td> <select name="tipoUnidad">
        <option value="1">Seleccione una unidad...</option> 
        <option value="Pickhut">Pickhut</option> 
        <option value="Camion">Camion</option>
        <option value="Bus">Bus</option> 
        <option value="Ambulancia">Ambulancia</option> 
        <option value="Camion de Basura">Camion de Basura</option> 
            </select></td>
        </tr>
       <tr>
         <th width="264" height="10" scope="row"><div align="left">Duracion Aproximada de la Actividad</div></th>
         <td><input align="left" size="5" type="text" maxlength="1" name="horaAprox" onkeypress="return soloNumeros(event)"/> 
      <th width="194" height="10" scope="row"><div align="left">Horas</div></th> 
            </td>
        </tr>
          


  </table> 
    <br></br>
    <br></br>
     
</form>
  <table width="269" height="38" border="0" align="center" action="">
      
  <tr>
    <td width="10"></td>
    <td width="67"><input type="submit" value="Guardar" align="center" onclick="valida_envia()"/>
    <td width="64"><input type="button" value="Limpiar" align="center" onClick="avisoreset()" /></td>
    </tr>
</table>
 
</body> 
</html> 
