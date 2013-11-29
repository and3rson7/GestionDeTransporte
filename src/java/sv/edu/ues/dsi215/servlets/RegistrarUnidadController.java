/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
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
public class RegistrarUnidadController extends HttpServlet {

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
            
            String placa = request.getParameter("placa");
            String num_equipo = request.getParameter("num_equipo");
            String clase = request.getParameter("clase").toUpperCase();
            String marca = request.getParameter("marca").toUpperCase();
            String modelo = request.getParameter("modelo").toUpperCase();

            String color = request.getParameter("color").toUpperCase();
            String anio = request.getParameter("anio");
            String capacidad = request.getParameter("capacidad").toUpperCase();
            String dominio = request.getParameter("dominio").toUpperCase();

            String num_motor = request.getParameter("num_motor").toUpperCase();
            String num_chasis_grabado = request.getParameter("num_chasis_grabado").toUpperCase();
            String num_chasis_vin = request.getParameter("num_chasis_vin").toUpperCase();
            String en_calidad = request.getParameter("en_calidad").toUpperCase();
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "INSERT INTO unidad " + "VALUES" + " ('" + placa + "','" + num_equipo + "','" + clase
                        + "','" + marca + "','" + modelo + "','" + color + "','" + anio + "','" + capacidad
                        + "','" + dominio + "','" + num_motor + "','" + num_chasis_grabado + "','"
                        + num_chasis_vin + "','" + en_calidad + "','Disponible')";
            }

            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            pst.execute();
            connection.close();
            
            request.getSession().setAttribute("message", "¡¡ Registro Exitoso !!");
            response.sendRedirect("RegistrarUnidad.jsp");
            //request.getRequestDispatcher("RegistrarUnidad.jsp").forward(request, response);
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