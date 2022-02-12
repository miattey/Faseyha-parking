package web;

import model.dao.BookingDAO;
import model.pojo.Booking;
import model.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "MyTicketsServlet", value = "/mytickets")
public class MyTicketsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        int user_id = u.getID();

        BookingDAO bookingdao = new BookingDAO(getServletContext());

        List<Booking> myTickets = bookingdao.fetchCustomerTickets(user_id);
        request.setAttribute("myTickets", myTickets);

        try {
            request.getRequestDispatcher("customer/mytickets.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw e;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
