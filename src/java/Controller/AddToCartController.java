/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.BookDAO;
import Model.Book;
import Model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DPV
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/add-to-cart"})
public class AddToCartController extends HttpServlet {

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
            out.println("<title>Servlet AddToCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartController at " + request.getContextPath() + "</h1>");
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
        String BookID = request.getParameter("BookID");
        String urlPrev = (String) request.getSession().getAttribute("urlPrev");
        Map<String, Cart> carts = (Map<String, Cart>) request.getSession().getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("clear")) {
                request.getSession().removeAttribute("carts");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("delete-cart")) {

                if (carts.containsKey(BookID)) {
                    carts.remove(BookID);
                }
                request.getSession().setAttribute("carts", carts);
                response.sendRedirect(urlPrev);
                return;
            }
        }
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
        String BookID = request.getParameter("BookID");
        BookDAO dao = new BookDAO();
        String urlPrev = (String) request.getSession().getAttribute("urlPrev");

        Map<String, Cart> carts = (Map<String, Cart>) request.getSession().getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        if (carts.containsKey(BookID)) {
            response.sendRedirect(urlPrev);
            return;
        } else {
            Book book = dao.getBookToEdit(BookID);
            Cart newCart = new Cart(book);
            carts.put(BookID, newCart);
        }
        request.getSession().setAttribute("carts", carts);
        response.sendRedirect(urlPrev);
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
