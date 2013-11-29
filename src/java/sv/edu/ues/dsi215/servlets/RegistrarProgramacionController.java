/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.ues.dsi215.login.dominio.Conexion;
import sv.edu.ues.dsi215.login.dominio.Constantes;

/**
 *
 * @author anderson
 */
public class RegistrarProgramacionController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            Connection connection;
            //ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            
            String correlativo = request.getParameter("correlativo");
            String unidades = request.getParameter("unidadesSelect");
            String numequipo = request.getParameter("equiposSelect");
            String motorista = request.getParameter("motoristasSelect");
            String actividad = request.getParameter("descripcionesSelect");
            String duracion = request.getParameter("horasSelect");
            String hora = request.getParameter("horainicio");
            String unidadreq = request.getParameter("requeridasSelect");
            String fecharealizar = request.getParameter("fecharealizar");
            String estado = "Programada";
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "INSERT INTO programacionlocal " + "VALUES" + " ('" + correlativo + "','" + motorista
                        + "','" + unidades + "','" + numequipo + "','" + actividad + "','" + fecharealizar + "','" + hora
                        + "','" + duracion + "','" + unidadreq + "','" + estado + "')";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);
            
            pst.execute();
            connection.close();
            
            response.sendRedirect("CorrelativoProgramacionLocalServlet");
        } catch(Exception e){
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionDetails = sw.toString();
            
            request.getSession().setAttribute("errorLog", exceptionDetails);
            response.sendRedirect("errorMsg.jsp");
            //out.println("Unable to connect to database...");
        } finally {            
            out.close();
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
