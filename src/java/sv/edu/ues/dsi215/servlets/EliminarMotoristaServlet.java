
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
import sv.edu.ues.dsi215.login.dominio.Motorista;

/**
 *
 * @author Elmer Arnoldo Menjivar Ramos
 */
@WebServlet(name = "EliminarMotoristaServlet", urlPatterns = {"/EliminarMotoristaServlet"})
public class EliminarMotoristaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            Motorista motorista = new Motorista();
            Conexion prueba = new Conexion();
            Connection connection;
            ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "SELECT * FROM motorista WHERE licencia='" + request.getParameter("licencia") + "'";
            }

            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            rs = pst.executeQuery(sql);
            rs.next();
            
            motorista.setLicencia(rs.getString("licencia"));
            motorista.setNombres(rs.getString("nombres"));
            motorista.setApellidos(rs.getString("apellidos"));
            motorista.setDui(rs.getString("dui"));
            motorista.setTelefono(rs.getString("telefono"));
            
            motorista.setDireccion(rs.getString("direccion"));
            motorista.setSexo(rs.getString("sexo"));
            motorista.setFecha(rs.getString("fechaingreso"));
            motorista.setEstado(rs.getString("estado"));
            
            
            connection.close();
            
            request.setAttribute("motorista", motorista);
            request.getRequestDispatcher("EliminarMotorista.jsp").forward(request, response);
            
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
