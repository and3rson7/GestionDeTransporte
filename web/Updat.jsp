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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
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
    if (document.form1.tipoUnidad.value==1){
       alert("Seleccione El tipo de Unidad solicitada")
       document.form1.tipoUnidad.focus()
       return 0;
    }
    if (document.form1.horaAprox.value.length==00){
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
    if(Date.parse(fecha1)>Date.parse(dia1)){
         alert("La fecha de realizacion de la actividad no puede ser menor o igual a la fecha actual");
         document.form1.dia.focus()
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

<body>
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
        String con="select Solicitante,EncargadoTransporte,FechaSolicitud,Descripcion,Hora,diarealizar,DireccionLugar,tipoUnidad,tiempoAprox from solicitudtransporte where idsolicitud="+id+";";
        rs=sql.executeQuery(con);
       while (rs.next()){
                   
         
         String de=rs.getString("Solicitante"); 
         String par=rs.getString("EncargadoTransporte"); 
         Date fechaSol=rs.getDate("Fechasolicitud");
         String tipoActividad=rs.getString("Descripcion");
         Time horMin=rs.getTime("Hora");
         
                                        
         Date diaRealizar=rs.getDate("diarealizar");
         String lugarActividad=rs.getString("DireccionLugar");
         String tipounidad=rs.getString("tipoUnidad");
         String tiempoaprox=rs.getString("tiempoAprox");
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
        
        <input type="text" class="form-control" name="para" value="<%= par %>">    
        
      <td align="left">(Encargado de transporte)</td> 
      <td></td> 
    </tr> 
    <tr>
      <th width="227" scope="row"><div align="left">De</div></th> 
      <td><label> 
        <input type="text" class="form-control" name="de" value="<%= de %>"/> 
      </label></td> 
      <td>&nbsp;</td> 
    </tr> 
    <tr>
      <th width="227" scope="row"><div align="left">Fecha de Solicitud</div></th> 
      <td>
      <div><input name="fecha" type="date" class="form-control" readonly="readonly" value="<%= fechaSol %>"/></div> 
      </td>
      
    </tr>
    <tr>
      <th width="227" scope="row"><div align="left">Transporte para la actividad de</div></th>
      <td><label>
        <input type="text" name="actividad" class="form-control" value="<%= tipoActividad %>"/>
      </label></td>
      
    </tr> 
    <tr> 
        <th width="227" scope="row"><div align="left">Dia a realizarse</div></th>
        <td> 
        <div><input name="dia" type="text" class="tcal" readonly="readonly" value="<%= diaRealizar %>"/></div>
       </td>
        <td>
      <label>Hora</label>
      <input type="time" name="hora" class="form-control" value="<%= horMin %>" contenteditable="false"/></td>
    </tr>
    <tr>
      <th width="227" scope="row"><div align="left">Lugar a realizarse</div></th>
      <td><label>
        <input type="text" class="form-control" name="lugar" value="<%= lugarActividad %>" />
      </label></td>
      <td><label>
        <input type="hidden" class="form-control" name="ide" value="<%= id %>" />
      </label></td>
     
    </tr> 
      <tr>
         <th width="264" height="48" scope="row"><div align="left">Tipo de Unidad Solicitada</div></th>
         <td> <select class="form-control" name="tipoUnida" > 
                 <option value="<%=tipounidad%>"><%=tipounidad%></option> 
                 <option value="Pickhut" >Pickhut</option> 
                 <option value="Camion" >Camion</option>
                 <option value="Bus" >Bus</option> 
                 <option value="Ambulancia" >Ambulancia</option> 
                 <option value="Camion de Basura" >Camion de Basura</option> 
            </select></td>
        </tr>
       <tr>
         <th width="264" height="10" scope="row"><div align="left">Duracion Aproximada de la Actividad</div></th>
         <td><input align="left" class="form-control" size="5" type="text" maxlength="1" name="horaAprox" value="<%=tiempoaprox%>"onkeypress="return soloNumeros(event)"/> 
      <th width="194" height="10" scope="row"><div align="left">Horas</div></th> 
            </td>
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
     <center><input type="submit" class="btn btn-success" value="Guardar" align="center" onclick="valida_envia()"/></center>
</form>
    
  

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
