/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.AccountDAO;
import sample.dao.CartDAO;
import sample.dao.ProductDAO;
import sample.dto.AccountDTO;
import sample.dto.CartItemDTO;

/**
 *
 * @author ASUS
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "index.jsp";

    private static final String US_PAGE = "index.jsp";
    private static final String AD_PAGE = "adminHome.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            AccountDAO dao = new AccountDAO();
            AccountDTO account = dao.checkLogin(username, password);

            HttpSession session = request.getSession();

//            Ở đây muốn trả lỗi thì account phải null
            if (account == null) {
                request.setAttribute("ERROR_LOGIN", true);
            } else {
                String roleId = account.getRole().getRoleId().trim();

                if (roleId.equals("US")) {

                    int accountId = account.getAccountId();
                    CartDAO cart = new CartDAO();
                    List<CartItemDTO> cartItem = cart.getCartItem(accountId);
                    int totalItems = cartItem.size();

                    session.setAttribute("LOGIN", account);
                    session.setAttribute("TOTAL_ITEMS", totalItems);
                    session.setAttribute("ACCOUNT_ID", accountId);
                    session.setAttribute("ITEM_LIST", cartItem);
                    
                    session.setAttribute("ROLE_ID", roleId);

                    url = US_PAGE;
                } else if (roleId.equals("AD")) {
                    session.setAttribute("ROLE_ID", roleId);

                    url = AD_PAGE;
                }

            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);

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
