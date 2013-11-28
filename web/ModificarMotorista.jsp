<%-- 
    Document   : ModificarMotorista1
    Created on : 11-25-2013, 10:40:22 PM
    Author     : Elmer Arnoldo Menjivar Ramos
--%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
       
    <title>Modificar Registro de Motorista</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="js/validarMotoristas.js"></script>
    <link rel="stylesheet" type="text/css" href="tcal.css" />
    <script type="text/javascript" src="tcal.js"></script>    
     
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
  
    <jsp:useBean id="motorista" scope="request" class="sv.edu.ues.dsi215.login.dominio.Motorista" />
    <div class="container">
        <div class="panel panel-warning">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Modificar Registro de Motorista</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="modificar_motorista" method="post" action="ModificarMotoristaController">

                    <div class="form-group">
                        <label for="licencia" class="col-lg-4 control-label">N° de Licencia:</label>
                        <div class="col-lg-4">
                            <input type="text" name="licencia" class="form-control" id="licencia" maxlength="17" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" value="<jsp:getProperty name="motorista" property="licencia" />" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nombres" class="col-lg-4 control-label">Nombres:</label>
                        <div class="col-lg-4">
                            <input type="text" name="nombres" class="form-control" id="nombres" maxlength="30"  onkeypress="return permite(event, 'carac')" required value="<jsp:getProperty name="motorista" property="nombres" />" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="apellidos" class="col-lg-4 control-label">Apellidos:</label>
                        <div class="col-lg-4">
                            <input type="text" name="apellidos" class="form-control" id="apellidos" value="<jsp:getProperty name="motorista" property="apellidos" />" maxlength="30" onkeypress="return permite(event, 'carac')" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dui" class="col-lg-4 control-label">N° de DUI:</label>
                        <div class="col-lg-4">
                            <input type="text" name="dui" class="form-control" id="dui" value="<jsp:getProperty name="motorista" property="dui" />" maxlength="10" onkeyup="mascara(this,'-',patron1,true)" onkeypress="return permite(event, 'num')" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="telefono" class="col-lg-4 control-label">Telefono:</label>
                        <div class="col-lg-4">
                            <input type="text" name="telefono" class="form-control" id="telefono" value="<jsp:getProperty name="motorista" property="telefono" />" maxlength="9" onkeyup="mascara(this,'-',patron,true)" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="direccion" class="col-lg-4 control-label">Direccion:</label>
                        <div class="col-lg-4">
                            <input type="text" name="direccion" class="form-control" id="direccion" value="<jsp:getProperty name="motorista" property="direccion" />" maxlength="200" required />
                        </div>
                    </div>
                     
                    <div class="form-group">
                        <label for="sexo" class="col-lg-4 control-label">Sexo:</label>
                        <div class="col-lg-4">
                            <select name="sexo" class="form-control" id="sexo" required>
                            <option value="<jsp:getProperty name="motorista" property="sexo" />"><jsp:getProperty name="motorista" property="sexo" /></option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Femenino">Femenino</option></select>
                        </div>
                    </div>
            
                <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Fecha de Registro:</label>
                        <div class="col-lg-4">
                            <input type="text" name="fecha"  value="<jsp:getProperty name="motorista" property="fecha" />" id="fecha" class="tcal" required/>
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="estado" class="col-lg-4 control-label">Estado Actual:</label>
                        <div class="col-lg-4">
                            <select name="estado" class="form-control" id="estado" required >
                                <option value="<jsp:getProperty name="motorista" property="estado" />"><jsp:getProperty name="motorista" property="estado" /></option>            
                    <option value="Disponible">Disponible</option>
                    <option value="No Disponible">No Disponible</option></select>
                        </div>
                    </div>
                    
                     <div class="form-group">
                <center class=""><br>
                  <p class="">Nota Importante: Antes de guardar la informacion, revise que todos los campos hayan sido llenados correctamente.</p><br>
                </center></div>
                
                    <center>
                        <input class="btn btn-success" type="submit" value="Modificar Motorista" />
                        <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='ConsultarMotorista.jsp'">
                    </center>
                </form>
            </div>
        </div>
    </div>
    <%
        if(request.getSession().getAttribute("message") != null) {%>
            <script type="text/javascript">
                alert('<%=request.getSession().getAttribute("message")%>');
            </script>
            <% request.getSession().removeAttribute("message");
        }
    %>
    
    <%@ include file="WEB-INF/jspf/validate-motorista.jspf" %>
  </body>
</html>