/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
/**
 *
 * @author Michael
 */
public class LoginUser {
    private String username;
	private String password;
	
	public LoginUser() {
		
		
		}
	public LoginUser(String username, String password) {
		this.username = username ;
		this.password = password ;
		
		}
	    public void setUsername(String value)
	    {
	            username=value;
	    }
	    public void setPassword(String value)
	    {
	        password=value;
	    }
	public String getUsername(){return username;}
	public String getPassword(){return password;}
	
	

	public static String encriptarHexadecimal( String textoplano ) throws IllegalStateException
	{
	MessageDigest md = null;

	try
	{
	md = MessageDigest.getInstance( "SHA" ); // Instancia de generador SHA-1
	}
	catch( NoSuchAlgorithmException e )
	{
	throw new IllegalStateException( e.getMessage() );
	}

	try
	{
	md.update( textoplano.getBytes( "UTF-8" ) ); // Generación de resumen de mensaje
	}
	catch( UnsupportedEncodingException e )
	{
	throw new IllegalStateException( e.getMessage() );
	}

	byte raw[] = md.digest(); // Obtención del resumen de mensaje
	return toHexadecimal( raw ); // Traducción a HEXADECIMAL
	}
	
	
	private static String toHexadecimal( byte[] datos )
	{
	String resultado = "";
	ByteArrayInputStream input = new ByteArrayInputStream( datos );
	String cadAux;
	int leido = input.read();
	while( leido != -1 )
	{
	cadAux = Integer.toHexString( leido );
	if ( cadAux.length() < 2 ) //Hay que añadir un 0
	resultado += "0";
	resultado += cadAux;
	leido = input.read();
	}
	return resultado;
	}
	
	
	
	public String recuperar(String pass){
		String r="";
		r=encriptarHexadecimal(pass);
		
		return r;
		
	}
}
