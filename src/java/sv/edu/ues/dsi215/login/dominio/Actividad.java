/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

/**
 *
 * @author Michael
 */
public class Actividad {
    private String id_actividad;
    private String fecha;
    private String hrsalida;
    private String hrretorno;
    private String objetivo;
    private String lugar;
    private String nombre_sol;
    private String nombre_mot;
    
    public String getId_actividad() {
        return id_actividad;
    }

    public void setId_actividad(String id_actividad) {
        this.id_actividad = id_actividad;
    }
    
    public String getFecha(){
        return fecha;
    }
    public void setFecha(String fecha){
        this.fecha = fecha;
    }
    
    public String getHrsalida(){
        return hrsalida;
    }
    public void setHrsalida(String hrsalida){
        this.hrsalida = hrsalida;
    }
    
    public String getHrretorno(){
        return hrretorno;
    }
    public void setHrretorno(String hrretorno){
        this.hrretorno = hrretorno;
    }
    
    public String getObjetivo(){
        return objetivo;
    }
    public void setObjetivo(String objetivo){
        this.objetivo = objetivo;
    }
    
    public String getLugar(){
        return lugar;
    }
    public void setLugar(String lugar){
        this.lugar = lugar;
    }
    
    public String getNombre_sol(){
        return nombre_sol;
    }
    public void setNombre_sol(String nombre_sol){
        this.nombre_sol = nombre_sol;
    }
    
    public String getNombre_mot(){
        return nombre_mot;
    }
    public void setNombre_mot(String nombre_mot){
        this.nombre_mot = nombre_mot;
    }
}