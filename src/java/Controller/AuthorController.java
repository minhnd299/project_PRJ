/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AuthorDAO;
import Model.Author;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DPV
 */
@WebServlet(name = "AuthorController", urlPatterns = {"/author"})
public class AuthorController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthorController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthorController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("authorMenu", "active");

        AuthorDAO dao = new AuthorDAO();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("delete")) {
                String AuthorID = request.getParameter("AuthorID");
                dao.deleteAuthor(AuthorID);
                response.sendRedirect("author");
                return;
            }
        }

        ArrayList<Author> listAuthor = dao.getListAuthor();
        request.setAttribute("listAuthor", listAuthor);
        request.getRequestDispatcher("Author.jsp").forward(request, response);
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        AuthorDAO dao = new AuthorDAO();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("create")) {
                String authorid = request.getParameter("authorid");
                String authorname = request.getParameter("authorname");
                String note = request.getParameter("note");
                dao.createAuthor(authorid, authorname, note);
                response.sendRedirect("author");
                return;
            }
            if (action.equals("edit")) {
                String authorid = request.getParameter("authorid");
                String authorname = request.getParameter("authorname");
                String note = request.getParameter("note");
                dao.editAuthor(authorid, authorname, note);
                response.sendRedirect("author");
                return;
            }
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
