
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
public class ConsultaProgramacionLocal {
    @SuppressWarnings({"UseSpecificCatch", "CallToThreadDumpStack", "BroadCatchBlock", "TooBroadCatch"})
    public static LinkedList<ProgramacionLocal> getProgramacion() {
        LinkedList<ProgramacionLocal> listaProgramaciones = new LinkedList<ProgramacionLocal>();
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM programacionlocal WHERE estado<>'Eliminado'");

            while (rs.next()) {
                ProgramacionLocal programaciones = new ProgramacionLocal();

                programaciones.setCorrelativo(rs.getString("correlativo"));
                programaciones.setMotorista(rs.getString("motorista"));
                programaciones.setUnidad(rs.getString("unidad"));
                programaciones.setNumequipo(rs.getString("numequipo"));
                programaciones.setActividad(rs.getString("actividad"));
                programaciones.setFechaactividad(rs.getString("fechaactividad"));
                programaciones.setHorainicio(rs.getString("horainicio"));
                programaciones.setDuracionactividad(rs.getString("duracionactividad"));
                programaciones.setUnidadrequerida(rs.getString("unidadreq"));
                programaciones.setEstado(rs.getString("estado"));

                listaProgramaciones.add(programaciones);
            }
            rs.close();
            st.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProgramaciones;
    }
    
    @SuppressWarnings({"UseSpecificCatch", "CallToThreadDumpStack", "BroadCatchBlock", "TooBroadCatch"})
    public ProgramacionLocal getProgramacion(String correlativo) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/gestiontransporte", "root", "");
            Statement st = conexion.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM programacionlocal WHERE correlativo='" + correlativo + "'");
            rs.next();
            ProgramacionLocal programaciones = new ProgramacionLocal();

                programaciones.setCorrelativo(rs.getString("correlativo"));
                programaciones.setMotorista(rs.getString("motorista"));
                programaciones.setUnidad(rs.getString("unidad"));
                programaciones.setNumequipo(rs.getString("numequipo"));
                programaciones.setActividad(rs.getString("actividad"));
                programaciones.setFechaactividad(rs.getString("fechaactividad"));
                programaciones.setHorainicio(rs.getString("horainicio"));
                programaciones.setDuracionactividad(rs.getString("duracionactividad"));
                programaciones.setUnidadrequerida(rs.getString("unidadreq"));
                programaciones.setEstado(rs.getString("estado"));

            
            rs.close();
            st.close();
            conexion.close();

            return programaciones;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
