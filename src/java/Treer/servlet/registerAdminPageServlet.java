/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.AccountDAO;
import Treer.dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Triệu
 */
public class registerAdminPageServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String password = request.getParameter("txtpassword");
            String phone = request.getParameter("txtphone");
            Account acc = null;
            try {
                acc = AccountDAO.getAccountsByEmail(email);
            } catch (Exception e) {
            }

            if (phone.matches("[a-zA-Z]") || acc != null) {
                request.setAttribute("email", email);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("ERROR", "Email Đã Được Sử Dụng");
                request.getRequestDispatcher("searchAccountServlet").forward(request, response);

            } else {
                int status = 1;
                int role = Integer.parseInt(request.getParameter("accRole"));
                try {
                    if (AccountDAO.insertAccountAdmin(name, email, password, role, phone, "", status)) {
                        request.setAttribute("email_newAccount", email);
                        RequestDispatcher rd = request.getRequestDispatcher("searchAccountServlet");
                        request.setAttribute("createSuccess", "ok");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect("errorpage.html");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
