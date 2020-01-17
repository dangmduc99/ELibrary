/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Đặng Minh Đức
 */
public class Login {
    public User checkLogin(String userName, String userPassword) throws NamingException, SQLException {
        
        List<User> users = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  users where userName ='" + userName + "' and userPassword ='" + userPassword + "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName, userPassword);
            resultSet = prepareStatement.executeQuery();
            while(resultSet.next()) {
                User userModel = new User(resultSet.getString("userName"), resultSet.getString("userPassword"), resultSet.getString("userFullname"),
                resultSet.getString("userPhone"), resultSet.getString("userEmail"), resultSet.getString("userAddress"), resultSet.getInt("isAdmin"));
                users.add(userModel);
            }
            if(users == null || users.size() == 0) {
                return null;
            } else {
                return users.get(0);
            }
        } catch (SQLException e) {
            return null;
        } finally {
            try {
                conn.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if(resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }
    private void setParameter(PreparedStatement prepare, Object... parameters) {
        try {
            for(int i = 1; i<=parameters.length; i++) {
                Object parameter = parameters[i-1];
                if(parameter instanceof String) {
                    prepare.setString(i, (String) parameter);
                }
            }
        } catch (SQLException e) {
        }
    }
}
