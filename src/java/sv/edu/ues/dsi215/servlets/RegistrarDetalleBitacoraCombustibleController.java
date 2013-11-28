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
public class RegistrarDetalleBitacoraCombustibleController extends HttpServlet {

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
            
            String vale = request.getParameter("vale");
            String placa = request.getParameter("placasSelect");
            String equipo = request.getParameter("equiposSelect");
            
            String motorista = request.getParameter("motoristasSelect");
            String tipo_combustible = request.getParameter("tipo_combustible");
            String precio_galon = request.getParameter("precio_galon");
            String total_galones = request.getParameter("total_galones");
            
            String valor_total = request.getParameter("valor_total");
            String actividades = request.getParameter("actividades");
            
            String correlativo = request.getParameter("correlativo");
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "INSERT INTO detallebitacoracombustible " + "VALUES" + " ('" + vale + "','" + placa
                        + "','" + equipo + "','" + motorista + "','" + tipo_combustible + "','" + precio_galon + "','" + total_galones
                        + "','" + valor_total + "','" + actividades + "','" + correlativo + "')";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            pst.execute();
            connection.close();
            
            request.getSession().setAttribute("message", "¡¡ Registro Guardado !!");
            response.sendRedirect("RegistrarDetalleBitacoraCombustible.jsp");
        } catch (Exception e) {
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
