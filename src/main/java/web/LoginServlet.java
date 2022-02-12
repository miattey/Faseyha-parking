package web;

import model.dao.UserDAO;
import model.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw e;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //instance of userdao and database connection set for user login authentication
        UserDAO userdao = new UserDAO(getServletContext());

        // User user = userdao.authenticate(username,password);



        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(false);

        if (username.isEmpty() || password.isEmpty()) //Check if the details are empty
        {
            request.setAttribute("errMessageLogin", "Username and password cannot be left blank");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else
        {
            //Check username and password

            User user = userdao.authenticateUser(username);
            if (user == null)
            {
                request.setAttribute("errMessageLogin", "Username cannot be found");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else
            {
                if (password.equals(user.getPassword()))
                { //Correct password



                    //Set session
                    session.setAttribute("user",user);



                    if (user.getUsertype().equals("USER")) {
                        if (user.getIsNew() == 1) {

                            try {
                                //Redirect to the home page
                                response.sendRedirect(request.getContextPath()+"/gettingstarted");
                            } catch (IOException ex) {

                            }


                        } else {
                            try {
                                //Redirect to the home page
                                response.sendRedirect(request.getContextPath()+"/dashboard");
                            } catch (IOException ex) {

                            }
                        }





                    } else if (user.getUsertype().equals("ADMIN")) {
                        try
                        {
                            //Redirect to the home page
                            response.sendRedirect(request.getContextPath()+"/admindashboard");
                        } catch (IOException ex)
                        {

                        }

                    }



                } else
                { //Incorrect password
                    request.setAttribute("errMessageLogin", "Incorrect password");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }

            }

        }






    }
}
