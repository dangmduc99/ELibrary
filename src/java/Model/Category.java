/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Đặng Minh Đức
 */
public class Category implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int bookCategoryID;
    private String bookCategory;

    public Category() {
        
    }

    public Category(int bookCategoryID, String bookCategory) {
        this.bookCategoryID = bookCategoryID;
        this.bookCategory = bookCategory;
    }
    
    
    public Category(int bookCategoryID){
        this.bookCategoryID = bookCategoryID;
    }

    public int getBookCategoryID() {
        return bookCategoryID;
    }

    public void setBookCategoryID(int bookCategoryID) {
        this.bookCategoryID = bookCategoryID;
    }
    
    

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }
    
    @Override
    public String toString() {
        return "ConnectionDB.Category[ bookCategoryID = " + bookCategoryID + " ]";
    }
    
}
