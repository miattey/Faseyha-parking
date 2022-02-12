package WS;

import model.dao.BookingDAO;
import model.dao.ParkingSpotDAO;
import model.dao.UserDAO;
import model.dao.VehicleDAO;
import model.pojo.Booking;
import model.pojo.Vehicle;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;

@Path("/validateqr")
public class HelloResource {

    @Context
    private ServletContext context;

    @POST
    @Produces("text/plain")

    public String hello(@FormParam("qrcode") String qr) {


        BookingDAO bookingdao = new BookingDAO(context);
        VehicleDAO vehicledao = new VehicleDAO(context);
        ParkingSpotDAO parkingspotdao = new ParkingSpotDAO(context);

        String QRCode = qr;

        String result = null;

        Booking booking = bookingdao.findBookingByID(qr);
        Vehicle vehicle = vehicledao.findVehicleByCustomerID(booking.getCustomer_id());

        if (bookingdao.verifyQR(QRCode) && parkingspotdao.assignVehicle(vehicle.getId(),booking.getParking_spot_id())) {

                result = "<div class=\"alert alert-success\" role=\"alert\">QR CODE VALIDATED! PLEASE PROCCEED</div>";


        } else {
            result = "<div class=\"alert alert-warning\" role=\"alert\">INVALID TICKET</div>";

        }





        return result;
    }

}