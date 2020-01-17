/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

/**
 *
 * @author Đặng Minh Đức
 */
public class SetAdmin {
    
    public boolean setAdmin (String userName) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Update users set isAdmin = 1 where userName ='" +userName+ "' and isAdmin = 0";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();
            if (resultSet.next()) {
                check = true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                conn.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return false;
            }
        }
        return check;
    }
        
    
    public boolean removeAdmin (String userName) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Update users set isAdmin = 1 where userName ='" +userName+ "' and isAdmin = 0";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();
            if (resultSet.next()) {
                check = true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                conn.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return false;
            }
        }
        return check;
    }
    
    private void setParameter(PreparedStatement prepare, Object... parameters) {
        try {
            for (int i = 1; i <= parameters.length; i++) {
                Object parameter = parameters[i - 1];
                if (parameter instanceof String) {
                    prepare.setString(i, (String) parameter);
                }
            }
        } catch (SQLException e) {
        }
    }
}

