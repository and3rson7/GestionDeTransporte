<%-- 
    Document   : Chekeando
    Created on : 12-02-2013, 06:35:53 PM
    Author     : VICTOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException"%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>
<%@ page session="true" %>
<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>
<%
    request.getSession();
    String username =session.getAttribute("usuario").toString();
    
    //session.getAttribute("rol");
    
     //String username="";
          out.println(username);
        
    try {
 
        Conexion prueba = new Conexion();
        Connection connection = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        
        //String username = request.getParameter("username");
         
        connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
        
        if(!connection.isClosed()){
            String s3 = "SELECT * FROM login";
            int Nivel = 0;
            int ni = 0;
            String usern = " 0";
            String passw = " ";
            pst = connection.prepareStatement(s3);
            rs = pst.executeQuery();
            //int userencontrado = 0;
        
            int encontrado = 0;
            while ((rs.next()) && encontrado != 1) {
                ni = rs.getInt(1);
                usern = rs.getString("usuario");
              //  passw = rs.getString("contraseña");
                
                if (username.equals(usern)) {
                    encontrado = 1;
                    Nivel = ni;
                } else {
                    encontrado = 10;
                }
            }
            
            if (encontrado == 1) {
                
                session.setAttribute("usuario", username);
                
                if (Nivel == 1) {
                    session.setAttribute("rol", "Administrador");
                    response.sendRedirect("vistaAdministrador.jsp");
                } else {
                    if (Nivel == 2) {
                        session.setAttribute("rol", "Gerente");
                        response.sendRedirect("vistaGerente.jsp");
                    } else {
                        if (Nivel == 3) {
                            session.setAttribute("rol", "SubGerente");
                            response.sendRedirect("vistaSubgerente.jsp");
                        } else {
                            if (Nivel == 4) {
                                session.setAttribute("rol", "Jefe de Taller");
                                response.sendRedirect("MenuMantenimiento.jsp");
                            }
                            else{
                             if (Nivel == 5) {
                                session.setAttribute("rol", "Motorista");
                                response.sendRedirect("vistaMotorista.jsp");
                            }
                            }
                        }
                    }
                }
                connection.close();
            } else {
                if (encontrado == 10) {
                    pageContext.include("Login.jsp");
                    connection.close();
                }
            }
        }
        
        connection.close();
    } catch (Exception e) {
        out.println("Unable to connect to database...");
    }

%>

<!DOCTYPE html>
<html>
  <head>
    <title>Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
      <script type="text/javascript" >
        //  alert("El nombre de usuario o la contraseña introducidos no son correctos");
      </script>
  </body>
</html>