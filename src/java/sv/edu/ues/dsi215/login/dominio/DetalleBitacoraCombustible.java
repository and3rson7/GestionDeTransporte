/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

/**
 *
 * @author anderson
 */
public class DetalleBitacoraCombustible {
    private String vale;
    private String placa;
    private Integer num_equipo;
    private String motorista;
    private String tipo_combustible;
    private Float precio_galon;
    private Float total_galones;
    private Float valor_total;
    private String actividades;
    private String correlativo;

    public String getVale() {
        return vale;
    }

    public void setVale(String vale) {
        this.vale = vale;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public Integer getNum_equipo() {
        return num_equipo;
    }

    public void setNum_equipo(Integer num_equipo) {
        this.num_equipo = num_equipo;
    }

    public String getMotorista() {
        return motorista;
    }

    public void setMotorista(String motorista) {
        this.motorista = motorista;
    }

    public String getTipo_combustible() {
        return tipo_combustible;
    }

    public void setTipo_combustible(String tipo_combustible) {
        this.tipo_combustible = tipo_combustible;
    }

    public Float getPrecio_galon() {
        return precio_galon;
    }

    public void setPrecio_galon(Float precio_galon) {
        this.precio_galon = precio_galon;
    }

    public Float getTotal_galones() {
        return total_galones;
    }

    public void setTotal_galones(Float total_galones) {
        this.total_galones = total_galones;
    }

    public Float getValor_total() {
        return valor_total;
    }

    public void setValor_total(Float valor_total) {
        this.valor_total = valor_total;
    }

    public String getActividades() {
        return actividades;
    }

    public void setActividades(String actividades) {
        this.actividades = actividades;
    }

    public String getCorrelativo() {
        return correlativo;
    }

    public void setCorrelativo(String correlativo) {
        this.correlativo = correlativo;
    }
    
}
