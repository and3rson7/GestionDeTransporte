<%-- 
    Document   : ModificarMotorista1
    Created on : 11-25-2013, 10:40:22 PM
    Author     : Elmer Arnoldo Menjivar Ramos
--%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
       
    <title>Eliminar Registro de Motorista</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="js/validarMotoristas.js"></script>
    
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
  
    <jsp:useBean id="motorista" scope="request" class="sv.edu.ues.dsi215.login.dominio.Motorista" />
    <div class="container">
        <div class="panel panel-warning">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Eliminar Registro de Motorista</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="eliminar_motorista" method="post" action="EliminarMotoristaController">

                    <div class="form-group">
                        <label for="licencia" class="col-lg-4 control-label">N° de Licencia:</label>
                        <div class="col-lg-4">
                            <input type="text" name="licencia" class="form-control" id="licencia" maxlength="17" onkeyup="mascara(this,'-',patron2,true)" onkeypress="return permite(event, 'num')" value="<jsp:getProperty name="motorista" property="licencia" />" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="nombres" class="col-lg-4 control-label">Nombres:</label>
                        <div class="col-lg-4">
                            <input type="text" name="nombres" class="form-control" id="nombres" maxlength="30"  onkeypress="return permite(event, 'carac')" value="<jsp:getProperty name="motorista" property="nombres" />" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="apellidos" class="col-lg-4 control-label">Apellidos:</label>
                        <div class="col-lg-4">
                            <input type="text" name="apellidos" class="form-control" id="apellidos" value="<jsp:getProperty name="motorista" property="apellidos" />" maxlength="30" onkeypress="return permite(event, 'carac')" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dui" class="col-lg-4 control-label">N° de DUI:</label>
                        <div class="col-lg-4">
                            <input type="text" name="dui" class="form-control" id="dui" value="<jsp:getProperty name="motorista" property="dui" />" maxlength="10" onkeyup="mascara(this,'-',patron1,true)" onkeypress="return permite(event, 'num')"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="telefono" class="col-lg-4 control-label">Telefono:</label>
                        <div class="col-lg-4">
                            <input type="text" name="telefono" class="form-control" id="telefono" value="<jsp:getProperty name="motorista" property="telefono" />" maxlength="9" onkeyup="mascara(this,'-',patron,true)" onkeypress="return permite(event, 'num')"  readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="direccion" class="col-lg-4 control-label">Direccion:</label>
                        <div class="col-lg-4">
                            <input type="text" name="direccion" class="form-control" id="direccion" value="<jsp:getProperty name="motorista" property="direccion" />" maxlength="200" readonly/>
                        </div>
                    </div>
                       
                   <div class="form-group">
                        <label for="sexo" class="col-lg-4 control-label">Sexo:</label>
                        <div class="col-lg-4">
                            <input type="text" name="sexo"  value="<jsp:getProperty name="motorista" property="sexo" />" id="fecha" class="form-control" readonly/>
                        </div>
                    </div>
                        
                   <div class="form-group">
                        <label for="fecha" class="col-lg-4 control-label">Fecha de Registro:</label>
                        <div class="col-lg-4">
                            <input type="text" name="fecha"  value="<jsp:getProperty name="motorista" property="fecha" />" id="fecha" class="form-control" readonly/>
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="estado" class="col-lg-4 control-label">Estado Actual:</label>
                        <div class="col-lg-4">
                            <input type="text" name="estado"  value="<jsp:getProperty name="motorista" property="estado" />" id="fecha" class="form-control" readonly/>
                        </div>
                    </div>
                    
                     <div class="form-group">
                <center class=""><br>
                  <p class="">Nota Importante: ¿Esta seguro de querer borrar este registro por completo?.</p><br>
                </center></div>
                
                    <center>
                        <input class="btn btn-success" type="submit" value="Eliminar Motorista" />
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