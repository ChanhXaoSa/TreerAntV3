/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.CusServiceDAO;
import Treer.dto.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ducbui
 */
public class responseServlet extends HttpServlet {

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

            String CustSerID = request.getParameter("CustSerID");
            String CusName = request.getParameter("CusName");
            String CustEmail = request.getParameter("emailReceiver");
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            //Admin
            String adminName = (String) request.getSession().getAttribute("name");
            
            boolean update = CusServiceDAO.updateCustomerService(Integer.parseInt(CustSerID.trim()), content);
            if (!update) {
                throw new Exception();
            }

            SendEmail send = new SendEmail();
            String mailContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "  <body>"
                    + "    <h1>" + title + "!</h1>"
                    + "    <p>Chào bạn <strong>" + CusName + "</strong>,</p>"
                    + "    <p>Tôi là " + adminName + ", đại diện cho đội ngũ chăm sóc khách hàng của Treer."
                    + " Tôi xin chân thành cảm ơn bạn đã liên hệ và gửi thông tin đến chúng tôi."
                    + "    </p>"
                    + "    <p>Đây là phản hồi của chúng tôi về vấn đề bạn đã đề cập:</p>\n"
                    + "    <p><strong>" + content + "</strong></p>\n"
                    + "    <p>Chúng tôi rất cảm kích sự ủng hộ của bạn và cam kết cung cấp dịch vụ tốt nhất có thể. "
                    + "Nếu bạn có bất kỳ câu hỏi nào cần giúp đỡ, giải đáp nào nữa, vui lòng liên hệ với chúng tôi qua email này "
                    + "hoặc liên hệ qua hotline: <strong style=\"font-size: 120%;\">(099) 9999 9999</strong>. Đội ngũ "
                    + "chăm sóc khách hàng của chúng tôi sẽ luôn sẵn sàng hỗ trợ bạn trong quá trình sử dụng sản phẩm "
                    + "và dịch vụ của chúng tôi.</p>\n"
                    + "    <p>Một lần nữa, tôi xin cảm ơn bạn đã liên hệ và chúc bạn một ngày tốt lành.</p>"
                    + "    <p>Trân trọng,</p>"
                    + "    <p>" + adminName + " - Ban quản trị Treer</p>"
                    + "  </body>"
                    + "</html>";

            send.sendEmail(CustEmail, title, mailContent);

            request.setAttribute("WARNING", "Đã gửi mail hoàn tất!!!");
            request.getRequestDispatcher("replyCustService.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("WARNING", "Đã xảy ra lỗi khi gửi mail. Vui lòng thử lại sau!!!");
            request.getRequestDispatcher("replyCustService.jsp").forward(request, response);
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
