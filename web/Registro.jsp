<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

<%
    try {
        Conexion prueba = new Conexion();
        Connection connection = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        String s3 = "";
	 
	int nivel = Integer.parseInt(request.getParameter("nivel"));
        String username = request.getParameter("username");
        String nomuser = request.getParameter("nombre");
        String password = request.getParameter("password");
        
        CtrlLogin user = new CtrlLogin();
        user.iniciausername(username, password);//devuelve el usuario
        String pass = user.iniciapassword(password);//encripta clave y devuelve clave encriptada
        
        connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
        
        if(!connection.isClosed())
            s3 = "SELECT * FROM login";
        
        String usern = " 0";
        String passw = " ";
        pst = connection.prepareStatement(s3);
        rs = pst.executeQuery();
        
        int encontrado = 0;
        
        while ((rs.next()) && encontrado != 1) {
            usern = rs.getString("usuario");
            passw = rs.getString("contraseña");
            
            if (username.equals(usern) || pass.equals(passw)) {
                encontrado = 1;
            } else {
                encontrado = 10;
            }
        }
        
        pageContext.include("RegistrarUsuario.jsp");
        if (encontrado == 1) {
%>
            <script type="text/javascript" >
                alert(" Este usuario ya existe en el sistema "); 
            </script>
<%
        } else {
            String sql = "INSERT INTO `login`(`nivel`,`usuario`,`Nombre`, `contraseña`)" + "VALUES" 
                    + "(" + nivel + ",'" + username + "','" + nomuser + "','" + pass + "')";
            pst = connection.prepareStatement(sql);
            pst.execute();
%>
            <script type="text/javascript" >
                         alert(" Usuario Ingresado Exitosamente "); 
            </script>
<%
            connection.close();
        }
    } catch (Exception e) {
        out.println("Unable to connect to database...");
    }
%>
