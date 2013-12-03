<%-- 
    Document   : GastosCombustible
    Created on : 11-29-2013, 12:34:22 PM
    Author     : anderson
--%>

<%@ page import="sv.edu.ues.dsi215.login.dominio.Constantes" %>
<%@ page  import="java.io.*" %> 
<%@ page  import="java.sql.Connection" %> 
<%@ page  import="java.sql.DriverManager" %>
<%@ page  import="java.util.HashMap" %>
<%@ page  import="java.util.Map" %>
<%@ page  import="net.sf.jasperreports.engine.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <%
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(Constantes.pUrl, Constantes.pUser, Constantes.pPassword);
                System.out.print("conexion CTM! xD");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            File reportFile = new File(application.getRealPath("reportes\\rGastosCombustible.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            
            parameters.put("fecha_inicial", request.getSession().getAttribute("fecha_inicial"));
            parameters.put("fecha_final", request.getSession().getAttribute("fecha_final"));
            
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
 
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
        %>
    </body>
</html>
