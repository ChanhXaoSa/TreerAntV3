/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.AccountDAO;
import Treer.dto.Account;
import Treer.dto.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuank
 */
public class registerServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            // lấy giá trị từ trang regis
            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String password = request.getParameter("txtpassword");
            String phone = request.getParameter("txtphone");

            Account acc = AccountDAO.getAccountsByEmail(email);

            if (phone.matches("[a-zA-Z]") || acc != null) {
                request.setAttribute("email", email);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("ERROR", "Email has been used");
                request.getRequestDispatcher("regis.jsp").forward(request, response);

            } else {
                int status = 1;
                int role = 1;
                try {
                    if (AccountDAO.insertAccounts(name, email, password, role, phone, "", status)) {

                        // Gửi email thông báo tạo tài khoản thành công
                        SendEmail emailSender = new SendEmail();
                        String mailTile = "Thông báo tạo tài khoản thành công";
                        String mailContent = "<!DOCTYPE html>"
                                + "<html>"
                                + "  <head>"
                                + "    <meta charset=\"UTF-8\" />"
                                + "    <title>Chào mừng đến với Treer</title>"
                                + "  </head>"
                                + "  <body>"
                                + "    <h1>Chào mừng bạn đến với Treer!</h1>"
                                + "    <p>Xin chào <strong>" + name + "</strong>,</p>"
                                + "    <p>Tài khoản của bạn đã được tạo thành công với địa chỉ email <strong>" + email + "</strong>.</p>"
                                + "    <p>Cảm ơn bạn đã đăng ký và tham gia cùng chúng tôi.</p>"
                                + "    <p>Trân trọng,</p>"
                                + "    <p>Ban quản trị Treer</p>"
                                + "  </body>"
                                + "</html>";
//                        String mailContent = "Chào mừng " + name + " đến với Treer, tài khoản của bạn đã được tạo thành công.";
                        emailSender.sendEmail(email, mailTile, mailContent);

                        request.setAttribute("email_newAccount", email);
                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                        request.setAttribute("WARNING", "Đã đăng kỹ tài khoản thành công, vui lòng đăng nhập lại để sử dụng!!!");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(registerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
