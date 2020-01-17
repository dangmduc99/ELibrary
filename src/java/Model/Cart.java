/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Đặng Minh Đức
 */
public class Cart {
    private int cartId;
    private String userName;
    private int bookID;
    private String date;
    private int status;     //0 = chua muon, 1 = dang cho muon, 2 = san sang de muon
    Book book = null;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Cart() {
    }

    public Cart(String userName, int bookID, String date, int status) {
        this.userName = userName;
        this.bookID = bookID;
        this.date = date;
        this.status = status;
    }
    
    public Cart(int cartId, String userName, int bookID, String date, int status) {
        this.cartId = cartId;
        this.userName = userName;
        this.bookID = bookID;
        this.date = date;
        this.status = status;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
      
}
