package model.dao;

import model.pojo.Vehicle;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VehicleDAO {
    private Connection connection;

    public VehicleDAO(ServletContext context){
        connection = (Connection) context.getAttribute("connection");
    }



    public Vehicle findVehicleByID(int id) {
        Vehicle vehicle = null;

        try {
            String query = "SELECT * from VEHICLE WHERE ID = ?";
            PreparedStatement str = connection.prepareStatement(query);
            str.setInt(1, id);
            ResultSet rs = str.executeQuery();

            //iterate through response creating new drivers and adding to list
            while (rs.next()) {
                vehicle = new Vehicle(rs.getInt("ID"), rs.getInt("CUSTOMER_ID"),
                        rs.getString("VEHICLE_REGISTRATION"), rs.getString("TYPE"));
                //break;
            }

        } catch (Exception e) {
            System.out.println(e);
        }




        return vehicle;
    }

    public Vehicle findVehicleByCustomerID(int id) {
        Vehicle vehicle = null;

        try {
            String query = "SELECT * from VEHICLE WHERE CUSTOMER_ID = ?";
            PreparedStatement str = connection.prepareStatement(query);
            str.setInt(1, id);
            ResultSet rs = str.executeQuery();

            //iterate through response creating new drivers and adding to list
            while (rs.next()) {
                vehicle = new Vehicle(rs.getInt("ID"), rs.getInt("CUSTOMER_ID"),
                        rs.getString("VEHICLE_REGISTRATION"), rs.getString("TYPE"));
                //break;
            }

        } catch (Exception e) {
            System.out.println(e);
        }




        return vehicle;
    }



}
