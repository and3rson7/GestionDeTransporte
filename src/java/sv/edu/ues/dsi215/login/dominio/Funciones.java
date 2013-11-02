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
public class Funciones {
    
    public String SetCodigo() {
    int Valor;
    String Codigo= "";
    for( int cont = 1; cont <=6; cont++){
            //elegir entero aletorio entre 1y4
            Valor = 0 +(int) (Math.random()*9);

            Codigo += Valor;
        }

    return Codigo;
    }
}
