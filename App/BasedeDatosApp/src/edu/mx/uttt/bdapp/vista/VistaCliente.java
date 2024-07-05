/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.mx.uttt.bdapp.vista;
import edu.mx.uttt.bdapp.control.CtrlCliente;
import  edu.mx.uttt.bdapp.entidades.Cliente;

public class VistaCliente {
    public static void main(String[] args){
      Cliente c1= new Cliente();
      c1.setCustomerId("DSMG3");
      c1.setCompanyName("Gallina de hule");
      c1.setContactName("Lizeth kazumi pando");
      c1.setContactTitle("Gerente SI");
      c1.setAddress("Avenida libre");
      c1.setCity("Salte si puedes");
      c1.setRegion("Este");
      c1.setPostalCode("42780");
      c1.setCountry("Irlanda");
      c1.setPhone("7736493804");
      c1.setFax("35345435");
    }
    
    CtrlCliente ctrlCli= new CtrlCliente();
}
