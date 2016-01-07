package com.arpit.DAO;

import com.arpit.classes.Connector;
import com.sun.net.httpserver.HttpServer;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author megha
 */
public class PostsDAO {

    public static boolean createPost(String post, String userId) {
        boolean isCreated = false;
        try {
            String sql = "insert into posts values(?,?,?);";
            Connection con = Connector.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, userId);
            st.setString(2, post);
            st.setString(3, "0");
            int i = st.executeUpdate();
            if(i != 0){
                isCreated = true;
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return isCreated;
    }
}
