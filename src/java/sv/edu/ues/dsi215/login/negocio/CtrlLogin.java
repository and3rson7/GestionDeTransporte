/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.negocio;

import sv.edu.ues.dsi215.login.dominio.LoginUser;
/**
 *
 * @author Michael
 */
public class CtrlLogin {
    public String iniciausername(String username, String password) {
		
		
		iniciapassword(password);
		LoginUser login = new LoginUser(username, password) ;
		String user=login.getUsername();//obtener nombre de usuario
		return user;
	}
	public String iniciapassword(String password) {
		LoginUser login = new LoginUser() ;
		String pass=login.recuperar(password);//encripta contraseña
		
		return pass;//devuelve contraseña para ingresar base de datos
	}
}
