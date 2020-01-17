/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Đặng Minh Đức
 */
public class CartBLL {

    //lấy giỏ sách của bạn đọc
    public List<Cart> listCart(String userName) throws SQLException, NamingException {
        List<Cart> listCart = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Select * from cart where userName ='" + userName + "' and status = 0;";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

                Cart cart = new Cart();
                cart.setCartId(resultSet.getInt("cartId"));
                cart.setUserName(resultSet.getString("userName"));
                cart.setBookID(Integer.parseInt(resultSet.getString("bookID")));
                cart.setDate(resultSet.getString("date"));
                cart.setStatus(resultSet.getInt("status"));
                listCart.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listCart;
    }

    public void addCart(Cart cart) throws NamingException, SQLException {
        String sql = "insert into cart(userName, bookID, status) values (?, ?,  ?)";
        insert(sql, cart.getUserName(), cart.getBookID(), cart.getStatus());
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
    
    public void accept(int cartId, int status) throws NamingException, SQLException {
        String sql = "update cart set status=? where cartId=?";
        update(sql, status, cartId);
    }
    public void update(String query, Object... parameters) throws NamingException, SQLException { //cap nhat san pham va khong tra ve gi ca
        Connection connection = null;
        PreparedStatement prepareStatement = null;
        try {
            connection = DBConnect.getConnection();
            connection.setAutoCommit(false);
            prepareStatement = connection.prepareStatement(query);
            setParameter(prepareStatement, parameters);
            prepareStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            if(connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                }
            } else {
            } 
        } finally {
            try {
                connection.close();
                if (prepareStatement != null) {
                    prepareStatement.close();
                }
            } catch (SQLException e) {
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

    //admin
    //lay tat ca gio sach
    public List<Cart> listAllCart() throws SQLException, NamingException {
        List<Cart> listAllCart = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from cart";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                Cart cart = new Cart();
                cart.setCartId(resultSet.getInt("cartId"));
                cart.setUserName(resultSet.getString("userName"));
                cart.setBookID(Integer.parseInt(resultSet.getString("bookID")));
                cart.setDate(formatter.format(resultSet.getDate("date")));
                cart.setStatus(resultSet.getInt("status"));
                listAllCart.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listAllCart;
    }
    public List<Cart> getListCartByUserName(String userName) throws SQLException, NamingException {
        List<Cart> listAllCartByUserName = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from cart where userName='"+userName+"'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                Cart cart = new Cart();
                cart.setCartId(resultSet.getInt("cartId"));
                cart.setUserName(resultSet.getString("userName"));
                cart.setBookID(Integer.parseInt(resultSet.getString("bookID")));
                cart.setDate(formatter.format(resultSet.getDate("date")));
                cart.setStatus(resultSet.getInt("status"));
                listAllCartByUserName.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listAllCartByUserName;
    }

    //lấy danh sách sách đang chờ mượn của bạn đọc
    public List<Cart> listPending(String userName) throws SQLException, NamingException {
        List<Cart> listPending = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Select * from cart where userName ='" + userName + "' and status = 1;";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

                Cart cart = new Cart();
                cart.setUserName(resultSet.getString("userName"));
                cart.setBookID(resultSet.getInt("bookID"));
                cart.setDate(resultSet.getString("date"));
                cart.setStatus(resultSet.getInt("status"));
                listPending.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listPending;
    }

    //lấy danh sách sách đang mượn của bạn đọc
    public List<Cart> listBorrow(String userName) throws SQLException, NamingException {
        List<Cart> listBorrow = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Select * from cart where userName ='" + userName + "' and status = 2;";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

                Cart cart = new Cart();
                cart.setUserName(resultSet.getString("userName"));
                cart.setBookID(resultSet.getInt("bookID"));
                cart.setDate(resultSet.getString("date"));
                cart.setStatus(resultSet.getInt("status"));
                listBorrow.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listBorrow;
    }

    //thêm sách vào giỏ sách
    public void addToCart(String userName, String bookID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Insert into cart values ('" + userName + "', '"
                    + bookID + "', getDate(), 0)";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //xoá sách khỏi giỏ sách
    public void removeFromCart(String userName, String bookID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Delete from cart where userName = '" + userName + "' and BookID = '" + bookID + "' and status = 0";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //thêm sách mượn
    public void toBorrow(String userName) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Update cart set statusBorrow = 1 where userName = '"
                    + userName + "' and status = 0";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //đồng ý cho mượn
    //admin
    public void acceptBorrow(String userName, int bookID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "update cart set status = 2 where userName = '" + userName + "' and bookID = '" + bookID + "' and status = 1";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    //từ chối cho mượn
    //admin
    public void declineBorrow(String userName, String bookID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "Delete from cart where userName = '" + userName + "' and BookID = '" + bookID + "' and status = 0";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, userName);
            resultSet = prepareStatement.executeQuery();

            while (resultSet.next()) {

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
