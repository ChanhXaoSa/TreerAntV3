/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.OrderDAO;
import Treer.dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuank
 */
public class managerOrderServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            int accid = (int) session.getAttribute("accid");
            String button = request.getParameter("button");
            session.setAttribute("selectedOption", button);
            String from = request.getParameter("from");
            String to = request.getParameter("to");

            ArrayList<Order> list = null;
            int status = 0;

            if (button.equalsIgnoreCase("confirm")) {
                status = 1;
            } else if (button.equalsIgnoreCase("completed")) {
                status = 2;
            } else if (button.equalsIgnoreCase("cancel")) {
                status = 3;
            }

            if (status == 0 && from.equals("") && to.equals("")) {
                list = OrderDAO.getAllOrders(accid);
            } else if (status != 0 && from.equals("") && to.equals("")) {
                list = OrderDAO.getOrderWithStatus(accid, status);
            } else if (status == 0){
                list = OrderDAO.getAllOrdersWithDate(accid, from, to);
            } else if (status != 0){
                list = OrderDAO.getOrderWithStatusAndDate(accid, status, from, to);
            }

            request.setAttribute("OrderList", list);

            request.getRequestDispatcher("personalpage.jsp").forward(request, response);
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
