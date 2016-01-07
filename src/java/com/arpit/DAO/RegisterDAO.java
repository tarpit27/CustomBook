package com.arpit.DAO;

import com.arpit.classes.Connector;
import com.arpit.classes.UserBean;
import java.sql.*;

/**
 *
 * @author megha
 */
public class RegisterDAO {

    private static Connection con = null;

    public static UserBean isRegister(UserBean bean) {
        con = Connector.getConnection();
        String createTable = "create table if not exists users("
                + "id int not null auto_increment primary key,"
                + "firstName varchar(100),"
                + "lastName varchar(100),"
                + "email varchar(100),"
                + "password varchar(50),"
                + "gender varchar(7)"
                + ");";

        String sql = "insert into users(firstName,lastName,email,password,gender) values(?,?,?,?,?);";
        String sqlId = "select * from users where email = ? and password = ?;";
        String sql3 = "insert into isRead(id) values(?);";

        try {
            PreparedStatement st = con.prepareStatement(createTable);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, bean.getFirstName());
            st.setString(2, bean.getLastName());
            st.setString(3, bean.getEmail());
            st.setString(4, bean.getPassword());
            st.setString(5, bean.getGender());

            int i = st.executeUpdate();

            PreparedStatement st2 = con.prepareStatement(sqlId);
            st2.setString(1, bean.getEmail());
            st2.setString(2, bean.getPassword());
            if (i != 0) {
                ResultSet rs = st2.executeQuery();
                boolean more = rs.next();

                if (more) {
                    bean.setFirstName(rs.getString("firstName"));
                    bean.setLastName(rs.getString("lastName"));
                    bean.setId(rs.getString("id"));
                    bean.setIsValid(true);

                    PreparedStatement st3 = con.prepareStatement(sql3);
                    st3.setString(1, bean.getId());
                    st3.executeUpdate();
                }
                bean.setIsValid(true);
            }
            st.close();
            st2.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
