package model.dao;

import model.pojo.Booking;
import model.pojo.Vehicle;

import javax.servlet.ServletContext;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    private Connection connection;

    public BookingDAO(ServletContext context){
        connection = (Connection) context.getAttribute("connection");
    }

    public void createBooking(Booking j) {
        try {
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO BOOKING(ID, CUSTOMER_ID, PARKINGSPOT_ID, "
                    + "FROMDATE, TODATE, QRCODEFILENAME) VALUES (?, ?, ?, ?, ?, ?)");

            stmt.setString(1, j.getId());
            stmt.setInt(2, j.getCustomer_id());
            stmt.setInt(3, j.getParking_spot_id());
            stmt.setDate(4, (Date) j.getFrom());
            stmt.setDate(5, (Date) j.getTo());
            stmt.setString(6, j.getQrCodeFileName());

            stmt.executeUpdate();

            stmt.close();

        } catch (SQLException ex) {
            System.out.println("FAILED IN CREATING DRIVER");
        }

    }

    public List<Booking> fetchCustomerTickets(int customer_id)  {
        ArrayList<Booking> tickets = new ArrayList<>();

        try {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM BOOKING WHERE CUSTOMER_ID = ?");
        stmt.setInt(1, customer_id);

        ResultSet rs = stmt.executeQuery();

        while(rs.next()) {
            tickets.add(new Booking(rs.getString("id"), rs.getInt("CUSTOMER_ID"),
                    rs.getInt("PARKINGSPOT_ID"), rs.getDate("FROMDATE"),rs.getDate("TODATE"),
                    rs.getString("QRCODEFILENAME")));
        }
        } catch (SQLException ex) {
            System.out.println("FAILED IN CREATING DRIVER");
        }


        return tickets;
    }

    public Booking findBookingByID(String id) {
        Booking booking = null;
        try {
            String query = "SELECT * from BOOKING WHERE ID = ?";
            PreparedStatement str = connection.prepareStatement(query);
            str.setString(1, id);
            ResultSet rs = str.executeQuery();

            //iterate through response creating new drivers and adding to list
            while (rs.next()) {
                booking = new Booking(rs.getString("id"), rs.getInt("CUSTOMER_ID"),
                        rs.getInt("PARKINGSPOT_ID"), rs.getDate("FROMDATE"),rs.getDate("TODATE"),
                        rs.getString("QRCODEFILENAME"));
                //break;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return booking;
    }

    public boolean verifyQR(String qr) {

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String currentDate = dtf.format(now);

        Date currentDateObject = Date.valueOf(currentDate);


        Booking booking = findBookingByID(qr);

        if (!(booking == null)) {
            if (currentDateObject.after(booking.getFrom()) && currentDateObject.before(booking.getTo())
                    || currentDateObject.equals(booking.getFrom()) || currentDateObject.equals(booking.getTo())) {
                return true;
            }
            else {
                return false;
            }


        } else {
            return false;
        }
    }

    public static boolean between(Date date, Date dateStart, Date dateEnd) {
        if (date != null && dateStart != null && dateEnd != null) {
            if (date.after(dateStart) && date.before(dateEnd)) {
                return true;
            }
            else {
                return false;
            }
        }
        return false;
    }



}
