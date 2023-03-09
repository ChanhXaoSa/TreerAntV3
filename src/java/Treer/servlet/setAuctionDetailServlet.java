/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.AccountDAO;
import Treer.dao.AuctionDAO;
import Treer.dao.AuctionDetailsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Triệu
 */
public class setAuctionDetailServlet extends HttpServlet {

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
            int accID = Integer.parseInt(request.getParameter("accountId"));
            int auctionId = Integer.parseInt(request.getParameter("auctionID"));
            int bidPrice = Integer.parseInt(request.getParameter("auctionPrice"));
            int lastBid = Integer.parseInt(request.getParameter("lastBid"));
            AuctionDAO.EndAuctionbyEndTime();
            if (bidPrice > lastBid) {
                try {
                    if (AuctionDAO.getAuctionbyID(auctionId).getStatus() == 1) {
                        AuctionDetailsDAO.insertAuctionDetail(auctionId, accID, bidPrice);
                        AuctionDAO.setEndPrice(bidPrice);
                        request.setAttribute("bigger", "ok");
                    } else if (AuctionDAO.getAuctionbyID(auctionId).getStatus() == 0) {
                        request.setAttribute("bigger", "end");
                    }
                } catch (Exception e) {
                    request.setAttribute("bigger", "error");
                }
            } else {
                request.setAttribute("bigger", "bigger");
            }
            request.getRequestDispatcher("Auction.jsp").forward(request, response);
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
