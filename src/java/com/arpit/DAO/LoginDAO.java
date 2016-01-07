
package com.arpit.DAO;

import com.arpit.classes.Connector;
import com.arpit.classes.UserBean;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author megha
 */
public class LoginDAO {
    
    public static UserBean checkLogin(UserBean bean){
        Connection con = Connector.getConnection();
        String sql = "select * from users where email=? and password=?;";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, bean.getEmail());
            st.setString(2, bean.getPassword());
            ResultSet rs = st.executeQuery();
            boolean more = rs.next();
            
            if(more){
                bean.setFirstName(rs.getString("firstName"));
                bean.setLastName(rs.getString("lastName"));
                bean.setId(rs.getString("id"));
                bean.setIsValid(true);
            }        
            rs.close();
            st.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bean;
    }
}
