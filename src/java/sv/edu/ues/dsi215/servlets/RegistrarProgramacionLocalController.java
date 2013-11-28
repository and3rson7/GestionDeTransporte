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
import java.util.LinkedList;
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
public class RegistrarProgramacionLocalController extends HttpServlet {

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
    @SuppressWarnings("static-access")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Conexion prueba = new Conexion();
            Connection connection;
            ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            
            String estadoactual="Disponible";
            String estadoactual1="Pendiente";
            
            LinkedList<String> clase = new LinkedList<String>();
            LinkedList<String> num_equipos = new LinkedList<String>();
            LinkedList<String> motoristas = new LinkedList<String>();
            LinkedList<String> descripcion = new LinkedList<String>();
            LinkedList<String> horasduracion = new LinkedList<String>();
            LinkedList<String> unidadrequerida = new LinkedList<String>();
            
            String correlativo = request.getParameter("correlativo");
            String motorista = request.getParameter("motorista");
            String unidad = request.getParameter("unidad");
            String numequipo = request.getParameter("numequipo");
            String actividad = request.getParameter("actividad");
            String fechaactividad = request.getParameter("fechaactividad");
            String duracion = request.getParameter("duracion");
            String unidadreq = request.getParameter("unidadrequerida");
            String estado = request.getParameter("estado");
            String fechaprogramacion = request.getParameter("fechaprogramacion");
            
            //System.out.println(hora);
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "INSERT INTO programacionlocal " + "VALUES" + " ('" + correlativo + "','" + motorista
                        + "','" + unidad + "','" + numequipo + "','" + actividad + "','" + fechaactividad + "','" + duracion + "','" + unidadreq + "','" + estado + "','" + fechaprogramacion + "')";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            pst.execute();
            
            /* recuperar las placas */
            if (!connection.isClosed()) {
                sql = "SELECT * FROM unidad where estado = '"+estadoactual+"'";
            }
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                
                clase.add(rs.getString("clase"));
               
                /* recuperar los Nº E.Q. */
                num_equipos.add(rs.getString("num_equipo"));
            }
            
             pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            pst.execute();
            
            /* recuperar las actividades pendientes de programar */
            if (!connection.isClosed()) {
                sql = "SELECT * FROM actividadeslocales where estado = '"+estadoactual1+"'";
            }
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                descripcion.add(rs.getString("descripcion"));
                
                /* recuperar los Nº E.Q. */
                horasduracion.add(rs.getString("horasduracion"));
                
                /*recuperar las unidades requeridas para la actividad. */
                
                unidadrequerida.add(rs.getString("unidadrequerida"));
            }
           
            /* recuperar los nombres de los motoristas */
            if (!connection.isClosed()) {
                sql = "SELECT * FROM motorista where estado = '"+estadoactual+"'";
            }
            
            pst = connection.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while(rs.next()){
                motoristas.add(rs.getString("nombres").concat(" ").concat(rs.getString("apellidos")));
            }
            
            rs.close();
            pst.close();
            connection.close();
            
            request.getSession().setAttribute("correlativo", correlativo);
            request.getSession().setAttribute("clase", clase);
            request.getSession().setAttribute("num_equipos", num_equipos);
            request.getSession().setAttribute("descripcion", descripcion);
            request.getSession().setAttribute("unidadrequerida", unidadrequerida);
            request.getSession().setAttribute("horasduracion", horasduracion);
            request.getSession().setAttribute("motoristas", motoristas);
            
            response.sendRedirect("RegistrarDetalleProgramacionLocal.jsp");
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
