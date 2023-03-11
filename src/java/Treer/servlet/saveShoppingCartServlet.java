/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.OrderDAO;
import Treer.dao.PlantDAO;
import Treer.dto.Plant;
import Treer.dto.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ducbui
 */
public class saveShoppingCartServlet extends HttpServlet {

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
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            int totalmoney = (int) session.getAttribute("totalmoney");

            String AccID = request.getParameter("AccID");
            String CustomerName = request.getParameter("kh_ten");
            String CusAddress = request.getParameter("kh_diachi");
            String CusPhone = request.getParameter("kh_dienthoai");
            String PaymentMethod = request.getParameter("thanh-toan");

            if (!CusPhone.trim().matches("^[0]\\d{9}$")) {
                request.setAttribute("WARNING", "Invalid phone number!");
                request.getRequestDispatcher("saveShopping.jsp").forward(request, response);
            }

            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
            Set<String> pids = cart.keySet();
            int totalquantity = 0;
            for (String pid : pids) {
                int quantity = cart.get(pid);
                Plant plant = PlantDAO.getPlantByPID(Integer.parseInt(pid.trim()));
                int stock = plant.getStock();

                if (quantity > stock) {
                    request.setAttribute("WARNING", "Một hay nhiều sản phẩm trong giỏ hàng của bạn đã hết hoặc không đủ, vui lòng thử lại!!");
                    request.getRequestDispatcher("viewCart.jsp").forward(request, response);
                }
                totalquantity += quantity;
            }

            boolean result = OrderDAO.insertOrder(Integer.parseInt(AccID.trim()), cart, CusAddress, CusPhone, CustomerName, PaymentMethod, totalmoney);
            if (result) {

                // Gửi email thông báo tạo tài khoản thành công
                SendEmail emailSender = new SendEmail();
                String mailTile = "Thông báo tạo đơn hàng thành công";
//                String mailContent = "Cảm ơn " + CustomerName + " đã lựa chọn Treer để mua hàng. Treer cam kết đem đến cho khác hàng những dịch vụ tốt nhất trong khả năng của mình!!"
//                        + "Chi tiết đơn hàng: \n"
//                        + "\t Tên người nhận: " + CustomerName
//                        + "\t Số điện thoại người nhận: " + CusPhone
//                        + "\t Địa chỉ người nhận: " + CusAddress
//                        + "\t Thông tin thanh toán: " + PaymentMethod;
                String mailContent = "<!DOCTYPE html>"
                        + "<html>"
                        + "  <head>"
                        + "    <meta charset=\"UTF-8\" />"
                        + "    <title>Đơn hàng đã tạo thành công</title>"
                        + "  </head>"
                        + "  <body>"
                        + "    <h1>Đơn hàng đã tạo thành công!</h1>"
                        + "    <p>Chào bạn <strong>" + CustomerName + "</strong>,</p>"
                        + "    <p>Treer xin gửi email này để thông báo rằng đơn hàng của bạn"
                        + "đã được tạo thành công và sẽ được vận chuyển đến bạn trong "
                        + "vài ngày tới. Sau đây là chi tiết đơn hàng của bạn:"
                        + "    </p>"
                        + "    <p><strong style=\"font-size: 120%;\">Tên người nhận:           " + email + "</strong></p>\n"
                        + "    <p><strong style=\"font-size: 120%;\">Số điện thoại người nhận: " + CusPhone + "</strong></p>\n"
                        + "    <p><strong style=\"font-size: 120%;\">Địa chỉ người nhận:       " + CusAddress + "</strong></p>\n"
                        + "    <p><strong style=\"font-size: 120%;\">Tổng số món hàng:         " + totalquantity + " món hàng</strong></p>\n"
                        + "    <p>Chúng tôi rất cảm kích sự ủng hộ của bạn và cam kết cung cấp dịch vụ tốt nhất có thể. "
                        + "Nếu bạn có bất kỳ câu hỏi nào cần giúp đỡ, giải đáp, vui lòng liên hệ với chúng tôi qua email này "
                        + "hoặc liên hệ qua hotline: <strong style=\"font-size: 120%;\">(099) 9999 9999</strong>.</p>\n"
                        + "    <p>Một lần nữa, xin chân thành cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>\n"
                        + "    <p>Trân trọng,</p>"
                        + "    <p>Ban quản trị Treer</p>"
                        + "  </body>"
                        + "</html>";
                emailSender.sendEmail(email, mailTile, mailContent);

                session.setAttribute("cart", null);
                request.setAttribute("WARNING", "save your cart sucessfully");
                request.getRequestDispatcher("viewCart.jsp").forward(request, response);
            } else {
                request.setAttribute("WARNING", "these products are out of stock");
                request.getRequestDispatcher("viewCart.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(saveShoppingCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (MessagingException ex) {
            Logger.getLogger(saveShoppingCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (MessagingException ex) {
            Logger.getLogger(saveShoppingCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
