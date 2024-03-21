/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AuthorDAO;
import DAL.BookDAO;
import DAL.CategoryDAO;
import DAL.PublisherDAO;
import Model.Author;
import Model.Book;
import Model.Category;
import Model.Publisher;
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
@WebServlet(name = "BookController", urlPatterns = {"/book"})
public class BookController extends HttpServlet {

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
            out.println("<title>Servlet BookController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookController at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("bookMenu", "active");

        BookDAO daoBook = new BookDAO();
        AuthorDAO daoAuthor = new AuthorDAO();
        CategoryDAO daoCategory = new CategoryDAO();
        PublisherDAO daoPublisher = new PublisherDAO();

        ArrayList<Book> listBook = daoBook.getListBook();
        ArrayList<Author> listAuthor = daoAuthor.getListAuthor();
        ArrayList<Category> listCategory = daoCategory.getListCategory();
        ArrayList<Publisher> listPublisher = daoPublisher.getListPublisher();

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("create")) {
                request.setAttribute("listAuthor", listAuthor);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listPublisher", listPublisher);
                request.getRequestDispatcher("CreateBook.jsp").forward(request, response);
                return;
            }
            if (action.equals("edit")) {
                String BookID = request.getParameter("BookID");
                Book bookEdit = daoBook.getBookToEdit(BookID);
                request.setAttribute("bookEdit", bookEdit);
                request.setAttribute("listAuthor", listAuthor);
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listPublisher", listPublisher);
                request.getRequestDispatcher("EditBook.jsp").forward(request, response);
                return;
            }
            if (action.equals("delete")) {
                String BookID = request.getParameter("BookID");
                daoBook.deleteBook(BookID);
                response.sendRedirect("book");
                return;
            }
        }

        request.setAttribute("listAuthor", listAuthor);
        request.setAttribute("listBook", listBook);
        request.getRequestDispatcher("Book.jsp").forward(request, response);
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

        BookDAO daoBook = new BookDAO();
        AuthorDAO daoAuthor = new AuthorDAO();
        CategoryDAO daoCategory = new CategoryDAO();
        PublisherDAO daoPublisher = new PublisherDAO();

        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("create")) {
                String BookID = request.getParameter("BookID");
                String BookName = request.getParameter("BookName");
                String AuthorID = request.getParameter("AuthorID");
                String CategoryID = request.getParameter("CategoryID");
                String PublisherID = request.getParameter("PublisherID");
                String PublishYear = request.getParameter("PublishYear");
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                double Price = Double.parseDouble(request.getParameter("Price"));

                daoBook.createBook(BookID, BookName, AuthorID, CategoryID, PublisherID, PublishYear, Quantity, Price);
                response.sendRedirect("book");
                return;
            }
            if (action.equals("edit")) {
                String BookID = request.getParameter("BookID");
                String BookName = request.getParameter("BookName");
                String AuthorID = request.getParameter("AuthorID");
                String CategoryID = request.getParameter("CategoryID");
                String PublisherID = request.getParameter("PublisherID");
                String PublishYear = request.getParameter("PublishYear");
                int Quantity = Integer.parseInt(request.getParameter("Quantity"));
                double Price = Double.parseDouble(request.getParameter("Price"));

                daoBook.editBook(BookID, BookName, AuthorID, CategoryID, PublisherID, PublishYear, Quantity, Price);
                response.sendRedirect("book");
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
