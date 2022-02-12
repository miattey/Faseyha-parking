package web;

import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import model.dao.BookingDAO;
import model.dao.ParkingSpotDAO;
import model.pojo.Booking;
import model.pojo.GenerateQRCode;
import model.pojo.ParkingSpot;
import model.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "BookingServlet", value = "/createbooking")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //String fromDate = request.getParameter("fromdate");
        //String toDate = request.getParameter("todate");



        Date fromDate = Date.valueOf(request.getParameter("fromdate"));
        Date toDate = Date.valueOf(request.getParameter("todate"));

        request.setAttribute("fromdate", fromDate);
        request.setAttribute("todate", toDate);

        ParkingSpotDAO parkingSpotDAO = new ParkingSpotDAO(getServletContext());

        List<ParkingSpot> js = parkingSpotDAO.checkAvailability(fromDate.toString(), toDate.toString());

        request.setAttribute("parkingspots", js);

        try {
            request.getRequestDispatcher("customer/booking.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw e;
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String[] parkingSpotNumber = request.getParameterValues("parkingspot");


        String bookingReference = UUID.randomUUID().toString();
        int user_id = u.getID();
        int parkingSpot = Integer.parseInt(parkingSpotNumber[0]);
        Date fromDate = Date.valueOf(request.getParameter("fromDate"));
        Date toDate = Date.valueOf(request.getParameter("toDate"));

        BookingDAO bookingdao = new BookingDAO(getServletContext());

        GenerateQRCode generateqrcode = new GenerateQRCode();

        String QrCodeFileName = bookingReference+".png";


        String path = "C:\\Users\\Miatt\\GlassFish_Server\\glassfish\\domains\\domain1\\docroot\\img\\qrcode\\"+QrCodeFileName;

        String charset = "UTF-8";
        Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
        hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
        try {
            generateqrcode.generateQRcode(bookingReference, path, charset, hashMap, 200, 200);//increase or decrease height and width accodingly
            bookingdao.createBooking(new Booking(bookingReference,user_id,parkingSpot,fromDate,toDate,QrCodeFileName));
            try {
                //Redirect to the home page
                response.sendRedirect(request.getContextPath()+"/mytickets");
            } catch (IOException ex) {

            }
        } catch (WriterException e) {
            e.printStackTrace();
        }










    }
}
