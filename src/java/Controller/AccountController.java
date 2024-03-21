/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AccountDAO;
import Model.Account;
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
@WebServlet(name = "AccountController", urlPatterns = {"/account"})
public class AccountController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("accountMenu", "active");

        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("create")) {
                request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                return;
            }
            if (action.equals("edit")) {
                String AccountID = request.getParameter("AccountID");
                Account accountEdit = dao.getAccountToEdit(AccountID);
                request.setAttribute("accountEdit", accountEdit);
                request.getRequestDispatcher("EditAccount.jsp").forward(request, response);
                return;
            }
            if (action.equals("delete")) {
                String AccountID = request.getParameter("AccountID");
                dao.deleteAccount(AccountID);
                response.sendRedirect("account");
                return;
            }
        }

        ArrayList<Account> listAccount = dao.getListAccount();
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher("Account.jsp").forward(request, response);
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

        AccountDAO dao = new AccountDAO();
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("create")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String role = request.getParameter("role");
                String dob = request.getParameter("dob");
                String address = request.getParameter("address");
                String phonenumber = request.getParameter("phonenumber");
                String email = request.getParameter("email");

                Account checkUsername = dao.CheckUsername(username);
                if (checkUsername != null) {
                    request.setAttribute("usernameExists", "true");
                    request.getRequestDispatcher("CreateAccount.jsp").forward(request, response);
                    return;
                }
                dao.createAccount(username, password, name, role, dob, address, phonenumber, email);
                response.sendRedirect("account");
                return;
            }
            if (action.equals("edit")) {
                String AccountID = request.getParameter("AccountID");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String role = request.getParameter("role");
                String dob = request.getParameter("dob");
                String address = request.getParameter("address");
                String phonenumber = request.getParameter("phonenumber");
                String email = request.getParameter("email");

                dao.editAccount(username, password, name, role, dob, address, phonenumber, email, AccountID);
                response.sendRedirect("account");
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
