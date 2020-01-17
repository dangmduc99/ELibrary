/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import ConnectionDB.CartBLL;
import ConnectionDB.CategoryBLL;
import Controller.BorrowServlet;
import Model.Cart;
import Model.Category;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class AcceptBorrow extends HttpServlet {

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
            out.println("<title>Servlet AcceptBorrow</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptBorrow at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER");
        User user_current = (User) session.getAttribute("USER_CURRENT");
        if (user != null) {
            request.setAttribute("USER", user);
        } else {
            if (user_current != null) {
                request.setAttribute("USER", user_current);
            }
        }
        List<Cart> listCart = new ArrayList<>();
        List<Category> listCategory = null;
        try {
            listCart = new CartBLL().listAllCart();
            listCategory = new CategoryBLL().getBookCategory();
        } catch (SQLException ex) {
            Logger.getLogger(AcceptBorrow.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AcceptBorrow.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("listCart", listCart);
        request.setAttribute("accept", true);
        request.setAttribute("listCategories", listCategory == null ? null : listCategory);
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/home.jsp");

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
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        String accept = request.getParameter("accept");
        try {
            if (accept.equals("true")) {
                new CartBLL().accept(cartId, 1);
            } else if (accept.equals("false")) {
                new CartBLL().accept(cartId, 0);
            }

        } catch (NamingException ex) {
            Logger.getLogger(AcceptBorrow.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AcceptBorrow.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/ELibrary3.0/accept");
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
