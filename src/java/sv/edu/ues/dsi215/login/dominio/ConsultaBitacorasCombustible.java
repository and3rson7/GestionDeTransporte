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
public class ConsultaBitacorasCombustible {
    
    public static LinkedList<BitacoraCombustible> getBitacorasCombustible() {
        LinkedList<BitacoraCombustible> listBitacoras = new LinkedList<BitacoraCombustible>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM bitacoracombustible");

            while (rs.next()) {
                BitacoraCombustible bitacoraC = new BitacoraCombustible();
                
                bitacoraC.setCorrelativo(rs.getString("correlativo"));
                bitacoraC.setFecha(rs.getString("fecha"));
                bitacoraC.setHora(rs.getString("hora"));
                bitacoraC.setGasolinera(rs.getString("gasolinera"));
                
                listBitacoras.add(bitacoraC);
                
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listBitacoras;
    }
    
}
