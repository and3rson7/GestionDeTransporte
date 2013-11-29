
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
 * @author Elmer Arnoldo Menjivar Ramos
 */
public class ModificarProgramacionLocalController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("static-access")
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
            
            String correlativo = request.getParameter("correlativo");
            String motorista = request.getParameter("motorista");
            String unidad = request.getParameter("unidad");
            String numequipo = request.getParameter("numequipo");
            String actividad = request.getParameter("actividad");
            String fechaactividad = request.getParameter("fechaactividad");
            
            String horainicio = request.getParameter("horainicio");
            String duracionactividad = request.getParameter("duracionactividad");
            String unidadrequerida = request.getParameter("unidadrequerida");
            String estado = request.getParameter("estado");

             
            connection = prueba.conectar(databaseConstants.host, databaseConstants.user, databaseConstants.password);
            if (!connection.isClosed()) {
                sql = "UPDATE programacionlocal SET " + "motorista='" + motorista + "',unidad='" + unidad
                    + "',numequipo='" + numequipo + "',actividad='" + actividad + "',fechaactividad='"
                    + fechaactividad + "',horainicio='" + horainicio + "',duracionactividad='" + duracionactividad + "',unidadreq='" + unidadrequerida + "',estado='"
                    + estado + "'" + " WHERE correlativo='" + correlativo + "'";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);
            
            pst.execute();
            connection.close();
            request.getSession().setAttribute("message", "¡¡ Modificacion Exitosa !!");
            response.sendRedirect("ConsultarProgramacionLocal.jsp");
            //request.getRequestDispatcher("RegistrarUnidad.jsp").forward(request, response);
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
