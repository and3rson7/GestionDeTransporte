<%-- 
    Document   : UnidadesDeTransporte
    Created on : 11-28-2013, 04:10:31 PM
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
            File reportFile = new File(application.getRealPath("reportes\\UnidadesDeTransporte.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
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