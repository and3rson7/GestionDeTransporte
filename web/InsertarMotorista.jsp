<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Motorista</title>
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
        <link rel="stylesheet" href="estilos/estilos-plantilla.css"/>
        <script type="text/javascript" src="js/validarMotoristas.js"></script>
        <link rel="stylesheet" type="text/css" href="tcal.css" />
        <script type="text/javascript" src="tcal.js"></script>    
</head>
<body style="height: 650px; background: linear-gradient(#D8D8D8, #39C, #39C)">
   <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
<p>&nbsp;</p>
<table width="575" height="109" border="0"align="center">
  <tr>
    <td width="399">&nbsp;</td>
    <td width="166" rowspan="4"><img src="cuscatancingo.jpg" width="110" height="105" align="right" /></td>
  </tr>
  <tr>
    <th><div align="center">ALCALDIA MUNICIPAL DE CUSCATANCINGO</div></th>
  </tr>
  <tr>
    <th><div align="center">REGISTRO DE MOTORISTAS</div></th>
  </tr>
</table>

        <center>
      
           <form action="InsertarRegistro.jsp" method="post" name="formAgregar">
            <table align="center">               
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Licencia</span></div></th>                    
                    <td><input type="text" style="background-color:#AAFBFC" name="licencia" maxlength="17" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" required />Sin espacios, ni guiones</td>
                </tr>

                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Nombres</span></div></th>
                    <td><input type="text" style="background-color:#AAFBFC" name="nombres" maxlength="30" onkeypress="return permite(event, 'carac')" required /></td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Apellidos</span></div></th>
                    <td><input type="text" style="background-color:#AAFBFC" name="apellidos" maxlength="30" onkeypress="return permite(event, 'carac')" required  /></td>
                </tr>
                <tr>
                    <th width="227" scope="row"><div align="left"><span class="">Dui</span></div></th>
                    <td><input type="text" style="background-color:#AAFBFC" name="dui" maxlength="10" onkeyup="mascara(this,'-',patron1,true)" onkeypress="return permite(event, 'num')" required/>Sin espacios, ni guiones</td>
                </tr>
                 <tr>
                     <th width="227" scope="row"><div align="left"><span class="">Telefono</span></div></th>
                    <td><input name="telefono" type="text"  style="background-color:#AAFBFC" maxlength="9" onkeyup="mascara(this,'-',patron,true)" onkeypress="return permite(event, 'num')" required/> Sin espacios, ni guiones</td>
                 </tr>
                 <tr>
                     <th width="227" scope="row"><div align="left"><span class="">Direccion</span></div></th>
                    <td><input name="direccion" type="text" style="background-color:#AAFBFC" onkeypress="return permite(event, 'num_car')" required/></td>
                 </tr>
                 <tr>
                     <th width="227" scope="row"><div align="left"><span class="" >Sexo</span> </div></th>
                    <td><div class=""><select name="sexo"  style="background-color:#AAFBFC" required>
                            <option value="">Selecciona..</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Femenino">Femenino</option></select>
                  </div></td>
                </tr> 
                <tr>
                <th width="227" scope="row"><div align="left">Fecha de Registro</div></th> 
                <td>
                 <div><input name="fecha" type="text" class="tcal" value="" style="background-color:#AAFBFC" required/></div> 
                </td>
               </tr>
                 <tr>
                     <th width="227" scope="row"><div align="left"><span class="">Estado</span></div></th>
                    <td><div class=""><select name="estado" style="background-color:#AAFBFC" required >
                    <option value="Disponible">Disponible</option>
                    <option value="No Disponible">No Disponible</option></select>
                  </div></td>
                </tr>
                <tr>
                <td colspan="2"><center class=""><br>
                  <p class="">Nota Importante: Antes de guardar la informacion, revise que todos los campos hayan sido llenados correctamente.</p><br>
                  </center></td>
                </tr>
            </table>
            <p>
                <input type="submit" value="Guardar"/> 
                <input type="reset" value="Limpiar" name="limpiar"/>
          </p>
        </form>
    </center>    
 </body>
</html>