package model.dao;


import model.pojo.User;
import model.pojo.Vehicle;

import javax.servlet.ServletContext;
import java.sql.*;

public class UserDAO {
    private Connection connection;

    public UserDAO(ServletContext context){
        connection = (Connection) context.getAttribute("connection");
    }



    //method to authenticate user login
    public User authenticateUser(String username) {
        User user = null;
        try {
            //querying the database
            PreparedStatement statement = connection.prepareStatement("SELECT * from USERS where USERNAME = ?");
            statement.setString(1, username);
            ResultSet resultset = statement.executeQuery();
            while (resultset.next()) {
                //fetching the user details for authentication
                user = new User(
                        resultset.getString("USERNAME"),
                        resultset.getString("PASSWORD"),
                        resultset.getString("FIRST_NAME"),
                        resultset.getString("LAST_NAME"),
                        resultset.getString("USERTYPE"),
                        resultset.getInt("isNew")
                );
                //setting the user ID
                user.setID(resultset.getInt("ID"));
            }

        } catch(Exception e) {
            System.out.println(e);
        }
        //returns the details as a user object
        return user;
    }


    public String validateQr(String aa) {

        String name = "THis is working"+aa;


        return name;
    }

    public boolean updateUserStatus(int user_id) {

        try
        {

            PreparedStatement stmt = connection.prepareStatement("UPDATE USERS set USERS.isNew = ? WHERE USERS.ID = ?");
            stmt.setInt(1, 0);
            stmt.setInt(2, user_id);


            // execute insert SQL stetement
            stmt.executeUpdate();

            stmt.close();

        } catch (SQLException ex)
        {
            System.out.println("FAILED IN CREATING CUSTOMER");
        }




        return true;
    }

        public boolean addVehicleDetails(Vehicle j) {

        try {

            PreparedStatement stmt = connection.prepareStatement("INSERT INTO VEHICLE(CUSTOMER_ID, VEHICLE_REGISTRATION, TYPE) VALUES (?, ?, ?)");

            stmt.setInt(1, j.getUser_id());
            stmt.setString(2, j.getVehicle_registration());
            stmt.setString(3, j.getVehicle_type());

            stmt.executeUpdate();

            stmt.close();



        } catch (SQLException ex)
        {

            System.out.println("FAILED IN CREATING DRIVER");
        }

        return true;
    }


























}
