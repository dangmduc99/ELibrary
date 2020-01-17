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
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Đặng Minh Đức
 */
public class Signup {

    public boolean checkExist(String userName) throws NamingException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  users where userName ='" + userName + "'";
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

    public void addUser(User user) throws NamingException, SQLException {
        String sql = "insert into users(userName, userPassword, userFullname, userPhone, userEmail, userAddress, isAdmin) values (?, ?, ?, ?, ?, ?, 0)";
        insert(sql, user.getUserName(), user.getUserPassword(), user.getUserFullname(), user.getUserPhone(), user.getUserEmail(), user.getUserAddress(), user.getIsAdmin());
    }

    public User getUserByUserId(int userId) throws NamingException {
        List<User> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  users where userId = '" + userId + "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUserId(resultSet.getInt("userId"));
                user.setUserName(resultSet.getString("userName"));
                user.setUserPassword(resultSet.getString("userPassword"));
                user.setUserEmail(resultSet.getString("userEmail"));
                user.setIsAdmin(resultSet.getInt("isAdmin"));
                user.setUserFullname(resultSet.getString("userFullname"));
                user.setUserPhone(resultSet.getString("userPhone"));
                user.setUserAddress(resultSet.getString("userAddress"));

                listUser.add(user);
            }
        } catch (SQLException e) {
            return null;
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
                return null;
            }
        }
        if (listUser == null || listUser.size() == 0) {
            return null;
        } else {
            return listUser.get(0);
        }
    }
    public User getUserByUserName(String userName) throws NamingException {
        List<User> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  users where userName = '" + userName + "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUserId(resultSet.getInt("userId"));
                user.setUserName(resultSet.getString("userName"));
                user.setUserPassword(resultSet.getString("userPassword"));
                user.setUserEmail(resultSet.getString("userEmail"));
                user.setIsAdmin(resultSet.getInt("isAdmin"));
                user.setUserFullname(resultSet.getString("userFullname"));
                user.setUserPhone(resultSet.getString("userPhone"));
                user.setUserAddress(resultSet.getString("userAddress"));

                listUser.add(user);
            }
        } catch (SQLException e) {
            return null;
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
                return null;
            }
        }
        if (listUser == null || listUser.size() == 0) {
            return null;
        } else {
            return listUser.get(0);
        }
    }

    public Integer insert(String query, Object... parameters) throws NamingException, SQLException { // de them san pham, tra ve id san pham da them
        ResultSet resultSet = null;
        Integer id = null;
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        try {
            connection = DBConnect.getConnection();
            connection.setAutoCommit(false);
            prepareStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            setParameter(prepareStatement, parameters);
            prepareStatement.executeUpdate();
            resultSet = prepareStatement.getGeneratedKeys();
            if (!resultSet.next()) {
            } else {
                id = resultSet.getInt(1);
            }
            connection.commit();
            return id;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                }
            } else {
            }
            return null;
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
            } catch (SQLException e) {
                return null;
            }
        }
    }

    private void setParameter(PreparedStatement prepare, Object... parameters) {
        try {
            for (int i = 1; i <= parameters.length; i++) {
                Object parameter = parameters[i - 1];
                if (parameter instanceof String) {
                    prepare.setString(i, (String) parameter);
                } else if (parameter instanceof Timestamp) {
                    prepare.setTimestamp(i, Timestamp.valueOf(LocalDateTime.now()));
                } else if (parameter instanceof Integer) {
                    prepare.setInt(i, (Integer) parameter);
                } else if (parameter == null) {
                    prepare.setNull(i, Types.NULL);
                }
            }
        } catch (SQLException e) {
        }
    }
}
