package web;

import model.dao.UserDAO;
import model.pojo.User;
import model.pojo.Vehicle;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;

@WebServlet(name = "AddVehicleServlet", value = "/gettingstarted")
public class AddVehicleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user.getIsNew() == 1) {

            try {
                request.getRequestDispatcher("customer/addVehicle.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                throw e;
            }

        } else if (user.getIsNew() == 0) {
            try {
                //Redirect to the home page
                response.sendRedirect(request.getContextPath()+"/dashboard");
            } catch (IOException ex) {

            }


        } else if (user == null) {
            try {
                //Redirect to the home page
                response.sendRedirect(request.getContextPath()+"/login");
            } catch (IOException ex) {

            }
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        int user_id = u.getID();

        UserDAO userdao = new UserDAO(getServletContext());

        String vehicle_registration = request.getParameter("vehicle_registration");
        String vehicle_type = request.getParameter("vehicle_type");


        Vehicle j = new Vehicle(user_id, vehicle_registration, vehicle_type);

        if (vehicle_registration.isEmpty() || vehicle_type.isEmpty()) //Check if the details are empty
        {
            request.setAttribute("errMessage", "PLease fill in all details");
            request.getRequestDispatcher("customer/addVehicle.jsp").forward(request, response);
        } else {

            if (userdao.addVehicleDetails(j) == true) {
                if (userdao.updateUserStatus(user_id) == true) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    try {

                        request.setAttribute("errMessage", "Oops! Something went wrong.");

                        request.getRequestDispatcher("customer/addVehicle.jsp").forward(request, response);
                    } catch (ServletException | IOException e) {
                        throw e;
                    }
                }
            } else {
                try {

                    request.setAttribute("errMessage", "Oops! Something went wrong.");

                    request.getRequestDispatcher("customer/addVehicle.jsp").forward(request, response);
                } catch (ServletException | IOException e) {
                    throw e;
                }
            }



        }








    }
}
