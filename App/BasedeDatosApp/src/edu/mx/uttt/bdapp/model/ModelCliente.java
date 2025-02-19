/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.mx.uttt.bdapp.model;
import java.sql.Connection;
import edu.mx.uttt.bdapp.conexion.ConexionJava;
import edu.mx.uttt.bdapp.entidades.Cliente;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ModelCliente {

    public static boolean agregar(Cliente cli) {

        boolean sentinel = false;
        Connection con = ConexionJava.conectar();
        PreparedStatement pst = null;
       
        String query = """
                       INSERT INTO [dbo].[Customers]
                                  ([CustomerID]
                                  ,[CompanyName]
                                  ,[ContactName]
                                  ,[ContactTitle]
                                  ,[Address]
                                  ,[City]
                                  ,[Region]
                                  ,[PostalCode]
                                  ,[Country]
                                  ,[Phone]
                                  ,[Fax])
                            VALUES(?,?,?,?,?,?,?,?,?,?,?)""";
       
        try {
            pst = con.prepareStatement(query);
            pst.setString(1, cli.getCustomerId());
            pst.setString(2, cli.getCompanyName());
            pst.setString(3, cli.getContactName());
            pst.setString(4, cli.getContactTitle());
            pst.setString(5, cli.getAddress());
            pst.setString(6, cli.getCity());
            pst.setString(7, cli.getRegion());
            pst.setString(8, cli.getPostalCode());
            pst.setString(9, cli.getCountry());
            pst.setString(10, cli.getPhone());
            pst.setString(11, cli.getFax());
           
            //Ejecutar la consulta
           
            int numRows = pst.executeUpdate();
           
            if(numRows>0){
                System.out.println("El cliente se insertaron " + numRows + " registro");
            }
           
            sentinel = true;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        finally{
            ConexionJava.cerrarConexion();
        }
       
       
       
        return sentinel;
    }
}