<%@page import="java.sql.Time"%> 
<%@page import="java.util.Date"%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
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
    
     //valido el descanso
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
    if (document.form1.minutos.value==-1){
       alert("Seleccione los minutos")
       document.form1.minutos.focus()
       return 0;
    }
     if (document.form1.hora.value<00||document.form1.hora.value>24){
       alert("La hora debe estar entre 1 y 24")
       document.form1.hora.focus()
       return 0;
    }
    if (document.form1.minutos.value<-1||document.form1.minutos.value>59){
       alert("Los minutos deben estar entre 0 y 59")
       document.form1.minutos.focus()
       return 0;
    }
    
   //el formulario se envia
    alert("La informacion esta siendo procesada, presione Aceptar para continuar");
    document.form1.submit();
}
function avisoreset()//Función
{
document.form1.reset()//se borrarán los campos del formulario
}
function Solo_Numerico(variable){
        Numer=parseInt(variable);
        if (isNaN(Numer)){
            return "";
        }
        return Numer;
    }
    function ValNumero(Control){
        Control.value=Solo_Numerico(Control.value);
    }
</script>


</head>

<body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
            <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>

    
                
    <%

String id=request.getParameter("texto");

        ResultSet ver;
        boolean existe=false;
        String idleido="";
        String verifica="select idsolicitud from solicitudtransporte";
        ver=sql.executeQuery(verifica);
        while(ver.next()){
          idleido=(ver.getObject("idsolicitud")).toString();
          if(idleido.equals(id)){
             existe=true;
          }          
        }
//out.print(id);
      if(existe){
        //response.sendRedirect("update2.jsp?jaja="+id);
         try{
        
        ResultSet rs;
        String con="select * from solicitudtransporte where idsolicitud="+id+";";
        rs=sql.executeQuery(con);
       while (rs.next()){
                   
         
         String de=rs.getString("Solicitante"); 
         String par=rs.getString("EncargadoTransporte"); 
         Date fechaSol=rs.getDate("Fechasolicitud");
         String tipoActividad=rs.getString("Descripcion");
         Time horMin=rs.getTime("Hora");
         String hor=horMin.toString().substring(0, 2); 
         String min=horMin.toString().substring(3, 5); 
                                        
         Date diaRealizar=rs.getDate("diarealizar");
         String lugarActividad=rs.getString("DireccionLugar");
          %> 
 <form name="form1" method="set" align="center" action="update2.jsp">     
                
    <table width="662" border="0" align="center"> 
    <tr>
          
   
      <td colspan="2"><div align="center"> 
<br><center><p style="font-size: 23px"><strong>ACTUALIZAR SOLICITUDES DE TRANSPORTE</strong></p></center><br><br>
            <br><br>
      </div></td> 
      
    </tr> 
    <tr>
      <th width="227" scope="row"><div align="left">Para</div></th> 
      <td width="155">
        
        <input type="text" name="para" value="<%= par %>">    
        
      <td align="left">(Encargado de transporte)</td> 
      <td></td> 
    </tr> 
    <tr>
      <th width="227" scope="row"><div align="left">De</div></th> 
      <td><label> 
        <input type="text" name="de" value="<%= de %>"/> 
      </label></td> 
      <td>&nbsp;</td> 
    </tr> 
    <tr>
      <th width="227" scope="row"><div align="left">Fecha de Solicitud</div></th> 
      <td>
      <div><input name="fecha" type="text" class="tcal" readonly="readonly" value="<%= fechaSol %>"/></div> 
      </td>
      
    </tr>
    <tr>
      <th width="227" scope="row"><div align="left">Transporte para la actividad de</div></th>
      <td><label>
        <input type="text" name="actividad" value="<%= tipoActividad %>"/>
      </label></td>
      
    </tr> 
    <tr> 
        <th width="227" scope="row"><div align="left">Dia a realizarse</div></th>
        <td> 
        <div><input name="dia" type="text" class="tcal" readonly="readonly" value="<%= diaRealizar %>"/></div>
       </td>
        <td>
      <label>Hora</label>
      <input type="number" name="hora" min="00" max="24" value="<%= hor %>" contenteditable="false"/>
      :<input type="number" name="minutos" min="00" max="59" value="<%= min %>" contenteditable="false"/><br /><br />
        Formato de 24 horas(Horas:Minutos)</td>
    </tr>
    <tr>
      <th width="227" scope="row"><div align="left">Lugar a realizarse</div></th>
      <td><label>
        <input type="text" name="lugar" value="<%= lugarActividad %>" />
      </label></td>
      <td><label>
        <input type="hidden" name="ide" value="<%= id %>" />
      </label></td>
     
    </tr> 
        
   
    
     

  <%     
      }
      
      //rs.close();
   
   }catch (Exception e){
   // Error en algun momento.
   out.println("Excepcion "+e);
 e.printStackTrace();
}
                  
%>
  </table> 
    <br></br>
    <br></br>
     
</form>
    
  <center><input type="submit" value="Guardar" align="center" onclick="valida_envia()"/></center>

      <% 
      }else{
            
       out.print("EL ID que digito no existe");
            }
      %>

<br></br>
<br></br>
<a href="actualizar.jsp" style="margin-left: 100px">Atras</a>
      
</body> 
</html> 
