
package tthh.postgresql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author JossueG
 */
public class Conexion {

    //Configuración de la conexión
    private static final String URL = "jdbc:postgresql://localhost:5432/comercial";  
    private static final String USUARIO = "postgres"; 
    private static final String CONTRASENA = "1909"; 

    //Método para obtener la conexión
    public static Connection conectar() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CONTRASENA);
    }
}