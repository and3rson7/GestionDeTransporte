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
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registrar Programacion Local</div>
            <div class="panel-body">
                <form class="form-horizontal" role="form" id="registrar_programacion_local" method="post" action="RegistrarProgramacionLocalController">  
                    <div class="form-horizontal">
                        <label for="fecha" class="col-lg-3 ">Fecha de Registro:</label>
                        <div class="col-lg-3">
                            <input type="date" required name="fecha"  id="fecha" class="form-control" />
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <label for="correlativo" class="col-lg-3 control-label">Correlativo:</label>
                        <div class="col-lg-3">
                            <input type="text"  value="${correlativo}" name="correlativo" class="form-control" id="correlativo" maxlength="10"  readonly=""/>
                        </div>
                    </div>
                        <br><br><br>
                    <center>
                        <input class="btn btn-success" type="submit" value="Ok >>" />
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
    
  </body>
</html>