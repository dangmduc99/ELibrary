/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ConnectionDB.BookBLL;
import ConnectionDB.CartBLL;
import ConnectionDB.CategoryBLL;
import Model.Book;
import Model.Cart;
import Model.Category;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Đặng Minh Đức
 */
public class SingleBookServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SingleBookServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SingleBookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookId = request.getParameter("bookid");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER");
        User user_current = (User) session.getAttribute("USER_CURRENT");
        Book book = null;
        Category category = null;
        try {
            book = new BookBLL().getBookByBookID(Integer.parseInt(bookId));
            category = new CategoryBLL().getCategoryById(book.getBookCategoryID());
            request.setAttribute("book", book);
            request.setAttribute("category", category);
        } catch (NamingException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (user != null) {
            request.setAttribute("USER", user);
        } else {
            if (user_current != null) {
                request.setAttribute("USER", user_current);
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/book.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Timestamp timestamp = new Timestamp(new Date().getTime());
        Cart cart = new Cart(userName, bookId, null, 0);
        try {
            new CartBLL().addCart(cart);
        } catch (NamingException ex) {
            Logger.getLogger(LibraryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibraryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/ELibrary3.0/book?bookid=" + bookId);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
