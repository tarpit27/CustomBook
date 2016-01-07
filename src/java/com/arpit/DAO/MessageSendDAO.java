package com.arpit.DAO;

import java.sql.*;
import com.arpit.classes.Connector;

/**
 *
 * @author megha
 */
public class MessageSendDAO {
    public static boolean sendMessage(String sender, String receiver, String message) {
        boolean isSent = false;
        try {
            String sql = "insert into messages values(?,?,?);";
            String sql2 = "update isRead set message = 0 where id = ?;";
            
            Connection con = Connector.getConnection();
            
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, sender);
            st.setString(2, receiver);
            st.setString(3, message);
            
            PreparedStatement st2 = con.prepareStatement(sql2);
            st2.setString(1, receiver);
            System.out.println(st2.toString());
            int i = st.executeUpdate();
            int i2 = st2.executeUpdate();
            System.out.println("i:" + i + " i2:" + i2);
            if(i != 0 && i2 != 0){
                isSent = true;
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return isSent;
    }
}
