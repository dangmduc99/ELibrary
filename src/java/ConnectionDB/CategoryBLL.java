/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConnectionDB;

import Model.Book;
import Model.Category;
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
public class CategoryBLL {

    public List<Category> getBookCategory() throws NamingException, SQLException {
        
        List<Category> categories = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  category";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                Category c = new Category(resultSet.getInt("bookCategoryId"), resultSet.getString("bookCategory"));
                categories.add(c);
            }
            return categories;
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
    }
    
    public boolean addCategory (String bookCategory) throws NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "insert into category (bookCategory) values ('" +bookCategory+"');";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement, bookCategory);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                check = true;
            }
        } catch (SQLException e) {
            return check;
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
                return true;
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
    public Category getCategoryById(int categoryId) throws NamingException {
        List<Category> listCategory = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  category where bookCategoryID = '" +categoryId+ "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setBookCategoryID(resultSet.getInt("bookCategoryID"));
                category.setBookCategory(resultSet.getString("bookCategory"));

                listCategory.add(category);
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
        if (listCategory == null || listCategory.size() == 0) {
            return null;
        } else {
            return listCategory.get(0);
        }
    }
    
}
