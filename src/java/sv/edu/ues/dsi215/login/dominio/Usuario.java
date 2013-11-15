/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

/**
 *
 * @author anderson
 */
public class Usuario {
    private Integer nivel;
    private String usuario;
    private String nombre;
    private String contraseña;

    public Integer getNivel() {
        return nivel;
    }

    public void setNivel(Integer nivel) {
        this.nivel = nivel;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    
}
