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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.ues.dsi215.login.dominio.Conexion;
import sv.edu.ues.dsi215.login.dominio.Constantes;
import sv.edu.ues.dsi215.login.dominio.Unidad;

/**
 *
 * @author anderson
 */
@WebServlet(name = "enviarUnidadServlet", urlPatterns = {"/enviarUnidadServlet"})
public class enviarUnidadServlet extends HttpServlet {

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
            Unidad unidad = new Unidad();
            Conexion prueba = new Conexion();
            Connection connection;
            ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "SELECT * FROM unidad WHERE placa='" + request.getParameter("placa") + "'";
            }

            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            rs = pst.executeQuery(sql);
            rs.next();
            
            unidad.setPlaca(rs.getString("placa"));
            unidad.setNum_equipo(rs.getString("num_equipo"));
            unidad.setClase(rs.getString("clase"));
            unidad.setMarca(rs.getString("marca"));
            unidad.setModelo(rs.getString("modelo"));
            
            unidad.setColor(rs.getString("color"));
            unidad.setAnio(rs.getString("anio"));
            unidad.setCapacidad(rs.getString("capacidad"));
            unidad.setDominio(rs.getString("dominio"));
            
            unidad.setNum_motor(rs.getString("num_motor"));
            unidad.setNum_chasis_grabado(rs.getString("num_chasis_grabado"));
            unidad.setNum_chasis_vin(rs.getString("num_chasis_vin"));
            unidad.setEn_calidad(rs.getString("en_calidad"));
            
            connection.close();
            
            request.setAttribute("unidad", unidad);
            request.getRequestDispatcher("ModificarUnidad.jsp").forward(request, response);
            
        } catch(Exception e){
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            String exceptionDetails = sw.toString();
            
            request.getSession().setAttribute("errorLog", exceptionDetails);
            response.sendRedirect("errorMsg.jsp");
            //out.println("Unable to connect to database...");
        }finally {            
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
