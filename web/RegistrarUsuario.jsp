<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Registrar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
  </head>
  <body>
    <%@ include file="WEB-INF/jspf/menu-administrador.jspf" %>
    
    <div class="container">
        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading" style="text-align: center;">Registrar Usuario</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" action="Registro.jsp">
                    
                    <div class="form-group">
                        <label for="nombre" class="col-lg-4 control-label">Nombre:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="nombre" id="nombre" maxlength="100" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="col-lg-4 control-label">Usuario:</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="username" id="username" placeholder="username" maxlength="50" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-lg-4 control-label">Contraseña:</label>
                        <div class="col-lg-4">
                            <input type="password" class="form-control" name="password" id="password" placeholder="password" maxlength="50" required />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="nivel" class="col-lg-4 control-label">Nivel:</label>
                        <div class="col-lg-4">
                            <select id="nivel" name="nivel" class="form-control">
                                <option value="1">Administrador</option>
                                <option value="2">Gerente</option>
                                <option value="3">SubGerente</option>
                                <option value="4">Motorista</option>
                            </select>
                        </div>
                    </div>
                    
                    <center>
                        <input type="submit" class="btn btn-success" value="Registrar" />
                    </center>
                </form>
            </div>
        </div>
    </div>
  </body>
</html>