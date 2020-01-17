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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Đặng Minh Đức
 */
public class BookBLL {

    public void addBook(Book book) throws NamingException, SQLException {
        String sql = "insert into book(bookTitle, bookAuthor, bookCategoryID, bookContent, bookImage) values (?, ?, ?, ?, ?)";
        insert(sql, book.getBookTitle(), book.getBookAuthor(), book.getBookCategoryID(), book.getBookContent(), book.getBookImage());
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

    public List<Book> getAllBook() throws NamingException {
        List<Book> listBook = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  book";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(Integer.toString(resultSet.getInt("bookID")));
                book.setBookTitle(resultSet.getString("bookTitle"));
                book.setBookAuthor(resultSet.getString("bookAuthor"));
                book.setBookCategoryID(resultSet.getInt("bookCategoryID"));
                book.setBookContent(resultSet.getString("bookContent"));
                book.setBookImage(resultSet.getString("bookImage"));

                listBook.add(book);
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
        return listBook;
    }

    public Book getBookByBookID(int bookID) throws NamingException {
        List<Book> listBook = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  book where bookID = '" +bookID+ "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(Integer.toString(resultSet.getInt("bookID")));
                book.setBookTitle(resultSet.getString("bookTitle"));
                book.setBookAuthor(resultSet.getString("bookAuthor"));
                book.setBookCategoryID(resultSet.getInt("bookCategoryID"));
                book.setBookContent(resultSet.getString("bookContent"));
                book.setBookImage(resultSet.getString("bookImage"));

                listBook.add(book);
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
        if (listBook == null || listBook.size() == 0) {
            return null;
        } else {
            return listBook.get(0);
        }
    }

    public List<Book> search(String keyWord) throws NamingException {
        List<Book> listResult = new ArrayList<>();
        Connection conn = null;
        PreparedStatement prepareStatement = null;
        ResultSet resultSet = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "select * from  book where bookID = '" + keyWord + "' or bookTitle ='" + keyWord + "' or bookAuthor ='" + keyWord + "' or bookContent ='" + keyWord + "'";
            prepareStatement = conn.prepareStatement(sql);
            setParameter(prepareStatement);
            resultSet = prepareStatement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book();
                book.setBookID(resultSet.getString("bookID"));
                book.setBookTitle(resultSet.getString("bookTitle"));
                book.setBookAuthor(resultSet.getString("bookAuthor"));
                book.setBookCategoryID(resultSet.getInt("bookCategoryID"));
                book.setBookContent(resultSet.getString("bookContent"));
                book.setBookImage(resultSet.getString("bookImage"));

                listResult.add(book);
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
        return listResult;
    }

    private void setParameter(PreparedStatement prepare, Object... parameters) {
        try {
            for (int i = 1; i <= parameters.length; i++) {
                Object parameter = parameters[i - 1];
                if (parameter instanceof String) {
                    prepare.setString(i, (String) parameter);
                } else if (parameter instanceof Integer) {
                    prepare.setInt(i, (Integer) parameter);
                } else if (parameter instanceof Date) {
                    prepare.setDate(i, (java.sql.Date) (Date) parameter);
                }
            }
        } catch (SQLException e) {
        }
    }
//    public List<Book> getNewBook(int number) throws NamingException {
//        try {
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "select top " + number + " * from book";
//            ResultSet rs = stm.executeQuery(sql);
//            ArrayList<Book> books = new ArrayList<>();
//            while (rs.next()) {
//                Book b = new Book();
//
//                b.setBookID(rs.getString("bookID"));
//                b.setBookTitle(rs.getString("bookTilte"));
//                b.setBookAuthor(rs.getString("bookAuthor"));
//                b.setBookCategoryID(rs.getInt("bookCategoryID"));
//                b.setBookContent(rs.getString("bookContent"));
//                b.setBookImage(rs.getString("bookImage"));
//
//                books.add(b);
//            }
//            System.out.println("Result: " + books.toString());
//            return books;
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        return null;
//    }
//
//    public List<Book> getAllBook() throws NamingException {
//        try {
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "select * from book";
//            ResultSet rs = stm.executeQuery(sql);
//            ArrayList<Book> books = new ArrayList<>();
//            while (rs.next()) {
//                Book b = new Book();
//
//                b.setBookID(rs.getString("bookID"));
//                b.setBookTitle(rs.getString("bookTilte"));
//                b.setBookAuthor(rs.getString("bookAuthor"));
//                b.setBookCategoryID(rs.getInt("bookCategoryID"));
//                b.setBookContent(rs.getString("bookContent"));
//                b.setBookImage(rs.getString("bookImage"));
//
//                books.add(b);
//            }
//            System.out.println("Result: " + books.toString());
//            return books;
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        return null;
//    }
//
//    public List<Book> getBookByCategory(int bookCategoryID) throws NamingException {
//        try {
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "select  b.* from book b join category c on(b.bookCategoryID = c.bookCategoryID) where c.bookCategoryID = '" + bookCategoryID + "'";
//            ResultSet rs = stm.executeQuery(sql);
//            ArrayList<Book> books = new ArrayList<>();
//            while (rs.next()) {
//                Book b = new Book();
//                Category c = new Category();
//
//                b.setBookID(rs.getString("bookID"));
//                b.setBookTitle(rs.getString("bookTilte"));
//                b.setBookAuthor(rs.getString("bookAuthor"));
//                c.setBookCategory(rs.getString("BookCategory"));
//                b.setBookCategoryID(rs.getInt("bookCategoryID"));
//                b.setBookContent(rs.getString("bookContent"));
//                b.setBookImage(rs.getString("bookImage"));
//
//                books.add(b);
//            }
//
//            return books;
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        return null;
//    }
//
//    public Book getBookByID(String bookID) throws NamingException {
//        try {
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "select * from book where bookID = '" + bookID + "'";
//            ResultSet rs = stm.executeQuery(sql);
//            Book b = new Book();
//            while (rs.next()) {
//
//                b.setBookID(rs.getString("bookID"));
//                b.setBookTitle(rs.getString("bookTilte"));
//                b.setBookAuthor(rs.getString("bookAuthor"));
//                b.setBookCategoryID(rs.getInt("bookCategoryID"));
//                b.setBookContent(rs.getString("bookContent"));
//                b.setBookImage(rs.getString("bookImage"));
//
//            }
//            return b;
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        return null;
//    }
//    
//    public List<Book> search(String keyWord) throws NamingException {
//        try {
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "select * from book where bookID = '" + keyWord + "' or bookTitle = '" +keyWord+ "' or bookAuthor ='" +keyWord+ "' ord bookContent ='" +keyWord+ "'";
//            ResultSet rs = stm.executeQuery(sql);
//            ArrayList<Book> books = new ArrayList<>();
//            Book b = new Book();
//            while (rs.next()) {
//
//                b.setBookID(rs.getString("bookID"));
//                b.setBookTitle(rs.getString("bookTilte"));
//                b.setBookAuthor(rs.getString("bookAuthor"));
//                b.setBookCategoryID(rs.getInt("bookCategoryID"));
//                b.setBookContent(rs.getString("bookContent"));
//                b.setBookImage(rs.getString("bookImage"));
//
//                books.add(b);
//
//            }
//            return books;
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//        return null;
//    }
//
//    public void addBook(Book book) throws NamingException {
//        try {
//
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "insert into book(bookID, bookTitle, bookAuthor, bookCategoryID, bookContent, bookImage) "
//                    + "values('" + book.getBookID() + "',"
//                    + book.getBookTitle() + ","
//                    + "'" + book.getBookAuthor() + "',"
//                    + "'" + book.getBookCategoryID() + "',"
//                    + "'" + book.getBookContent() + "',"
//                    + "'" + book.getBookImage() + ")";
//
//            stm.executeUpdate(sql);
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//    }
//
//    public void editBook(Book book) throws NamingException {
//        try {
//
//            Connection conn = DBConnect.connection;
//            Statement stm = conn.createStatement();
//            String sql = "update book "
//                    + "set bookID ='" + book.getBookID() + "',"
//                    + "bookTitle = '" + book.getBookTitle() + "',"
//                    + " bookAuthor ='" + book.getBookAuthor() + "',"
//                    + " bookCategoryID ='" + book.getBookCategoryID() + "',"
//                    + " bookContent ='" + book.getBookContent() + "',"
//                    + " bookImage ='" + book.getBookImage() + "'"
//                    + " where bookID = " + book.getBookID();
//            stm.executeUpdate(sql);
//        } catch (SQLException ex) {
//            System.out.println(ex.toString());
//        }
//    }
}
