package web;

import model.dao.UserDAO;
import model.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TestServlet", value = "/TestServlet")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        UserDAO userdao = new UserDAO(getServletContext());

        String username = "miattey";
        String password = "pass123";

        User user = userdao.authenticateUser(username);
        if (user == null) {
            response.getWriter().print("ok not");

        } else {

            response.getWriter().print("found");


        }






    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
