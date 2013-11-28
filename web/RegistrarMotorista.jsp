<%-- 
    Document   : RegistrarMotorista
    Created on : 11-23-2013, 10:47:42 PM
    Author     : Elmer Arnoldo Menjivar Ramos
--%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Registrar Motorista</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="js/validarMotoristas.js"></script>
    <link rel="stylesheet" type="text/css" href="tcal.css" />
    <script type="text/javascript" src="tcal.js"></script>    
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <%@ include file="WEB-INF/jspf/mask-unidad.jspf" %>
    
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registrar Motorista</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="registrar_motorista" method="post" action="RegistrarMotoristaController">

                    <div class="form-group">
                        <label for="licencia" class="col-lg-4 control-label">N° de Licencia:</label>
                        <div class="col-lg-4">
                            <input type="text" name="licencia" class="form-control" id="licencia" maxlength="17" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nombres" class="col-lg-4 control-label">Nombres:</label>
                        <div class="col-lg-4">
                            <input type="text" name="nombres" class="form-control" id="nombres" maxlength="30"  onkeypress="return permite(event, 'carac')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="apellidos" class="col-lg-4 control-label">Apellidos:</label>
                        <div class="col-lg-4">
                            <input type="text" name="apellidos" class="form-control" id="apellidos" maxlength="30" onkeypress="return permite(event, 'carac')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dui" class="col-lg-4 control-label">N° de DUI:</label>
                        <div class="col-lg-4">
                            <input type="text" name="dui" class="form-control" id="dui" maxlength="10" onkeyup="mascara(this,'-',patron1,true)" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="telefono" class="col-lg-4 control-label">Telefono:</label>
                        <div class="col-lg-4">
                            <input type="text" name="telefono" class="form-control" id="telefono" maxlength="9" onkeyup="mascara(this,'-',patron,true)" onkeypress="return permite(event, 'num')" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="direccion" class="col-lg-4 control-label">Direccion:</label>
                        <div class="col-lg-4">
                            <input type="text" name="direccion" class="form-control" id="direccion" maxlength="200"  required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sexo" class="col-lg-4 control-label">Sexo:</label>
                        <div class="col-lg-4">
                            <select name="sexo" class="form-control" id="sexo" required>
                            <option value="">Selecciona..</option>
                    <option value="Masculino" >Masculino</option>
                    <option value="Femenino">Femenino</option></select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Fecha de Registro:</label>
                        <div class="col-lg-4">
                            <input type="text" required name="fecha"  id="fecha" class="tcal"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="estado" class="col-lg-4 control-label">Estado Actual:</label>
                        <div class="col-lg-4">
                            <select name="estado" class="form-control" id="estado" required >
                    <option value="Disponible">Disponible</option>
                    <option value="No Disponible">No Disponible</option></select>
                        </div>
                    </div>

                    <div class="form-group">
                <center class=""><br>
                  <p class="">Nota Importante: Antes de guardar la informacion, revise que todos los campos hayan sido llenados correctamente.</p><br>
                </center></div>
                
                    <center>
                        <input class="btn btn-success" type="submit" value="Registrar Motorista" />
                        <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='vistaAdministrador.jsp'">
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