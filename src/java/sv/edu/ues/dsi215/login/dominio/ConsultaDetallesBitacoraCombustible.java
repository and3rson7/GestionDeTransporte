/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author anderson
 */
public class ConsultaDetallesBitacoraCombustible {
    
    public static LinkedList<DetalleBitacoraCombustible> getDetallesBitacoraCombustible(String corr) {
        LinkedList<DetalleBitacoraCombustible> listDetallesBitacora = new LinkedList<DetalleBitacoraCombustible>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM detallebitacoracombustible WHERE correlativo='" + corr + "'");

            while (rs.next()) {
                DetalleBitacoraCombustible detallesBC = new DetalleBitacoraCombustible();
                
                detallesBC.setVale(rs.getString("vale"));
                detallesBC.setPlaca(rs.getString("placa"));
                detallesBC.setNum_equipo(rs.getInt("num_equipo"));
                detallesBC.setMotorista(rs.getString("motorista"));
                detallesBC.setTipo_combustible(rs.getString("tipo_combustible"));
                detallesBC.setPrecio_galon(rs.getFloat("precio_galon"));
                detallesBC.setTotal_galones(rs.getFloat("total_galones"));
                detallesBC.setValor_total(rs.getFloat("valor_total"));
                detallesBC.setActividades(rs.getString("actividades"));
                detallesBC.setCorrelativo(rs.getString("correlativo"));
                
                listDetallesBitacora.add(detallesBC);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listDetallesBitacora;
    }
}
