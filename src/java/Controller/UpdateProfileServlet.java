/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ConnectionDB.CategoryBLL;
import ConnectionDB.Update_Profile;
import Model.Category;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class UpdateProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfileServlet at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("/updateProfile.jsp");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER");
        User user_current = (User) session.getAttribute("USER_CURRENT");
        if (user_current != null) {
            request.setAttribute("USER", user_current);
            
        }
//            user.setUserName("userName");
        //           user.setUserPassword(request.getParameter("userPassword"));
        //         user.setUserFullname(request.getParameter("userFullname"));
        //          user.setUserPhone(request.getParameter("userPhone"));
        //          user.setUserEmail(request.getParameter("userEmail"));
        //           user.setUserAddress(request.getParameter("userAddress"));

        try {
            request.setCharacterEncoding("UTF-8");
            User new_user = new User();
            new_user.setUserName(user_current.getUserName());
            new_user.setUserPassword(user_current.getUserPassword());
            new_user.setUserFullname(request.getParameter("userFullname").trim());
            new_user.setUserPhone(request.getParameter("userPhone").trim());
            new_user.setUserEmail(request.getParameter("userEmail").trim());
            new_user.setUserAddress(request.getParameter("userAddress").trim());
            if(new_user.getUserFullname() != null && !new_user.getUserFullname().equals("") && new_user.getUserEmail()!= null && !new_user.getUserEmail().equals("") && new_user.getUserPhone() != null && !new_user.getUserPhone().equals("") && new_user.getUserAddress()!= null && !new_user.getUserAddress().equals("")) {
                new Update_Profile().updateProfile(new_user);
                session.setAttribute("USER", new_user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/updateProfile.jsp");
                getServletContext().setAttribute("message", "Updated successfully");
                getServletContext().setAttribute("success", "1");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/updateProfile.jsp");
                getServletContext().setAttribute("message", "Updated failed");
                dispatcher.forward(request, response);
            }
               
        } catch (NamingException ex) {
            Logger.getLogger(UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
