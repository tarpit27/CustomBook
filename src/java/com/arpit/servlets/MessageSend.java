
package com.arpit.servlets;

import com.arpit.DAO.MessageSendDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author megha
 */
public class MessageSend extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String message = request.getParameter("message");
        String sender = request.getParameter("sender");
        String receiver = request.getParameter("receiver");
        
        boolean isSent = MessageSendDAO.sendMessage(sender, receiver, message);
        
        if(!isSent){
            response.getWriter().print("Error: Couldnt send the message!");
        } else{
            response.sendRedirect("home.jsp");
        }
    }
}
