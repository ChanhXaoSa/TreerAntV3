/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuank
 */
public class mainController extends HttpServlet {

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

        String url = "errorpage.html";
        String action = request.getParameter("action");

        if (action == null && action.equals("") && action.equals("search")) {
            url = "homeServlet";
        } else if (action.equals("login")) {
            url = "loginServlet";
        } else if (action.equals("register")) {
            url = "registerServlet";
        } else if (action.equals("reset")) {
            url = "resetPasswordServlet";
        } else if (action.equals("logout")) {
            url = "logoutServlet";
        } else if (action.equals("blog")) {
            url = "blogServlet";
        } else if (action.equals("search")) {
            url = "SearchServlet";

            //giỏ hàng, mua hàng 
        } else if (action.equals("addtocart")) {
            url = "AddToCartServlet";
        } else if (action.equals("viewcart")) {
            url = "viewCart.jsp";
        } else if (action.equals("update")) {
            url = "updateCartServlet";
        } else if (action.equals("delete")) {
            url = "deleteProductServlet";
        } else if (action.equals("muahang")) {
            url = "CheckLoginMuaHangServlet";
        } else if (action.equals("thanhtoan")) {
            url = "saveShoppingCartServlet";

            // phân trang personal - admin
        } else if (action.equals("switchPage")) {
            url = "switchPageServlet";

            // phần này của admin
        } else if (action.equals("manageAccounts")) {
            // sửa lại theo hàm search chuyển từ manager qua search Acc
            url = "searchAccountServlet";
        } else if (action.equals("banAccount")) {
            url = "updateStatusAccountServlet";
        } else if (action.equals("plantsManager")) {
            url = "plantsManagerServlet";
        } else if (action.equals("changeStatusPlant")) {
            url = "changeStatusPlantServlet";
        } else if (action.equals("backToAdminIndex")) {
            url = "backToAdminIndexServlet";
        } else if (action.equals("changePlantName")) {
            url = "changePlantNameServlet";
        } else if (action.equals("confirmCreateNewAccount")) {
            url = "confirmCreateNewAccountServlet";
        } else if (action.equals("registerAdminPage")) {
            url = "registerAdminPageServlet";
        } else if (action.equals("changePlantPrice")) {
            url = "changePlantPriceServlet";
        } else if (action.equals("changePlantDescription")) {
            url = "changePlantDescriptionServlet";
        } else if (action.equals("confirmCreateNewAuction")) {
            url = "confirmCreateNewAuctionServlet";
        } else if (action.equals("createNewAuction")) {
            url = "createNewAuctionServlet";
        } else if (action.equals("auctionPlantManager")) {
            url = "auctionPlantManagerServlet";
        } else if (action.equals("chooseAuctionPlant")) {
            url = "chooseAuctionPlantServlet";    
        } else if (action.equals("idAuctionPlantChoosen")) {
            url = "idAuctionPlantChoosenServlet";      
            
        } else if (action.equals("addNewPlant")) {
            url = "addNewPlantServlet";
            
            
            // phần này của user
        } else if (action.equals("personalPage")) {
            url = "personalPageServlet";
        } else if (action.equals("updateProfile")) {
            url = "updateProfileServlet";
        } else if (action.equals("completedOrders")) {
            url = "completedOrdersServlet";
        } else if (action.equals("orderDetail")) {
            url = "orderDetailServlet";
        } else if (action.equals("cancelOrder")) {
            url = "cancelOrdersServlet";
        } else if (action.equals("newFeedBack")) {
            url = "newFeedBackServlet";
        } else if (action.equals("processingOrders")) {
            url = "processingOrdersServlet";
        } else if (action.equals("All")) {
            url = "managerOrderServlet";
        } else if (action.equals("Profile")) {
            url = "ProfileServlet";
        } else if (action.equals("editProfile")) {
            url = "editProfileServlet";
        } else if (action.equals("personalWishList")) {
            url = "personalWishListServlet";
        } else if (action.equals("createComment")) {
            url = "createCommentServlet";
        } else if (action.equals("repComment")) {
            url = "repCommentServlet";

            // các hàm search
        } else if (action.equals("searchAccount")) {
            url = "searchAccountServlet";
        } else if (action.equals("searchOrder")) {
            url = "searchOrderServlet";
        } else if (action.equals("searchPlant")) {
            url = "searchPlantServlet";

            // update profile
        } else if (action.equals("updateProfile")) {
            url = "updateProfileServlet";
        } else if (action.equals("searchWithDate")) {
            url = "searchWithDateServlet";
        } else if (action.equals("AddPlant")) {
            url = "addPlant.jsp";
        } else if (action.equals("saveAddPlant")) {
            url = "saveAddPlantServlet";
        } else if (action.equals("UpdatePlant")) {
            url = "updatePlant.jsp";
        } else if (action.equals("SaveUpdatePlant")) {
            url = "SaveUpdatePlantServlet";
        } else if (action.equals("gui")) {
            url = "AboutUsServlet";

            //phần của trang đấu giá
        } else if (action.equals("ReloadActionPage")) {
            url = "ReloadActionPageServlet";
        } else if (action.equals("setAuctionDetail")) {
            url = "setAuctionDetailServlet";
        } else if (action.equals("auctionManager")) {
            url = "auctionManagerServlet";
        } else if (action.equals("changeAuctionStatus")) {
            url = "changeAuctionStatusServlet";
        } else if (action.equals("allAuctionShow")) {
            url = "allAuctionShowServlet";
        } else if (action.equals("processingAuctionShow")) {
            url = "processingAuctionShowServlet";
        } else if (action.equals("endAuctionShow")) {
            url = "endAuctionShowServlet";
        } else if (action.equals("joinedAuctionShow")) {
            url = "joinedAuctionShowServlet";
        }
        
        

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
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
