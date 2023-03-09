/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Treer.servlet;

import Treer.dao.AccountDAO;
import Treer.dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuank
 */
public class loginServlet extends HttpServlet {

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
            String password = request.getParameter("txtpassword");
            String save = request.getParameter("login");

            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie aCookie : c) {
                            if (aCookie.getName().equals("selector")) {
                                token = aCookie.getValue();
                            }
                        }
                    }
                    if (!token.equals("")) {
                        response.sendRedirect("index.jsp");
                    } else {
                        request.setAttribute("WARNING", "Email or Password uncorrect");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    Account acc = AccountDAO.getAccounts(email, password);
                    if (acc != null) {
                        if (acc.getRoleID() == 2) { //Check Role
                            //Chuyen qua admin home page
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getName());
                                session.setAttribute("email", email);
                                session.setAttribute("id", acc.getAccID());
                                //create a cookie and attach it to repone aobject
                                if (save != null) {
                                    String token = "ABC123"; //this is a sample to study
//                                    AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2);//this is a sample
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("AdminIndex.jsp");
                            }
                        } else {
                            //Chuyen qua welcome page
//                          response.sendRedirect("welcome.html");
                            HttpSession session = request.getSession(true);
                            if (session != null) {
                                session.setAttribute("name", acc.getName());
                                session.setAttribute("email", email);
                                session.setAttribute("id", acc.getAccID());
                                
                                if (save != null) {
                                    String token = "ABC123"; // this is a sample to study. 
//                                  AccountDAO.updateToken(token, email);
                                    Cookie cookie = new Cookie("selector", token);
                                    cookie.setMaxAge(60 * 2); //this is sample
                                    response.addCookie(cookie);
                                }
                                response.sendRedirect("index.jsp");
                            }
                        }
                    } else {
                        request.setAttribute("WARNING", "Email or Password uncorrect");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
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
