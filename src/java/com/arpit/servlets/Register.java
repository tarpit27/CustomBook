
package com.arpit.servlets;

import com.arpit.DAO.RegisterDAO;
import com.arpit.classes.UserBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author megha
 */
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserBean user = new UserBean();
        
        HttpSession session = request.getSession();
        
        user.setFirstName(request.getParameter("firstName"));
        user.setLastName(request.getParameter("lastName"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setBirthday(request.getParameter("birthday"));
        user.setGender(request.getParameter("gender"));
        
        user = RegisterDAO.isRegister(user);
        
        if(user.getIsValid()){
            session.setAttribute("users_name", user.getFirstName());
            session.setAttribute("users_full_name", user.getFirstName()+" "+user.getLastName());
            session.setAttribute("userId", user.getId());
            response.sendRedirect("uploadProfile.jsp");
        } else{
            response.getWriter().print("Something went wrong!");
        }
        
    }

}
