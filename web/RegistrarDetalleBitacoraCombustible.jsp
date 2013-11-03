<%-- 
    Document   : RegistrarDetalleBitacoraCombustible
    Created on : 10-20-2013, 06:42:57 PM
    Author     : anderson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Detalle de Bitacora de Combustible</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        
        <script type="text/javascript" src="js/validarUnidades.js"></script>
    </head>
    <body>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
        
        <center>
            <p style="font-family:Cambria;color:black;font-size:25px; margin-bottom: 20px;">
                <strong>Control de Suministro de Combustible a Vehiculos Municipales</strong>
            </p>
        </center>
        
        <div class="well container">
            <form class="form-horizontal" role="form" id="registrar_detalle_bitacora_combustible" method="post" action="RegistrarDetalleBitacoraCombustibleController">
                
                <div class="form-group">
                    <label for="correlativo" class="col-lg-4 control-label">Correlativo:</label>
                    <div class="col-lg-4">
                        <input type="text" name="correlativo" class="form-control" id="correlativo" value="${correlativo}" readonly />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="vale" class="col-lg-4 control-label">Vale:</label>
                    <div class="col-lg-4">
                        <input type="text" name="vale" class="form-control" id="vale" maxlength="10" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="placasSelect" class="col-lg-4 control-label">Placa:</label>
                    <div class="col-lg-4">
                        <select id="placasSelect" name="placasSelect" class="form-control">
                            <%
                                LinkedList<String> placas = (LinkedList<String>)request.getSession().getAttribute("placas");
                                if(placas != null)
                                    for(int i = 0; i < placas.size(); i++){ %>
                                    <option value="<%= placas.get(i) %>"><%= placas.get(i) %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="equiposSelect" class="col-lg-4 control-label">Equipo:</label>
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
                    <label for="motoristasSelect" class="col-lg-4 control-label">Motorista:</label>
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
                    <label for="tipo_combustible" class="col-lg-4 control-label">Tipo Combustible:</label>
                    <div class="col-lg-4">
                        <select id="tipo_combustible" name="tipo_combustible" class="form-control">
                            <option value="Diesel">Diesel</option>
                            <option value="Gasolina">Gasolina</option>
                            <option value="Regular">Regular</option>
                            <option value="Super">Super</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="precio_galon" class="col-lg-4 control-label">Precio Galón:</label>
                    <div class="col-lg-4 input-group">
                        <span class="input-group-addon">$</span>
                        <input type="text" name="precio_galon" class="form-control toAdd" id="precio_galon" maxlength="6" onkeypress="return permite(event, 'num')" required />
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="total_galones" class="col-lg-4 control-label">Total Galones:</label>
                    <div class="col-lg-4">
                        <input type="text" name="total_galones" class="form-control toAdd" id="total_galones" maxlength="7" onkeypress="return permite(event, 'num')" required />
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="valor_total" class="col-lg-4 control-label">Valor Total:</label>
                    <div class="col-lg-4 input-group">
                        <span class="input-group-addon">$</span>
                        <input type="text" name="valor_total" class="form-control" id="valor_total" onkeypress="return permite(event, 'num')" readonly required />
                    </div>
                </div>
                        
                <div class="form-group">
                    <label for="actividades" class="col-lg-2 control-label">Actividades a Realizar:</label>
                    <div class="col-lg-10">
                        <input type="text" name="actividades" class="form-control" id="actividades" placeholder="Opcional" maxlength="100" />
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
            
            $('#placasSelect').change(
              function() {
                matchUp($('#placasSelect'), $('#equiposSelect'));
              }
            );

            $('#equiposSelect').change(
              function() {
                matchUp($('#equiposSelect'), $('#placasSelect'));
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