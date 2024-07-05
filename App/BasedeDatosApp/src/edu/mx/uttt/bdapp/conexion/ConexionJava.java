package edu.mx.uttt.bdapp.conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionJava {
    private static Connection con;
    public static Connection conectar() {
        String url
                = "jdbc:sqlserver://localhost:1433;databaseName=Northwind;encrypt=true;trustServerCertificate=true";
       
       

        // Credenciales de la base de datos
        String user = "sa";
        String password = "123456789";

         con = null;

        try {
            // Establecer la conexión
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión exitosa a la base de datos!");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("Error al conectar a la base de datos.");

        }
       return con;
    }
   
    public static void cerrarConexion (){
        if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("No se puedo cerrar la conexion");
                }
            }else{
                System.out.println("La conexion esta cerrada");
            }
    }
}