package model.dao;


import model.pojo.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
                        resultset.getString("USERTYPE")
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
    //ends here


























}
