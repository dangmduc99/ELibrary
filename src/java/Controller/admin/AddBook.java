/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import ConnectionDB.CartBLL;
import ConnectionDB.CategoryBLL;
import Model.Book;
import Model.Cart;
import Model.Category;
import Model.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Đặng Minh Đức
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddBook extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "bookImage";

    public AddBook() {
        super();
    }

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
            out.println("<title>Servlet AddBook</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBook at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("add", true);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || user.getIsAdmin() != 1) {
            response.sendRedirect("login");
        } else {
            Book book = new Book();
            book.setBookID(request.getParameter("bookID"));
            book.setBookTitle(request.getParameter("bookTitle"));
            book.setBookAuthor(request.getParameter("bookAuthor"));
            book.setBookCategoryID(Integer.parseInt(request.getParameter("bookCategoryID")));
            book.setBookContent(request.getParameter("bookContent"));

            try {
                // Đường dẫn tuyệt đối tới thư mục gốc của web app.
                String appPath = request.getServletContext().getRealPath("");
                appPath = appPath.replace('\\', '/');

                // Thư mục để save file tải lên.
                String fullSavePath = null;
                if (appPath.endsWith("/")) {
                    fullSavePath = appPath + SAVE_DIRECTORY;
                } else {
                    fullSavePath = appPath + "/" + SAVE_DIRECTORY;
                }

                // Tạo thư mục nếu nó không tồn tại.
                File fileSaveDir = new File(fullSavePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }

                // Danh mục các phần đã upload lên (Có thể là nhiều file).
                for (Part part : request.getParts()) {
                    String fileName = extractFileName(part);
                    if (fileName != null && fileName.length() > 0) {
                        String filePath = fullSavePath + File.separator + fileName;
                        System.out.println("Write attachment to file: " + filePath);

                        // Ghi vào file.
                        part.write(filePath);
                    }
                }

                // Upload thành công.
                response.sendRedirect(request.getContextPath() + "/library");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error: " + e.getMessage());
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addBook.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    private String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
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
