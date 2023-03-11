/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.PlantDAO;
import Treer.dto.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ducbui
 */
public class AddToCartServlet extends HttpServlet {

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
            
            String pid = request.getParameter("PID");
            Plant plant = PlantDAO.getPlantByPID(Integer.parseInt(pid.trim()));
            int stock = plant.getStock();

            // get session that is storing the shopping cart
            HttpSession session = request.getSession();

            if (session != null) {
                HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                if (cart == null) {   //chua co cart thi create new
                    cart = new HashMap<>();

                    if (stock > 0) {
                        cart.put(pid, 1);
                    } else {
                        String error = "Hết hàng";
                        response.sendRedirect("productDetailServlet?PID=" + pid + "&error=" + error);
                        return;
                    }
                } else {
                    //kiem tra xem san pham co trong cart chua
                    Integer tmp = cart.get(pid);
                    if (tmp == null) {
                        if (stock > 0) {
                            cart.put(pid, 1);
                        } else {
                            String error = "Hết hàng";
                            response.sendRedirect("productDetailServlet?PID=" + pid + "&error=" + error);
                            return;
                        }
                    } else {
                        if (tmp + 1 <= stock) {
                            cart.put(pid, tmp + 1);
                        } else {
                            String error = "Không đủ hàng";
                            response.sendRedirect("productDetailServlet?PID=" + pid + "&error=" + error);
                            return;
                        }
                    }
                }
                session.setAttribute("cart", cart);
                response.sendRedirect("index.jsp");
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
