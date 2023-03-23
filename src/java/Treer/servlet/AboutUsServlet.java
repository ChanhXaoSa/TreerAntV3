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
public class AboutUsServlet extends HttpServlet {

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

            String email = request.getParameter("txtemail");
            String name = request.getParameter("txtname");
            String title = request.getParameter("txttitle");
            String msg = request.getParameter("txtmsg");
            try {
                boolean isInserted = CusServiceDAO.insertCustomerService(email, name, title, msg);
                if (!isInserted) {
                    request.setAttribute("WARNING", "Đã xảy ra lỗi, vui lòng thử lại hoặc liên hệ trực tiếp qua email hoặc hotline để được giải đáp kịp thời!!");
                request.getRequestDispatcher("AboutUs.jsp").forward(request, response);
                    return;
                }

                //Send Email
                SendEmail send = new SendEmail();
                String emailTitle = "[Xác nhận đánh giá] - " + title;
                String emailContent = "<!DOCTYPE html>"
                        + "<html>"
                        + "  <body>"
                        + "    <h1>" + emailTitle + "!</h1>"
                        + "    <p>Chào bạn <strong>" + name + "</strong>,</p>"
                        + "    <p>Chúng tôi đã nhận được đánh giá của bạn và xin cảm ơn vì đã dành thời gian để chia sẻ"
                        + " ý kiến của mình với chúng tôi.</p>"
                        + "    <p>Chúng tôi rất quan tâm đến các đánh giá và phản hồi của khách hàng để cải thiện chất"
                        + " lượng dịch vụ của mình. Chúng tôi sẽ xem xét kỹ lưỡng đánh giá của bạn và sẽ phản hồi"
                        + " lại sớm nhất có thể.</p>\n"
                        + "    <p>Nếu bạn có bất kỳ yêu cầu hoặc câu hỏi nào khác, vui lòng liên hệ với chúng tôi qua địa"
                        + " chỉ email này hoặc số điện thoại trong thông tin liên hệ của chúng tôi.</p>\n"
                        + "    <p>Một lần nữa, chúng tôi xin chân thành cảm ơn bạn đã đánh giá và phản hồi về dịch vụ của chúng tôi"
                        + " và chúc bạn một ngày tốt lành.</p>"
                        + "    <p>Trân trọng,</p>"
                        + "    <p>Ban quản trị Treer</p>"
                        + "  </body>"
                        + "</html>";

                send.sendEmail(email, emailTitle, emailContent);

                request.setAttribute("WARNING", "Đã gửi thành công, chúng tôi sẽ phản hồi lại bạn sớm nhất!!");
                request.getRequestDispatcher("AboutUs.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
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
