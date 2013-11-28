package sv.edu.ues.dsi215.login.dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author Elmer Arnoldo Menjivar Ramos
 */
public class ConsultaMotorista {
    public static LinkedList<Motorista> getMotorista() {
        LinkedList<Motorista> listaMotoristas = new LinkedList<Motorista>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM motorista WHERE estado<>'Eliminado'");

            while (rs.next()) {
                Motorista motorista = new Motorista();

                motorista.setLicencia(rs.getString("licencia"));
                motorista.setNombres(rs.getString("nombres"));
                
                motorista.setApellidos(rs.getString("apellidos"));
                motorista.setDui(rs.getString("dui"));
                
                motorista.setTelefono(rs.getString("telefono"));
                motorista.setDireccion(rs.getString("direccion"));
                
                motorista.setSexo(rs.getString("sexo"));
                motorista.setFecha(rs.getString("fechaingreso"));
                motorista.setEstado(rs.getString("estado"));
                

                listaMotoristas.add(motorista);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaMotoristas;
    }
    
    public Motorista getMotorista(String licencia) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM motorista WHERE licencia='" + licencia + "'");
            rs.next();
            Motorista motorista = new Motorista();
            
                motorista.setLicencia(rs.getString("licencia"));
                motorista.setNombres(rs.getString("nombres"));
                
                motorista.setApellidos(rs.getString("apellidos"));
                motorista.setDui(rs.getString("dui"));
                
                motorista.setTelefono(rs.getString("telefono"));
                motorista.setDireccion(rs.getString("direccion"));
                
                motorista.setSexo(rs.getString("sexo"));
                motorista.setFecha(rs.getString("fechaingreso"));
                motorista.setEstado(rs.getString("estado"));
            rs.close();
            st.close();
            conexion.close();

            return motorista;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
