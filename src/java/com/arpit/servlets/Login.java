
package com.arpit.servlets;

import com.arpit.DAO.LoginDAO;
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
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailLogin, passwordLogin;
        UserBean bean = new UserBean();
        HttpSession session = request.getSession();
        
        emailLogin = request.getParameter("emailLogin");
        passwordLogin = request.getParameter("passwordLogin");
        
        bean.setEmail(emailLogin);
        bean.setPassword(passwordLogin);
        
        bean = LoginDAO.checkLogin(bean);
        if(bean.getIsValid()){
            session.setAttribute("users_name", bean.getFirstName());
            session.setAttribute("users_full_name", bean.getFirstName()+" "+bean.getLastName());
            session.setAttribute("userId", bean.getId());
            response.sendRedirect("home.jsp");
        } else{
            response.getWriter().print("NOT logged!");
        }
    }
}
