package model.dao;

import model.pojo.Booking;
import model.pojo.ParkingSpot;
import model.pojo.Vehicle;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ParkingSpotDAO {

    private Connection connection;

    public ParkingSpotDAO(ServletContext context){
        connection = (Connection) context.getAttribute("connection");
    }


    public List<ParkingSpot> getParkingSpots() {
        ArrayList<ParkingSpot> parkingspot = new ArrayList<>();
        try
        {

            //Statement to find all drivers
            PreparedStatement str = connection.prepareStatement("select * from PARKINGSPOT");
            ResultSet rs = str.executeQuery();

            while (rs.next())
            {  //iterate through response and building journey list
                parkingspot.add(new ParkingSpot(rs.getInt("ID"), rs.getString("NUMBER"), rs.getInt("VEHICLE_ID")));
            }

            str.close();

        } catch (Exception e)
        {
            System.out.println(e);
        }
        return parkingspot;
    }

    public List<ParkingSpot> checkAvailability(String fromDate, String toDate) {
        ArrayList<ParkingSpot> parkingspot = new ArrayList<>();

        parkingspot = (ArrayList<ParkingSpot>) getParkingSpots();

        for (int i = 0; i < parkingspot.size(); i++) {
            try {

                //Statement to find all drivers
                PreparedStatement str = connection.prepareStatement("\n" +
                        "\n" +
                        "SELECT * FROM BOOKING WHERE( FROMDATE BETWEEN ? AND ? OR TODATE BETWEEN ? AND ? OR FROMDATE BETWEEN ? AND ?)\n" +
                        "                        AND PARKINGSPOT_ID = ?");

                str.setString(1, fromDate);
                str.setString(2, toDate);
                str.setString(3, fromDate);
                str.setString(4, toDate);
                str.setString(5, fromDate);
                str.setString(6, toDate);
                str.setInt(7, parkingspot.get(i).getId());

                ResultSet rs = str.executeQuery();

                if(rs.next() == false) {
                    parkingspot.get(i).setVehicle_id(0);
                } else {
                    parkingspot.get(i).setVehicle_id(rs.getInt("CUSTOMER_ID"));
                }



                str.close();

            } catch (Exception e)
            {
                System.out.println(e);
            }




        }


        return parkingspot;
    }

    public boolean assignVehicle(int vehicle_id, int parkig_spot_id) {
        try
        {
            PreparedStatement stmt = connection.prepareStatement("UPDATE PARKINGSPOT set PARKINGSPOT.VEHICLE_ID = ? WHERE PARKINGSPOT.ID = ?");
            stmt.setInt(1, vehicle_id);
            stmt.setInt(2, parkig_spot_id);


            // execute insert SQL stetement
            stmt.executeUpdate();

            stmt.close();

        } catch (SQLException ex)
        {
            System.out.println("FAILED IN CREATING CUSTOMER");
        }

        return true;
    }

    public boolean removeVehicle( int parkig_spot_id) {
        try
        {
            PreparedStatement stmt = connection.prepareStatement("UPDATE PARKINGSPOT set PARKINGSPOT.VEHICLE_ID = null WHERE PARKINGSPOT.ID = ?");
            stmt.setInt(1, parkig_spot_id);


            // execute insert SQL stetement
            stmt.executeUpdate();

            stmt.close();

        } catch (SQLException ex)
        {
            System.out.println("FAILED IN CREATING CUSTOMER");
        }

        return true;
    }












}
