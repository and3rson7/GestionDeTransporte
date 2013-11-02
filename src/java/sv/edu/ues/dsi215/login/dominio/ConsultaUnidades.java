package sv.edu.ues.dsi215.login.dominio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class ConsultaUnidades {

	public static LinkedList<Unidad> getUnidades() {
        LinkedList<Unidad> listaUnidades = new LinkedList<Unidad>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM unidad WHERE estado<>'Eliminada'");

            while (rs.next()) {
                Unidad unidad = new Unidad();

                unidad.setPlaca(rs.getString("placa"));
                unidad.setNum_equipo(rs.getString("num_equipo"));
                unidad.setClase(rs.getString("clase"));
                unidad.setMarca(rs.getString("marca"));

                unidad.setModelo(rs.getString("modelo"));
                unidad.setColor(rs.getString("color"));

                unidad.setAnio(String.valueOf(rs.getInt("anio")));

                unidad.setCapacidad(rs.getString("capacidad"));
                unidad.setDominio(rs.getString("dominio"));

                unidad.setNum_motor(rs.getString("num_motor"));
                unidad.setNum_chasis_grabado(rs.getString("num_chasis_grabado"));
                unidad.setNum_chasis_vin(rs.getString("num_chasis_vin"));
                unidad.setEn_calidad(rs.getString("en_calidad"));
                unidad.setEstado(rs.getString("estado"));

                listaUnidades.add(unidad);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaUnidades;
    }
    
    public Unidad getUnidad(String placa) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM unidad WHERE placa='" + placa + "'");
            rs.next();
            Unidad unidad = new Unidad();

            unidad.setPlaca(rs.getString("placa"));
            unidad.setNum_equipo("num_equipo");
            unidad.setClase(rs.getString("clase"));
            unidad.setMarca(rs.getString("marca"));

            unidad.setModelo(rs.getString("modelo"));
            unidad.setColor(rs.getString("color"));

            unidad.setAnio(String.valueOf(rs.getInt("anio")));

            unidad.setCapacidad(rs.getString("capacidad"));
            unidad.setDominio(rs.getString("dominio"));

            unidad.setNum_motor(rs.getString("num_motor"));
            unidad.setNum_chasis_grabado(rs.getString("num_chasis_grabado"));
            unidad.setNum_chasis_vin(rs.getString("num_chasis_vin"));
            unidad.setEn_calidad(rs.getString("en_calidad"));
            unidad.setEstado(rs.getString("estado"));

            rs.close();
            st.close();
            conexion.close();

            return unidad;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
