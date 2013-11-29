<%-- 
    Document   : ModificarMotorista1
    Created on : 11-25-2013, 10:40:22 PM
    Author     : Elmer Arnoldo Menjivar Ramos
--%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
       
    <title>Modificar Programacion Local</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="js/validarMotoristas.js"></script>
     
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
  
    <jsp:useBean id="programacionlocal" scope="request" class="sv.edu.ues.dsi215.login.dominio.ProgramacionLocal" />
    <div class="container">
        <div class="panel panel-warning">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Modificar Programacion Local</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="modificar_programacion_local" method="post" action="ModificarProgramacionLocalController">

                    <div class="form-group">
                        <label for="correlativo" class="col-lg-4 control-label">Correlativo:</label>
                        <div class="col-lg-4">
                            <input type="text" name="correlativo" class="form-control" id="correlativo" maxlength="10"  value="<jsp:getProperty name="programacionlocal" property="correlativo" />" readonly />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="motorista" class="col-lg-4 control-label">Motorista:</label>
                        <div class="col-lg-4">
                            <input type="text" name="motorista" class="form-control" id="motorista" maxlength="60"  onkeypress="return permite(event, 'carac')" required value="<jsp:getProperty name="programacionlocal" property="motorista" />" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="unidad" class="col-lg-4 control-label">Unidad Disponible:</label>
                        <div class="col-lg-4">
                            <input type="text" name="unidad" class="form-control" id="unidad" value="<jsp:getProperty name="programacionlocal" property="unidad" />" maxlength="30" onkeypress="return permite(event, 'carac')" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="numequipo" class="col-lg-4 control-label">N° de Equipo:</label>
                        <div class="col-lg-4">
                            <input type="text" name="numequipo" class="form-control" id="numequipo" value="<jsp:getProperty name="programacionlocal" property="numequipo" />" maxlength="11"  onkeypress="return permite(event, 'num')" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="ectividad" class="col-lg-4 control-label">Actividad:</label>
                        <div class="col-lg-4">
                            <input type="text" name="actividad" class="form-control" id="actividad" value="<jsp:getProperty name="programacionlocal" property="actividad" />" required/>
                        </div>
                    </div>

                     
                  <div class="form-group">
                        <label for="fechaactividad" class="col-lg-4 control-label">Fecha de la Actividad:</label>
                        <div class="col-lg-4">
                            <input type="date" name="fechaactividad"  value="<jsp:getProperty name="programacionlocal" property="fechaactividad" />" id="fecha" class="form-control" required/>
                        </div>
                    </div>
                            
                  <div class="form-group">
                        <label for="horainicio" class="col-lg-4 control-label">Hora de Inicio:</label>
                        <div class="col-lg-4">
                            <input type="time" name="horainicio"  value="<jsp:getProperty name="programacionlocal" property="horainicio" />" id="horainicio" class="form-control" required/>
                        </div>
                    </div>
                            
                  <div class="form-group">
                        <label for="duracionactividad" class="col-lg-4 control-label">Duracion Estimada:</label>
                        <div class="col-lg-4">
                            <input type="time" name="duracionactividad"  value="<jsp:getProperty name="programacionlocal" property="duracionactividad" />" id="duracionactividad" class="form-control" required/>
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="unidadrequerida" class="col-lg-4 control-label">Unidad Requerida:</label>
                        <div class="col-lg-4">
                            <input type="text" name="unidadrequerida" class="form-control" id="unidadrequerida" value="<jsp:getProperty name="programacionlocal" property="unidadrequerida" />" maxlength="30" onkeypress="return permite(event, 'carac')" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="estado" class="col-lg-4 control-label">Estado Actual:</label>
                        <div class="col-lg-4">
                            <select name="estado" class="form-control" id="estado" required >
                                <option value="<jsp:getProperty name="programacionlocal" property="estado" />"><jsp:getProperty name="programacionlocal" property="estado" /></option>            
                    <option value="Programada">Programada</option>
                    <option value="Realizada">Realizada</option></select>
                        </div>
                    </div>
                    
                     <div class="form-group">
                <center class=""><br>
                  <p class="">Nota Importante: Antes de guardar la informacion, revise que todos los campos hayan sido llenados correctamente.</p><br>
                </center></div>
                
                    <center>
                        <input class="btn btn-success" type="submit" value="Modificar Programacion" />
                        <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='ConsultarProgramacionLocal.jsp'">
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