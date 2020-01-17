/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.admin;

import ConnectionDB.BookBLL;
import Model.Book;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Đặng Minh Đức
 */
@WebServlet(name = "adminAPIi", urlPatterns = {"/admin-api"})
public class AdminAPI extends HttpServlet {

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
            out.println("<title>Servlet adminAPIi</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminAPIi at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        Book book = new Book();
        if(isMultipart) {
            
            ServletFileUpload upload = new ServletFileUpload();
            try {
                FileItemIterator itr = upload.getItemIterator(request);
                while(itr.hasNext()) {
                    FileItemStream item = itr.next();
                    if(item.isFormField()) {
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b = new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        if(fieldName.equals("bookTitle")) {
                            book.setBookTitle(value);
                        } else if(fieldName.equals("bookAuthor")) {
                            book.setBookAuthor(value);
                        } else if(fieldName.equals("bookCategoryID")) {
                            book.setBookCategoryID(Integer.parseInt(value));
                        } else if(fieldName.equals("bookContent")) {
                            book.setBookContent(value);
                        }
                        response.getWriter().println(fieldName+": "+value);
                    } else {
                        String path = "C:\\Users\\dangm\\OneDrive\\Documents\\NetBeansProjects\\11Shop\\ELibrary3.0\\web\\images\\";
                        if(processFile(path, item)) {
                            book.setBookImage(item.getName());
                            response.getWriter().println("uploaded successfully" + path + item.getName()); 
                        } else {
                            response.getWriter().println("uploaded fail"); 
                           
                        }
                    }
                } 
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
        try {
            new BookBLL().addBook(book);
        } catch (NamingException ex) {
            Logger.getLogger(AdminAPI.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/ELibrary3.0/home");
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
    
    public boolean processFile(String path, FileItemStream item) {
        try {
            File f = new File(path + File.separator + "imagesUpload");
            if(!f.exists()) {
                f.mkdir();
            }
            File savedFile = new File(f.getAbsolutePath() + File.separator + item.getName());
            FileOutputStream fos = new FileOutputStream(savedFile);
            InputStream is = item.openStream();
            int x = 0;
            byte[] b = new byte[1024];
            while((x=is.read(b)) != -1) {
                fos.write(b, 0, x);
                 
            }
            fos.flush();
            fos.close();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
}
