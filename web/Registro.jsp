<%@ page import="java.io.*,java.util.*"  language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="sv.edu.ues.dsi215.login.dominio.*" %>

<%@ page import="sv.edu.ues.dsi215.login.negocio.*" %>

<%@ include file="WEB-INF/jspf/control-sesion.jspf" %>

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
         
        String s3="";
        int Nivel=0;
        int ni =0;
	 
	int nivel= Integer.parseInt(request.getParameter("nivel"));
	 String username=request.getParameter("username") ;
	 String nomuser=request.getParameter("nombre") ;
	 String password=request.getParameter("password") ;
	

	 //LoginUser user = new LoginUser(username,password) ;
	 /*username=user.getUsername();
	  password=user.getPassword();*/
	 CtrlLogin user=new CtrlLogin() ;
	 user.iniciausername(username, password);//devuelve el usuario
	 String pass=user.iniciapassword(password);//encripta clave y devuelve clave encriptada
	  
	 connection = prueba.conectar(pHost, pUser, pPassword);
	 
	 if(!connection.isClosed())
	 %>
	 <% 
     s3="select *from login";
     Nivel=0;
     ni =0;
     String usern=" 0";
     String passw=" ";
     String nom=" ";
     pst=connection.prepareStatement(s3);
     rs=pst.executeQuery();
     int userencontrado=0;
     
     int encontrado=0;
      while ((rs.next()) && encontrado!=1  ){
        //ni = rs.getInt(1);
        usern=rs.getString("usuario");
       // nom=rs.getString("Nombre");
        passw=rs.getString("contraseña");
       
        
  //    out.println("<br>"+username+usern+encontrado+pass+passw);
        
        
       if(username.equals(usern) || pass.equals(passw)){         	   
     	   		 
     		 encontrado=1; 	 
            }
     	   else{
     		encontrado=10;   
     	   }       	   
                   	
     }//fin mientras 
     
     pageContext.include("RegistrarUsuario.jsp");
      if(encontrado==1){
  		
    	 
  		
  		%>
    <script type="text/javascript" >

             alert(" Error: el usuario ya existe en el sistema "); 
    </script>
  		
  	<%
  			
  		 }
  		 
  		 else{
  		      
	 String sql="INSERT INTO `login`(`nivel`,`usuario`,`Nombre`, `contraseña`)"+ "VALUES"+"("+nivel+",'"+username+"','"+nomuser+"','"+pass+"')";
	  pst=connection.prepareStatement(sql);
        pst.execute();
    	
    	%>
        
	 <script type="text/javascript" >
         alert(" Usuario Ingresado Exitosamente "); 
         </script>
		
		<%
        	 connection.close();
  		 } 	 
	 }
	 catch(Exception ex){
	 %>
	 <%
	 out.println("Unable to connect to database.");
	 }
%>
