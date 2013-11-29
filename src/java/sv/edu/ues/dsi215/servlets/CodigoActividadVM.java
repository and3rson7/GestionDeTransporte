/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sv.edu.ues.dsi215.login.dominio.Conexion;
import sv.edu.ues.dsi215.login.dominio.Constantes;

/**
 *
 * @author Michael
 */
public class CodigoActividadVM extends HttpServlet {

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
            Conexion prueba = new Conexion();
            Connection connection;
            ResultSet rs;
            PreparedStatement pst;
            String sql = "";
            String correlativo = "";
            String lastC = "";
            Integer valor;
            
            connection = prueba.conectar(Constantes.pHost, Constantes.pUser, Constantes.pPassword);
            if (!connection.isClosed()) {
                sql = "SELECT MAX(numero) AS maxC FROM detallebitacoraactividades";
            }
            
            pst = connection.prepareStatement(sql);
            //System.out.println(sql);

            rs = pst.executeQuery(sql);
            rs.next();
            
            if(rs.getString("maxC") != null){
                lastC = rs.getString("maxC");
                valor = Integer.parseInt(lastC.substring(2, 8));
                valor = valor + 1;
                
                correlativo = "AC" + String.valueOf(valor);
            }else{
                correlativo = "AC100001";
            }
            
            connection.close();
            
            request.getSession().setAttribute("correlativo", correlativo);
            response.sendRedirect("RegistrarActividadesVM.jsp");
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
