<%@  page import="java.io.*,java.util.*"  language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" session="true" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>
<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>
<%@ page import="javax.*" %> 


<%
 
 try {
	 /*here mysqltest is the database name. you have to give the database name you have created and 3306 is the default sql port */
	 
     Conexion prueba=new Conexion();
	 Connection connection = null; 
	 ResultSet rs = null;
	 PreparedStatement pst = null;
	 String pHost="localhost:3306";
	 String pUser="root";
	 String pPassword="";
	 String usuario="";

	 String username=request.getParameter("username") ;
	 String password=request.getParameter("password") ;

	 CtrlLogin user=new CtrlLogin() ;
	 user.iniciausername(username, password);//devuelve el usuario
	 String pass=user.iniciapassword(password);//encripta clave y devuelve clave encriptada
	  
	  
	 
	 connection = prueba.conectar(pHost, pUser, pPassword);
	 
	 if(!connection.isClosed()){
	 %>
	 <% 
	       
         String s3="select *from login";
        int Nivel=0;
        int ni =0;
        String usern=" 0";
        String passw=" ";
        pst=connection.prepareStatement(s3);
        rs=pst.executeQuery();
        int userencontrado=0;
        
        int encontrado=0;
         while ((rs.next()) && encontrado!=1  ){
           ni = rs.getInt(1);
           usern=rs.getString("usuario");
           passw=rs.getString("contraseña");
           
     //    out.println("<br>"+username+usern+encontrado+pass+passw);
           
           
          if(username.equals(usern) && pass.equals(passw)){         	   
        	   		 
        		 encontrado=1; 
        		 Nivel=ni;
        		         		 
               }
        	   else{
        		encontrado=10;   
        	   }       	   
        	     
                      	
        }//fin mientras 
        
      // out.println(encontrado);
        
        if(encontrado==1){
		
		//String title="Bienvenido :Sesion Iniciado";
            //out.println(title);
          //  HttpSession sesionOk = request.getSession(true);
          //
            session.setAttribute("usuario",username);
		 
		 if(Nivel==1){
			 
			// pageContext.forward("vistaAdministrador.jsp");
			 response.sendRedirect("vistaAdministrador.jsp");	
			
		 }
		 
		 else{
		      if(Nivel==2){
			// pageContext.forward("vistaGerente.jsp");
			 response.sendRedirect("vistaGerente.jsp");	
			 
			//desplegar pantalla principal con ciertos botones disponibles	 
			 }
			 else{
		      if(Nivel==3){
			       //pageContext.forward("vistaSubgerente.jsp");
			       response.sendRedirect("vistaSubgerente.jsp");	
			 
			//desplegar pantalla principal con ciertos botones disponibles	 
			       } 
		       else{
		          if(Nivel==4){
			             //pageContext.forward("vistaMotorista.jsp");
			              response.sendRedirect("vistaMotorista.jsp");
			 
			//desplegar pantalla principal con ciertos botones disponibles	 
			      }
		       }
			 }
		 }	     
		 
		/* if(Nivel==5){
			 
		// pageContext.include("Index.jsp");
		
		
			  response.sendRedirect("Index.jsp");
			//desplegar pantalla principal con ciertos botones disponibles	 
			 }		*/ 
		 
		connection.close();
                }     
	    
     else{
	   if(encontrado==10){
		  
		   pageContext.include("Login.jsp");
		  // response.sendRedirect("Login.jsp");
				 		
		   connection.close();	 
	   }//fin if
	  	   
	 }   //fin del else   
    
           
	 }
	 connection.close();
	 
	 }
	 catch(Exception ex){
	 %>
	 <%

	 out.println("Error Se le solicita que se identifique");

	 }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"     "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login checking</title>
</head>
<body>
<script type="text/javascript" >


 alert("Error Clave o usuario Incorrecto");

</script>


</body>
</html>