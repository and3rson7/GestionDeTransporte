<%-- 
    Document   : RegistrarBitacoraCombustible
    Created on : 10-20-2013, 09:27:19 AM
    Author     : anderson
--%>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Registrar Bitácora de Combustible</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <% if(request.getSession().getAttribute("rol").equals("Motorista")){ %>
        <%@ include file="WEB-INF/jspf/menu-motorista.jspf" %>
    <% }else if(request.getSession().getAttribute("rol").equals("Administrador")){ %>
        <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    <% } %>
    
    
    <script type="text/javascript" src="jquery-ui/js/jquery-ui-1.10.3.custom.js"></script>
    <link rel="stylesheet" href="jquery-ui/css/cupertino/jquery-ui-1.10.3.custom.css">
  </head>
  <body>
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registrar Bitácora de Combustible</div>
            <div class="panel-body">
                <form class="form-inline" id="registrar_bitacora_combustible" method="post" action="RegistrarBitacoraCombustibleController">
                    <div class="container" style="text-align: center;">
                    <label for="fecha">Fecha:</label>
                    <input type="text" name="fecha" id="fecha" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" readonly />

                    <label for="hora" style="margin-left: 20px;">Hora:</label>
                    <input type="time" name="hora" id="hora" class="form-control" style="width: 140px; margin-left: 10px; margin-right: 10px;" required />
                    
                    <label for="correlativo">Correlativo:</label>
                    <input type="text" name="correlativo" id="correlativo" class="form-control" style="width: 100px; margin-left: 10px; margin-right: 10px;" value="${correlativo}" readonly />
                    </div>
                    <div class="container" style="text-align: center; padding-top: 15px;">
                    <label for="gasolinera" style="margin-left: 10px;">Gasolinera:</label>
                    <input type="text" name="gasolinera" id="gasolinera" class="form-control" style="width: 600px; margin-left: 10px; margin-right: 10px;" maxlength="50" required />
                    </div>
                    
                    <div class="container" style="text-align: center; padding-top: 15px;">
                    <input type="submit" class="btn btn-success" value="OK >>" /></div>
                </form>
            </div>
        </div>
    </div>
    <script>
        $(function() {
          $("#fecha").datepicker({
            showOn: "button",
            buttonImage: "jquery-ui/calendar.gif",
            buttonImageOnly: true,
          });

          $("#fecha").change(function (){
              $("#fecha").focus();
              $("#hora").focus();
          });
        });
    </script>
    <%@ include file="WEB-INF/jspf/validate-bitacora-combustible.jspf" %>
  </body>
</html>