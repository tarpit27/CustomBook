
package com.arpit.servlets;

import com.arpit.DAO.PostsDAO;
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
public class Posts extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String post = request.getParameter("status");
        
        HttpSession session = request.getSession(false);
        
        boolean isPost = PostsDAO.createPost(post, (String)session.getAttribute("userId"));
        
        if(isPost){
            response.sendRedirect("profile.jsp");
        } else{
            response.getWriter().print("Unable to insert into database!");
        }
    }

}
