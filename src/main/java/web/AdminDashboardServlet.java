package web;

import model.dao.BookingDAO;
import model.dao.ParkingSpotDAO;
import model.dao.VehicleDAO;
import model.pojo.Booking;
import model.pojo.ParkingSpot;
import model.pojo.Vehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminDashboardServlet", value = "/admindashboard")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ParkingSpotDAO parkingspotdao = new ParkingSpotDAO(getServletContext());
        VehicleDAO vehicledao = new VehicleDAO(getServletContext());


        List<ParkingSpot> cJs;
        cJs = parkingspotdao.getParkingSpots();

        List<ParkingSpot> parkingSpot = new ArrayList<>();

        for (ParkingSpot dJ : cJs) {
            if (dJ.getVehicle_id() != 0) {
                Vehicle vehicle = vehicledao.findVehicleByID(dJ.getVehicle_id());

                dJ.setVehicle(vehicle);
            }
            parkingSpot.add(dJ);
        }

        try {
            request.setAttribute("parkingspot", parkingSpot);
            request.getRequestDispatcher("admin/admindashboard.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw e;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {







    }
}
