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

/**
 *
 * @author anderson
 */
public class ModificarBitacoraCombustibleController extends HttpServlet {

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
            Conexion prueba = new Conexion();
            Connection connection;
            //ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String gasolinera = request.getParameter("gasolinera");
            String correlativo = request.getParameter("correlativo");
            
            connection = prueba.conectar(databaseConstants.host, databaseConstants.user, databaseConstants.password);
            if (!connection.isClosed()) {
                sql = "UPDATE bitacoracombustible SET " + "fecha='" + fecha + "',hora='" + hora
                    + "',gasolinera='" + gasolinera + "' WHERE correlativo='" + correlativo + "'";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);
            
            pst.execute();
            connection.close();
            
            response.sendRedirect("ConsultarBitacorasCombustible.jsp");
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
