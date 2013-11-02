<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programacion de Actividades Locales</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="tcal.css" />
        <script type="text/javascript" src="tcal.js"></script>
        <script type="text/javascript" src="js/validarUnidades.js"></script>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <center>
            <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
                <strong>Programacion de las Actividades Locales</strong>
            </p>
        </center>
        
        <div class="well container">
            <form class="form-horizontal" role="form" id="registrar_detalle_bitacora_combustible" method="post" action="RegistrarProgramacionController">
                
                <div class="form-group">
                    <label for="correlativo" class="col-lg-4 control-label">Correlativo:</label>
                    <div class="col-lg-4">
                        <input type="text" name="correlativo" class="form-control" id="correlativo" value="${correlativo}" readonly />
                    </div>
                </div>
                 
                    <div class="form-group">
                    <label for="fecha" class="col-lg-4 control-label">Fecha de Registro:</label>
                    <div class="col-lg-4">
                        <input type="text" name="fecha" class="form-control" value="<%= new java.util.Date() %>"id="fecha" required />
                    </div>
                </div>
                    
                <div class="form-group">
                    <label for="unidadesSelect" class="col-lg-4 control-label">Vehiculos Disponibles:</label>
                    <div class="col-lg-4">
                        <select id="unidadesSelect" name="unidadesSelect" class="form-control">
                            <%
                                LinkedList<String> tipounidad = (LinkedList<String>)request.getSession().getAttribute("clase");
                                if(tipounidad != null)
                                    for(int i = 0; i < tipounidad.size(); i++){ %>
                                    <option value="<%= tipounidad.get(i) %>"><%= tipounidad.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                                    
                <div class="form-group">
                    <label for="equiposSelect" class="col-lg-4 control-label">N° de Equipo:</label>
                    <div class="col-lg-4">
                        <select id="equiposSelect" name="equiposSelect" class="form-control">
                            <%
                                LinkedList<String> num_equipos = (LinkedList<String>)request.getSession().getAttribute("num_equipos");
                                if(num_equipos != null)
                                    for(int i = 0; i < num_equipos.size(); i++){ %>
                                    <option value="<%= num_equipos.get(i) %>"><%= num_equipos.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="motoristasSelect" class="col-lg-4 control-label">Motoristas Disponibles:</label>
                    <div class="col-lg-4">
                        <select id="motoristasSelect" name="motoristasSelect" class="form-control">
                            <%
                                LinkedList<String> motoristas = (LinkedList<String>)request.getSession().getAttribute("motoristas");
                                if(motoristas != null)
                                    for(int i = 0; i < motoristas.size(); i++){ %>
                                    <option value="<%= motoristas.get(i) %>"><%= motoristas.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descripcionesSelect" class="col-lg-4 control-label">Actividad Asignada:</label>
                    <div class="col-lg-4">
                        <select id="descripcionesSelect" name="descripcionesSelect" class="form-control">
                            <%
                                LinkedList<String> descripciones = (LinkedList<String>)request.getSession().getAttribute("descripcion");
                                if(descripciones != null)
                                    for(int i = 0; i < descripciones.size(); i++){ %>
                                    <option value="<%= descripciones.get(i) %>"><%= descripciones.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>        
          <div class="form-group">
                    <label for="horasSelect" class="col-lg-4 control-label">Horas de Duracion de la Actividad:</label>
                    <div class="col-lg-4">
                        <select id="horasSelect" name="horasSelect" class="form-control">
                            <%
                                LinkedList<String> horasduracion = (LinkedList<String>)request.getSession().getAttribute("horasduracion");
                                if(horasduracion != null)
                                    for(int i = 0; i < horasduracion.size(); i++){ %>
                                    <option value="<%= horasduracion.get(i) %>"><%= horasduracion.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
            <div class="form-group">
                    <label for="requeridasSelect" class="col-lg-4 control-label">Unidad Requerida:</label>
                    <div class="col-lg-4">
                        <select id="requeridasSelect" name="requeridasSelect" class="form-control">
                            <%
                                LinkedList<String> unidadrequerida = (LinkedList<String>)request.getSession().getAttribute("unidadrequerida");
                                if(unidadrequerida != null)
                                    for(int i = 0; i < unidadrequerida.size(); i++){ %>
                                    <option value="<%= unidadrequerida.get(i) %>"><%= unidadrequerida.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div> 
                        
                  <div class="form-group">
                    <label for="fecharealizar" class="col-lg-4 control-label">Dia a Realizar la Actividad:</label>
                    <div class="col-lg-4">
                        <input type="text" name="fecharealizar" class="tcal" value="" id="fecharealizar" required />
                    </div>
                </div>
                <center>
                    <input class="btn btn-success" type="submit" value="Guardar" />
                    <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.href='vistaAdministrador.jsp'">
                </center>
                </form> 
                </div>
                      
        <script type="text/javascript">
            function matchUp(selected, toselect)
            {
              var idx = selected.prop('selectedIndex');
              toselect.prop('selectedIndex', idx);
            }
            $('#descripcionesSelect').change(
              function() {
                matchUp($('#descripcionesSelect'), $('#horasSelect'));
              }
            );
            
            $('#horasSelect').change(
              function() {
                matchUp($('#horasSelect'), $('#descripcionesSelect'));
              }
            );
            
            $('#descripcionesSelect').change(
              function() {
                matchUp($('#descripcionesSelect'), $('#requeridasSelect'));
              }
            );
            
            $('#requeridasSelect').change(
              function() {
                matchUp($('#requeridasSelect'), $('#descripcionesSelect'));
              }
            );
    
            $('#horasSelect').change(
              function() {
                matchUp($('#horasSelect'), $('#requeridasSelect'));
              }
            );
       
             $('#requeridasSelect').change(
              function() {
                matchUp($('#requeridasSelect'), $('#horasSelect'));
              }
            );
    
            $('#unidadesSelect').change(
              function() {
                matchUp($('#unidadesSelect'), $('#equiposSelect'));
              }
            );
            
            
            $('#equiposSelect').change(
              function() {
                matchUp($('#equiposSelect'), $('#unidadesSelect'));
              }
            );
                
            $('.toAdd').live('change', function() {
                var total = 1;
                
                total *= parseFloat(1);
                $('.toAdd').each(function () {
                    total *= parseFloat($(this).val());
                });
                $('#valor_total').val(total.toFixed(2));
            });
        </script>
        
        <% 
            if(request.getSession().getAttribute("message") != null) {%>
                <script type="text/javascript">
                    alert('<%=request.getSession().getAttribute("message")%>');
                </script>
                <% request.getSession().removeAttribute("message");
            }
        %>
        
        <%@ include file="WEB-INF/jspf/validate-detallebitacoracombustible.jspf" %>
    </body>
</html>