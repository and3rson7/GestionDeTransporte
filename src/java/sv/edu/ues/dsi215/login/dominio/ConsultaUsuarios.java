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
public class ConsultaUsuarios {
    
    public static LinkedList<Usuario> getUsuarios() {
        LinkedList<Usuario> listUsuarios = new LinkedList<Usuario>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    Constantes.pUrl, Constantes.pUser, Constantes.pPassword);
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM login");

            while (rs.next()) {
                Usuario usr = new Usuario();
                
                usr.setNivel(Integer.parseInt(rs.getString("nivel")));
                usr.setUsuario(rs.getString("usuario"));
                usr.setNombre(rs.getString("Nombre"));
                usr.setContraseña(rs.getString("contraseña"));
                
                listUsuarios.add(usr);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listUsuarios;
    }
    
}
