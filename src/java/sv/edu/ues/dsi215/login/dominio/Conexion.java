/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.dsi215.login.dominio;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Michael
 */
public class Conexion {

    public static Connection con_mysql;

    public static Connection conectar(String pHost, String pUser, String pPassword) throws Exception {
        try {
            String databaseURL = Constantes.pUrl;
            Class.forName("com.mysql.jdbc.Driver");
            DriverManager.setLoginTimeout(300);
            con_mysql = java.sql.DriverManager.getConnection(databaseURL,
                    pUser, pPassword);
            System.out.println("Conexión con MySQL Establecida..");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e);
        }
        return con_mysql;
    }
}
