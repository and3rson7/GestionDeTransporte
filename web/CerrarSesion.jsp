<%@  page import="java.io.*,java.util.*"  language="java" contentType="text/html; charset=ISO-8859-1" 
          pageEncoding="ISO-8859-1"%>

<%@ page session="true" %>

<%
    boolean t=true;

    //response.setContentType ("text/html");
    //response.setHeader("Cache-Control","no-cache");

    //response.setHeader("Cache-Control","no-store");
    //response.setDateHeader("Expire",0);
    //response.setHeader("Pragma","no-cache");

    //HttpSession sesionOk = request.getSession(t);

    request.getSession().removeAttribute("usuario");
    session.invalidate();
    response.sendRedirect("index.jsp");

    //<jsp:forward page="Login.jsp"/>
%>
